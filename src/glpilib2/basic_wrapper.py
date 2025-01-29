#!/usr/bin/env python3
import inspect
import json
import logging
import re

from dataclasses import dataclass
from enum import Enum
from json import JSONDecodeError
from typing import Dict, Optional, Any, List, Tuple, Union, IO

import requests

logging.basicConfig(
    level=logging.WARNING, format="%(asctime)s: %(name)s: %(levelname)s: %(message)s"
)
logger = logging.getLogger("glpi_wrapper")

JSON = Dict[str, Any]


class SortOrder(Enum):
    """Handy :class:`~enum.Enum` for ordering queries.

    Attributes
    ----------

    Ascending
    Desceding
    """

    Ascending = "ASC"
    Descending = "DESC"

    def __str__(self):
        return self.value


@dataclass
class ResponseRange:
    """Range of a query.

    Some API methods produce a response in the header that describe the range of
    the query. That data is collected and wrapped in this type of object.
    To obtain it use the :meth:`~RequestHandler.response_range`
    property of :class:`RequestHandler`.

    Attributes
    ----------
    start: int
        The query was retrieved begining on the `start` number.
    end: int
        The query was retrieved with no elements after `end` number.
    count: int
        Number of items returned.
    max: int
        Maximum possible number of items for this item type.
    """

    start: int
    end: int
    count: int
    max: int

    def __repr__(self):
        return f"{str(self.start)}-{str(self.start)}/{self.count} Max: {self.max}"


class GLPIError(Exception):
    """Base glpilib2 exception"""

    pass


class GLPIRequestError(GLPIError):
    """Request error.

    In some circumstances GLPI doesn't have a specific error message for a method. This exception is raised in those
    cases with details about how the request was made and the response that was received.

    Attributes
    ----------
    error_code: int
        The HTTP response code
    error_message: str
        The error message returned by the API (might be empty)
    request_headers: dict
    payload: str | bytes
    url: str
        The final response URL
    method: str
        The HTTP method of the request
    response: requests.Response
        The actual response object is provided for further debugging
    """

    def __init__(self, response: requests.Response, *args):
        self.error_code = response.status_code
        self.error_message = response.text
        self.request_headers = response.request.headers
        self.payload = response.request.body
        self.url = response.url
        self.method = response.request.method
        self.response = response
        self.args = args

    def __repr__(self):
        url = ".../" + self.url.split("/")[1]
        msg = f"GLPIError({url=}, method={self.method}, code={self.error_code})="
        error = self.error_message[: (80 - len(msg))]
        return msg + error

    def __str__(self):
        url = ".../" + self.url.split("/")[1]
        msg = f"GLPIError({url=}, method={self.method}, code={self.error_code})=\n"
        error = self.error_message
        return msg + error


def add_criteria_to_parameters(criteria, parameters: list, father="criteria"):
    if isinstance(criteria, dict):
        for key, value in criteria.items():
            path = f"{father}[{key}]"
            if isinstance(value, list):
                add_criteria_to_parameters(value, parameters, path)
            else:
                parameters.append((path, value))
    elif isinstance(criteria, list):
        for i in range(len(criteria)):
            add_criteria_to_parameters(criteria[i], parameters, f"{father}[{i}]")
    else:
        raise NotImplementedError(
            f"__add_criteria cannot handle objects of type {type(criteria)}"
        )


class RequestHandler:
    """RequestHandler encapsulates the GLPI API in a handy class.

    Parameters
    ----------
    host_url: str
        The URL to the GLPI instance.
    app_token: str
        The application token.
    user_api_token: str
        The user api token.
    verify_tls: bool, default True
        If your glpi server is using TLS with a bad
        certificate, you will need to set this to false.

    Methods
    -------

    add_items:
        Create new items (hardware, software, tickets etc.)
    change_active_entity:
        Change active entity
    change_active_profile:
        Change the active profile of the current user
    delete_items:
        Delete a list of items by id
    download_document:
        Return a document as `bytes`
    download_user_profile_picture:
        Return a profile picture as `bytes`
    get_active_entities:
        Return active entities of current logged user
    get_active_profile:
        Return the active profile of the current user
    get_full_session:
        Return the current PHP session variable
    get_glpi_config:
        Return the current `GLPI_CONFIG` variable
    get_item:
        Return single item (hardware, software, ticket etc.)
    get_many_items:
        Return a list of items
    get_my_entities:
        Return all the entities of the current logged user.
    get_my_profiles:
        Return all the profiles associated to the current logged user.
    get_search_options:
        List the search options for an item type
    get_sub_items:
        Return subitems of an item
    init_session:
        Tries to log into glpi
    kill_session:
        Ends the session associated with this `RequestHandler`
    response_range:
        Returns the `ResponseRange` of the previous API call
    search_items:
        Search items according to some criteria
    session_token:
        Returns the current session token
    update_items:
        Update the attributes of several items
    upload_document:
        Uploads a document to GLPI

    Notes
    -----
    Most methods require an active session to perform. If unsure
    call :meth:`~RequestHandler.init_session` after the instantiation.

    `host_url`, `app_token` and `user_api_token` are further described in
    the README.md.

    Examples
    --------

    >>> handler = RequestHandler('localhost', '123456', '654321')
    >>> handler.init_session()
    >>> handler.get_my_profiles()
    {
        'name': "Super-admin",
        'entities': [
            ...
        ]
    }
    >>> handler.kill_session()
    """

    @property
    def response_range(self) -> ResponseRange:
        """Returns the `ResponseRange` of the previous API call

        Set when methods that return multiple items are called.

        """
        if self.__response_header is None:
            raise GLPIError("No request made")
        elif (
            "Content-Range" not in self.__response_header
            or "Accept-Range" not in self.__response_header
        ):
            raise GLPIError("The previous request did not return a range")
        else:
            content_range = self.__response_header["Content-Range"]
            match = re.match(
                r"(?P<start>\d+)-(?P<end>\d+)/(?P<count>\d+)", content_range
            )
            s = self.__response_header["Accept-Range"].strip().split()[1]
            accept_range = int(s)
            return ResponseRange(
                int(match.group("start")),
                int(match.group("end")),
                int(match.group("count")),
                accept_range,
            )

    @property
    def session_token(self) -> str:
        """Returns the current session token

        Session token is an identification token used for the current
        connection to the API.
        """
        if self.__session_token is None:
            raise GLPIError(
                "Request handler was not initiated! Please call init_session"
                " if you want to start a new session."
            )
        return self.__session_token

    def __init__(
        self,
        host_url: str,
        app_token: str,
        user_api_token: str,
        verify_tls: bool = True,
    ):
        """Creates a new RequestHandler instance.

        Notes
        -----
        This method, doesn't call init_session(). See The class
        documentation for more information.

        """
        self.host_url = host_url
        self.app_token = app_token
        self.user_api_token = user_api_token
        self.__session_token = None
        self.verify_tls = verify_tls
        self.__session = None
        self.__response_header = None

    def _header_dict(self, extra: Dict[str, str]) -> Dict[str, str]:
        d = {
            "Content-Type": "application/json",
            "App-Token": self.app_token,
        }
        d.update(extra)
        return d

    def init_session(self):
        """Request a :meth:`~RequestHandler.session_token` to be used by the
        other methods.

        """
        if self.__session_token is not None:
            raise GLPIError("Session already initialized.")
        auth = f"user_token {self.user_api_token}"
        r = self._do_get("initSession", {"Authorization": auth})
        self.__session_token = r.json()["session_token"]
        logger.info("Session initiaded")

    def _get_method_url(self, request_type: str) -> str:
        return f"{self.host_url}/apirest.php/{request_type}"

    def _do_get(
        self,
        action: str,
        header: Dict[str, str],
        parameters: Union[Dict[str, Any], List[Tuple[str, Any]]] = None,
        data: Union[Dict[str, Any], List[Tuple[str, Any]]] = None,
    ) -> requests.Response:
        url = self._get_method_url(action)
        headers = self._header_dict(header)
        logger.debug(f"Calling method {action}")
        if self.__session is None:
            self.__session = requests.Session()
        response = self.__session.get(
            url, headers=headers, verify=self.verify_tls, params=parameters, data=data
        )
        self.__response_header = response.headers
        if response.status_code >= 400:
            raise GLPIRequestError(response)
        return response

    def _get_json(
        self,
        method: str,
        parameters: Union[JSON, List[Tuple[str, Any]]] = None,
        data: Union[JSON, List[Tuple[str, Any]]] = None,
    ) -> Union[JSON, List[JSON]]:
        response = self._do_get(
            method, {"Session-Token": self.session_token}, parameters, data
        )
        try:
            return response.json()
        except JSONDecodeError:
            if len(response.text.strip()) == 0:
                message = "GLPI produced a blank response."
            else:
                message = f"Expected a JSON got a {response.text}"
            raise GLPIRequestError(response, message)

    @staticmethod
    def __keys_to_int(dict_: Dict):
        for k, v in list(dict_.items()):
            try:
                i = int(k)
                del dict_[k]
                dict_[i] = v
            except ValueError:
                pass

    def __get_request_parameters(self, rename: Dict[str, str] = None):
        """Build request parameters as list of tuples out of the optional
        values of the calling method.

        Parameters
        ----------
        rename
            Renames the resulting parameter using the items of this dict.
        """
        if rename is None:
            rename = {}
        currentframe = inspect.currentframe()
        try:
            frame = inspect.getouterframes(currentframe)[1]
            try:
                method = getattr(self, frame.function)
                sig = inspect.signature(method)
                request_parameters = []
                for parameter in sig.parameters.values():
                    parameter_name = parameter.name
                    parameter_value = frame.frame.f_locals[parameter_name]
                    if parameter_name in rename:
                        parameter_name = rename[parameter_name]
                    if (
                        parameter.default is not inspect.Parameter.empty
                        and parameter_value != parameter.default
                    ):
                        if (
                            type(parameter_value) == list
                            or type(parameter_value) == tuple
                        ):
                            for item in parameter_value:
                                request_parameters.append((parameter_name + "[]", item))
                        else:
                            request_parameters.append((parameter_name, parameter_value))
                return request_parameters
            finally:
                del frame
        finally:
            del currentframe

    def kill_session(self, session_id: Optional[str] = None):
        """Destroy a session identified by a
        :meth:`~RequestHandler.session_token`.

        Defaults to the current open session."""
        if session_id is None:
            if self.session_token is None:
                raise GLPIError(
                    "Request handler was not initiated, nothing to be done."
                )
            else:
                session_id = self.session_token
                self.__session_token = None

        try:
            self._do_get("killSession", {"Session-Token": session_id})
        except GLPIRequestError as err:
            if err.error_code == 401:
                try:
                    message = err.response.json()
                except JSONDecodeError:
                    raise err from None
                if len(message) > 0 and message[0] == "ERROR_SESSION_TOKEN_INVALID":
                    raise GLPIError("Session expired") from err
                else:
                    raise err from None
            else:
                raise
        logger.info("Session was terminated successfully.")

    def __enter__(self):
        self.init_session()
        return self

    def __exit__(self, exc_type, exc_val, exc_tb):
        # No great advantage treating exceptions in here
        self.kill_session()
        return False  # Do raise any exception found within the `with` body

    def get_my_profiles(self) -> List[JSON]:
        """Return all the profiles associated to the current logged user.

        Examples
        --------
        >>> handler.get_my_profiles()
        [
             {
                 'id': 1
                 'name': "Super-admin",
                 'entities': [
                         ...
                 ]...
            },...
        ]
        """
        return self._get_json("getMyProfiles")["myprofiles"]

    def get_active_profile(self) -> JSON:
        """Return the current active profile.

        Examples
        --------
        >>> handler.get_active_profile()
        {
            'name': "Super-admin",
            'entities': [
                ...
            ]
        }
        """
        return self._get_json("getActiveProfile")["active_profile"]

    def change_active_profile(self, profile_id: int) -> None:
        """Change active profile to the one indicated by `profile_id`.

        Use :meth:`~RequestHandler.get_my_profiles` to obtain the possible
        profiles.

        Raises
        ------
        GLPIError
            When the profile can't be found.
        """
        r = self._do_post(
            "changeActiveProfile", {"profiles_id": profile_id}, on_error_raise=False
        )
        if r.status_code == 404:
            raise GLPIError("Profile not found")

    def _do_method(
        self,
        method: str,
        api_method_url: str,
        data: Union[JSON, List[Tuple[str, Any]]] = None,
        headers: Dict[str, str] = None,
        files=None,
        on_error_raise=True,
    ) -> requests.Response:
        if headers is None:
            headers = {}
        headers["Session-Token"] = self.session_token
        url = self._get_method_url(api_method_url)
        headers = self._header_dict(headers)
        if self.__session is None:
            self.__session = requests.Session()
        logger.debug(
            f"Calling method {method} on {api_method_url} with {data=} and {headers=}"
        )
        response = getattr(self.__session, method)(
            url, headers=headers, verify=self.verify_tls, json=data, files=files
        )
        if on_error_raise:
            if response.status_code >= 400:
                raise GLPIRequestError(response)
        return response

    def _do_post(
        self,
        action: str,
        data: Union[JSON, List[Tuple[str, Any]]],
        headers: Dict[str, str] = None,
        on_error_raise=True,
        files=None,
    ) -> requests.Response:
        return self._do_method(
            method="post",
            api_method_url=action,
            data=data,
            headers=headers,
            on_error_raise=on_error_raise,
            files=files,
        )

    def get_my_entities(self, recursive: bool = False) -> List[JSON]:
        """Return all the entities of the current logged user.

        Also returns entities related to the current active profile.

        Examples
        --------
        >>> handler.get_my_entities()
        [
            {
                'id':   71
                'name': "my_entity"
            },
            ...
        ]
        """
        return self._get_json(
            "getMyEntities", parameters={"is_recursive": str(recursive).lower()}
        )["myentities"]

    def get_active_entities(self) -> JSON:
        """Return active entities of current logged user.

        Examples
        --------
        >>> handler.get_active_entities()
        {
            'id': 1,
            'active_entity_recursive': true,
            'active_entities': [
                {"id":1},
                {"id":71},...
            ]
        }
        """
        return self._get_json("getActiveEntities")["active_entity"]

    def change_active_entity(self, entity_id: int):
        """Change active entity to `entity_id`.

        Use :meth:`~RequestHandler.get_my_entities` method to know that are the viable entities.

        Warnings
        --------
        Due to a bug with GLPI 9.5.3 if the API cannot find a valid entity
        with that id it will just report a "Bad Request".
        """
        r = self._do_post(
            "changeActiveEntities", {"entities_id": entity_id}, on_error_raise=False
        )
        if r.status_code == 400:
            raise GLPIError(r.json()[1])

    def get_full_session(self) -> JSON:
        """Return the current `php`'s `$_SESSION`.

        Examples
        --------
        >>> handler.get_full_session()
        {
            'valid_id': ...,
            'glpi_currenttime': ...,
            'glpi_use_mode': ...,
            ...
        }
        """
        return self._get_json("getFullSession")["session"]

    def get_glpi_config(self) -> JSON:
        """Return the current `$CFG_GLPI`.

        Examples
        --------
        >>> handler.get_glpi_config()
        {
            'languages': ...,
            'glpitables': ...,
            'unicity_types':...,
            ...
        }
        """
        return self._get_json("getGlpiConfig")["cfg_glpi"]

    def get_item(
        self,
        item_type: str,
        id_: int,
        expand_dropdowns: bool = False,
        get_hateoas: bool = True,
        get_sha1: bool = False,
        with_devices: bool = False,
        with_disks: bool = False,
        with_softwares: bool = False,
        with_connections: bool = False,
        with_networkports: bool = False,
        with_infocoms: bool = False,
        with_contracts: bool = False,
        with_documents: bool = False,
        with_tickets: bool = False,
        with_problems: bool = False,
        with_changes: bool = False,
        with_notes: bool = False,
        with_logs: bool = False,
        add_key_names: List[str] = None,
    ) -> JSON:
        """Return an instance of `item_type` identified by `id` and its associated
        fields.

        Documents and User pictures are retrieved with their respective methods.

        Parameters
        ----------
        item_type: str
            Type of the item. Eg: 'Computer', 'Ticket', 'Software'...
        id_ : int
            Unique identifier of the `itemtype`.
        expand_dropdowns : bool, default False
            Show dropdown name instead of `id`.
        get_hateoas : bool, default True
            Show relations of the item in a `links` attribute.

            See: https://en.wikipedia.org/wiki/HATEOAS

            Can't be disabled due to a bug in the API.
        get_sha1 : bool, default False
            Get a sha1 signature instead of the full answer.
        with_devices : bool, default False
            Only for [Computer, NetworkEquipment, Peripheral, Phone, Printer], retrieve
            the associated components.
        with_disks : bool, default False
            Only for Computer, retrieve the associated file-systems.
        with_softwares : bool, default False
            Only for Computer, retrieve the associated software's installations.
        with_connections : bool, default False
            Only for Computer, retrieve the associated direct connections (like
            peripherals and printers).
        with_networkports : bool, default False
            Retrieve all network's connections and advanced network's information.
        with_infocoms : bool, default False
            Retrieve financial and administrative information.
        with_contracts : bool, default False
            Retrieve associated contracts.
        with_documents : bool, default False
            Retrieve associated external documents.
        with_tickets : bool, default False
            Retrieve associated ITIL tickets.
        with_problems : bool, default False
            Retrieve associated ITIL problems.
        with_changes : bool, default False
            Retrieve associated ITIL changes.
        with_notes : bool, default False
            Retrieve Notes.
        with_logs : bool, default False
            Retrieve item history.
        add_key_names : List[str], default None
            Retrieve friendly names of the keys "id" keys.
            Eg.: ['id', 'entities_id', 'groups_id_tech' ...]

        Examples
        --------
        >>> handler.get_item(item_type='Computer',id_=71)
        {
            "id": 71,
            "entities_id": "Root Entity",
            "name": "adelaunay-ThinkPad-Edge-E320",
            "serial": "12345",
            ...
        }
        """
        if not get_hateoas:
            get_hateoas = 0
        request_parameters = self.__get_request_parameters(
            rename={"add_key_names": "add_keys_names"}
        )
        try:
            return self._get_json(f"{item_type}/{id_}", parameters=request_parameters)
        except requests.HTTPError as err:
            raise GLPIError(f"{item_type} with id={id_} was not found") from err

    def get_many_items(
        self,
        item_type,
        expand_dropdowns: bool = False,
        get_hateoas: bool = True,
        only_id: bool = False,
        range_: Tuple[int, int] = None,
        sort_by: str = None,
        order: SortOrder = None,
        filter_by: Dict[str, str] = None,
        is_deleted: bool = False,
        add_key_names: List[str] = None,
    ) -> List[JSON]:
        """Returns a set of items identified by `item_type`.

        Parameters
        ----------
        item_type: str
            Type of the item. Eg: 'Computer', 'Ticket', 'Software'...
        expand_dropdowns: bool, default False
            Show dropdown name instead of `id`.
        get_hateoas : bool, default True
            Show relations of the item in a `links` attribute.

            See: https://en.wikipedia.org/wiki/HATEOAS

            Can't be disabled due to a bug in the API.
        only_id: bool, default False
            Only `id` and `links` are returned.
        range_: Tuple(int, int), default (0, 50)
            The start and end of the pagination.
        sort_by: str, default None
            Name of the field to sort by.
        order: SortOrder, default SortOrder.Ascending
            Sort the results according to the sort order of the `sort` field.
        filter_by: Dict[str, str], default None
            Filters to pass on the query.
        is_deleted: bool, default False
            Return deleted elements.
        add_key_names: List[str], default None
            Retrieve friendly names of the keys "id" keys.
            Eg.: ['id', 'entities_id', 'groups_id_tech' ...]


        Examples
        --------
        >>> handler.get_many_items(item_type='Computer')
        [
            {
                "id": 34,
                "entities_id": "Root Entity",
                "name": "glpi",
                ...
            },...
        ]
        """
        if range_ is not None:
            range_ = "-".join(str(r) for r in range_)
        if is_deleted:
            is_deleted = 1
        if not get_hateoas:
            get_hateoas = 0
        request_parameters = self.__get_request_parameters(
            rename={
                "range_": "range",
                "add_key_names": "add_keys_names",
                "sort_by": "sort",
            }
        )
        if filter_by:
            for name in filter_by:
                request_parameters.append((f"searchText[{name}]", filter_by[name]))
        return self._get_json(f"{item_type}/", parameters=request_parameters)

    def get_sub_items(
        self,
        item_type: str,
        item_id: int,
        sub_item_type: str,
        expand_dropdowns: bool = False,
        get_hateoas: bool = True,
        only_id: bool = False,
        range_: Tuple[int, int] = None,
        sort_by: str = None,
        order: SortOrder = None,
        add_key_names: List[str] = None,
    ) -> List[JSON]:
        """Return subitems of the `sub_item_type` for the identified
        `item_id`.

        Parameters
        ----------
        item_type: str
            Type of the item. Eg: 'Computer', 'Ticket', 'Software'...
        item_id: int
            Unique identifier of the parent `item_type`.
        sub_item_type: str
            The type of subitems you are trying to retrieve.
        expand_dropdowns: bool, default False
            Show dropdown name instead of `id`.
        get_hateoas : bool, default True
            Show relations of the item in a `links` attribute.

            See: https://en.wikipedia.org/wiki/HATEOAS

            Can't be disabled due to a bug in the API.
        only_id: bool, default False
            Only `id` and `links` are returned.
        range_: Tuple(int, int), default (0, 50)
            The start and end of the pagination.
        sort_by: str, default None
            Name of the field to sort by.
        order: SortOrder, default SortOrder.Ascending
            Sort the results according to the sort order of the `sort` field.
        add_key_names: List[str], default None
            Retrieve friendly names of the keys "id" keys.
            Eg.: ['id', 'entities_id', 'groups_id_tech' ...]

        Examples
        --------
        >>> handler.get_sub_items(item_type='User', item_id=2, sub_item_type='Logs')
        [
            {
                "id": 22117,
                "itemtype": "User",
                ...
            }, ...
        ]
        """
        if range_ is not None:
            range_ = "-".join(str(r) for r in range_)
        if not get_hateoas:
            get_hateoas = 0
        request_parameters = self.__get_request_parameters(
            rename={
                "range_": "range",
                "add_key_names": "add_keys_names",
                "sort_by": "sort",
            }
        )
        return self._get_json(
            f"{item_type}/{item_id}/{sub_item_type}", parameters=request_parameters
        )

    def get_search_options(
        self, item_type: str, raw: bool = False, pretty=False
    ) -> JSON:
        """List the search options of the provided `itemtype`.

        This method provides the options you need for self.search_items.

        Parameters
        ----------
        item_type: str
            Type of the item. Eg: 'Computer', 'Ticket', 'Software'...
        raw: bool, default False
            Return `searchoption` uncleaned (as provided by `core`).
        pretty: bool, default False
            Will attempt to return the search option organized in a tree based on `uid`.

        Examples
        --------
        >>> handler.get_search_items('Computer')
        {
            "common": "Characteristics",
             "1": {
                 'name': 'Name'
                 'table': 'glpi_computers'
                 'field': 'name'
                 'linkfield': 'name'
                 'datatype': 'itemlink'
                 'uid': 'Computer.name'
             },...
        }

        >>> handler.get_search_items('Computer', pretty=True)
        {'Computer':
            {'Appliance_Item':
                {'Appliance':
                    {'ApplianceType':
                        {'name':
                            {'available_searchtypes':
                                ['contains', ...],
                            ...
                            'uid': 'Computer.Appliance_Item.Appliance.ApplianceType.name'
                        },...
                    },...
                },...
            },...
        }
        """

        def recurse_parts(
            part_name: str, part_data: Dict[str, Any], rest: List[str], end, id_: int
        ):
            if part_name not in part_data:
                part_data[part_name] = {}
            if len(rest) == 0:
                part_data[part_name] = end
                end["id"] = id_
                return
            name = rest.pop(0)
            recurse_parts(name, part_data[part_name], rest, end, id_)

        request_parameters = self.__get_request_parameters()
        json = self._get_json(
            f"listSearchOptions/{item_type}", parameters=request_parameters
        )
        if not pretty:
            return json
        else:
            result = {}
            for k, v in json.items():
                if k.isdecimal():
                    parts = v["uid"].split(".")
                    head = parts.pop(0)
                    recurse_parts(head, result, parts, v, int(k))
            return result

    def search_items(
        self,
        item_type: str,
        filters: List[Dict[str, Any]] = None,
        sort_by_id: int = None,
        order: SortOrder = None,
        range_: Tuple[int, int] = None,
        force_display: List[int] = None,
        raw_data: bool = False,
        with_indexes: bool = False,
        uid_cols: bool = False,
        give_items: bool = False,
    ) -> JSON:
        """Search items according to some criteria.

        Expose the GLPI searchEngine and combine filters to retrieve a list of elements
        of the specified `item_type`.

        Parameters
        ----------
        item_type: str
            Type of the item. Eg: 'Computer', 'Ticket', 'Software'...[3]
        filters: List[Dict[str, Any]], default None
            A list of json-like objects the represents the query filters and their
            their relationships.
            Every filter object must have at least one `link` field (if it's not the
            first object).
                link: str
                    A logical operator of AND, OR, AND NOT

            `Filter objects` keys are objects that narrow down the query. Their keys are:
                field: int
                    The id of the `search_option`.
                meta: boolean
                    is this criterion a meta one ?
                itemtype: str
                    For meta=true criterion, define the `itemtype` to use.
                searchtype: str
                    The comparison operation of the filter. It's one of, contains[1],
                    equals[2], notequals[2], lessthan, morethan, under, notunder.
                value:
                    The value that the `field` is compared against.

            `Sub-filter` objects can be seen as a pair of () separating a query its
            single unique key is:
                criteria: List[Dict[str, Any]]
                    A list of `Filter objects`

            An example of `filters` parameter can be found in the examples section.
        sort_by_id: int, default None
            `id` of the `search_option` to sort by.
        order: SortOrder, default SortOrder.Ascending
            Sort the results according to the sort order of the `sort` field.
        range_: Tuple(int, int), default (0, 50)
            The start and end of the pagination.
        force_display: List[int], default None
            If set only the columns listed will be present in the query result.

            **Note**: The API documentation says that some columns will always be
            displayed, those are `{1: id, 2: name, 80: Entity}`. However that's not the
            observed behaviour. Only `{1: id}` seems to always be displayed.

        raw_data: bool, default False
            If set debug information about the query is returned in a `rawdata` field.
            The results contain the SQL, the search filters as interpreted by the
            `SearchEngine`, columns to retrive and many more attributes.
        with_indexes: bool, default False
            Instead of the resulting `data` field being a list of items found, it is
            a `dict` with `id` as key. Ordering cannot work with this argument.
        uid_cols: bool, default False
            Replaces the numeric `id` from the resulting `data` object with human
            readable names as identified by the `uid` field returned by
            `get_search_options`.
        give_items: bool, default False
            Returns a HTML link to the item on the portal in the first field for each
            returned item, inside a 'data_html' field in the returned object.

        Notes
        -----
        1. contains will use a wildcard search per default. You can restrict at the
        beginning using the `^` character, and/or at the end using the `$` character.

        2. `equals` and `notequals` are designed to be used with dropdowns. Do not
        expect those operators to search for a strictly equal value (see 1. above).

        3. You can use 'AllAssets' as the `item_type` to retrieve a combination of
        all asset's items, regardless of type.

        Examples
        --------
        >>> handler.search_items("Monitor", range=(0,2))
        {
            "totalcount": "2",
            "range": "0:2",
            "data": [
                {
                    "searchoptions_id": "value",
                    ...
                },...
            ],...
        }

        With `give_items`.

        >>> handler.search_items("Monitor", give_items=True)
        {
                    "data": [...],
                    "data_html": [
                        {
                            "1": "<a id='Monitor_1_1' href='/front/monitor.form.php?id=1'>monitor1</a>",
                            "19": "2021-02-20 21:38",
                            "23": "manufacturer1",
                            ...
                        }...
                    ],...
                }

        The next example demonstrates the usage of fiters with a nested filter.

        >>> nested_filter = [
        ...     {
        ...         "field":      34,
        ...         "searchtype": "equals",
        ...         "value":      1
        ...     }, {
        ...         "link":       "OR",
        ...         "field":      35,
        ...         "searchtype": "equals",
        ...         "value":      1
        ...     }
        ... ]
        >>> filters = [
        ...     {
        ...         "link":       "AND',
        ...         "field":      31,
        ...         "searchtype": "equals",
        ...         "value":      1
        ...      }, {
        ...         "link":       "AND",
        ...         "meta":       True,
        ...         "itemtype":   "User",
        ...         "field":      1,
        ...         "searchtype": "equals",
        ...         "value":      1
        ...      }, {
        ...         "link":       "AND",
        ...         "criteria" : nested_filter
        ...      }
        ... ]
        >>> handler.search_items("Monitor", force_display=[1], filters=filters)
        {
            "totalcount": ...,
            "range": ...,
            "data": [
                {
                    "1": "W2242",...
                },...
            ],...
        }

        The above filter variable is roughly equivalent to the expression.

        >>> [m for m in Monitors if (
        ...        field[31] == 1
        ...        and User.field[1] == 1
        ...        and (
        ...            field[34] == 1
        ...            or field[35] == 1))]


        """
        if range_ is not None:
            range_ = "-".join(str(r) for r in range_)
        criteria = filters if filters else []
        filters = None
        request_parameters = self.__get_request_parameters(
            rename={
                "sort_by_id": "sort",
                "range_": "range",
                "force_display": "forcedisplay",
                "raw_data": "rawdata",
                "with_indexes": "withindexes",
                "give_items": "giveItems",
            }
        )
        add_criteria_to_parameters(criteria, request_parameters)
        json = self._get_json(f"search/{item_type}", parameters=request_parameters)
        if not with_indexes:
            for d in json.get("data", []):
                self.__keys_to_int(d)
            for d in json.get("data_html", []):
                self.__keys_to_int(d)
        return json

    def add_items(
        self, item_type: str, data: Union[JSON, List[JSON]]
    ) -> Union[JSON, List[JSON]]:
        """Add one or several items

        Parameters
        ----------
        item_type: str
            Type of the item. Eg: 'Computer', 'Ticket', 'Software'...
        data: Union[Dict, List[Dict]]
            A dict with fields of `itemtype` to be inserted. You can add several items
            in one action by passing a list of dict instead.

        Returns
        -------
        Union[Dict, List[Dict]]
            In case a single object was passed will return a single dict, otherwise a
            list of dicts.

            In case of success the dicts might contain only the `id` of the inserted object,
            otherwise it will contain a `message` field with the error message.

        Examples
        --------
        >>> handler.add_items("Software", {"name": "my software", "location": 1})
        {'id': 4, 'message': 'Item Successfully Added: item name'}

        For several objects.

        >>> handler.add_items(
        ... "Software",
        ... [
        ...     {"name": "second software added", "location": 1},
        ...     {"name": "third software added", "uuid": "2313"},
        ... ])
        [
            {"id":8, "message": ""},
            {"id":false, "message": "You don't have permission to perform this action."},
            {"id":9, "message": ""}
        ]

        Notes
        -----
        So far I've been unable to trigger an error with add_items for a single
        item in a list. add_items fail silently whenever you provide an invalid
        attribute ex: an attribute that references an object that doesn't exist, a
        duplicated id field or even when you try to set a field that doesn't exist.

        """
        response = self._do_post(f"{item_type}", data={"input": data})
        return response.json()

    def update_items(self, item_type: str, data: List[JSON]) -> List[JSON]:
        """Update the attributes of several items.

        Parameters
        ----------
        item_type: str
            Type of the item. Eg: 'Computer', 'Ticket', 'Software'...
        data: List[Dict[str, Any]]
            A list of dict with fields of `item_type` to be updated. One of those fields
            must be `id`.
            Field names must be lowercase.

        Returns
        -------
        List[Dict]
            Each field has the form `{'id': 2, 'message': ''}`

        Notes
        -----
        As with the `add_items` method, this method is highly permissive and will not
        return an error if the item with that `id` doesn't exist, or the field is
        incorrect. In fact, it might create new objects in case the `id` doesn't exist.

        """
        response = self._do_method("patch", f"{item_type}", data={"input": data})
        return response.json()

    def delete_items(
        self, item_type: str, ids: List[int], purge=False, log=True
    ) -> List[JSON]:
        """Delete a list of existing objects.

        Parameters
        ----------
        item_type: str
            Type of the item. Eg: 'Computer', 'Ticket', 'Software'...
        ids: List[int]
            List of ids of the objects that will be deleted.
        purge: bool, default False
            If set the item will skip the trash bin (if applicable), being immediately
            deleted.
        log: bool, default True
            If set the deletion operation will be logged.

        Returns
        -------
        List[Dict]
        Returns a list of objects in the form of `{'id': True, 'message': ''}`

        In case of failure the `id` field value will be false and `message` will be set.

        """
        data = {"input": {"id": id_ for id_ in ids}}
        if purge:
            data["force_purge"] = True
        if not log:
            data["force_purge"] = True
        response = self._do_method("delete", f"{item_type}", data=data)
        return response.json()

    def upload_document(self, file: IO, name: str = None, file_name: str = None):
        """Uploads a document to GLPI

        Parameters
        ----------

        name: str, default None
            The human readable name. If unset it will be the same as `file_name`.
        file: IO
            A file like object
        file_name: str, default None
            If you want the file uploaded to have a name different from the `file`
            you can set this variable. Ex: 'my_filename.png'
            If unset it will try to obtain a name from the `file` to use as the
            `file_name`.

        """
        manifest = json.dumps({"input": {"name": name, "_filename": [file_name]}})

        url = self._get_method_url("Document/")
        headers = self._header_dict({"Session-Token": self.session_token})
        if self.__session is None:
            self.__session = requests.Session()
        if file_name is None:
            file_name = file.name
        del headers["Content-Type"]
        r = self.__session.post(
            url,
            headers=headers,
            verify=self.verify_tls,
            files={"filename[0]": (file_name, file)},
            data={"uploadManifest": manifest},
        )
        r.raise_for_status()
        return r.json()

    def download_document(self, id_: int):
        """Return a Document identified by `id` as `bytes`"""
        response = self._do_method(
            "get",
            f"Document/{id_}",
            headers={"Accept": "application/octet-stream"},
            on_error_raise=False,
        )
        return response.content

    def download_user_profile_picture(self, id_: int):
        """Return the profile picture of a `User` identified by `id` as `bytes`"""
        response = self._do_method(
            "get",
            f"User/{id_}/Picture",
            on_error_raise=False,
        )
        if response.status_code == 204:
            raise GLPIError("User doesn't have a profile picture")
        return response.content
