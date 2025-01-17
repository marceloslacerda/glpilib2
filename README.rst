GLPILIB2
========

**glpilib2** is an easy to use python library for interfacing with `GLPI <https://github.com/glpi-project/glpi>`_'s API.

Supports GLPI 10

Features
--------

* Lots of  tests for each API method
* A comprehensive documentation that dwelves into unusual behaviors of GLPI's
* Some obtuse errors that GLPI throws are wrapped with more meaningful ones

Documentation
-------------

https://marceloslacerda-glpilib2.readthedocs.io/en/latest/

How to install
--------------

.. code-block:: bash

    pip install glpilib2


How to use
----------

The usage is fairly straightforward:

#. Create an instance of the ``RequestHandler`` class.
#. Initialize a session.
#. Use the ``RequestHandler``'s methods.
#. kill the session.

Please see the individual methods documentation for more.

**Example:**

.. code-block:: python

    from glpilib2 import RequestHandler
    handler = RequestHandler(
        host_url,
        app_token,
        user_api_token,
    )

    # Session initialization is necessary for calling any other method
    handler.init_session()

    # From here out, use the various methods of RequestHandler to access the API, such as
    ticket = handler.get_item("Ticket", 1) # Get the ticket with id = 1
    handler.delete_items("Software", [6]) # Delete the software with id = 6

    # After you are done using the API you can kill the session to free up server resources
    handler.kill_session()

    # Check the API documentation for more information on what's available

Wondering how to fill those variables called ``host_url``, ``app_token`` or ``user_api_token``? Read along! 

Getting GLPI API to work
========================

GLPI can be a bit tricky to get it to work with the API. In brief you will need
a valid ``app_token`` a ``user_api_token`` and of course the host name/ip of the
server that you will be accessing, for the sake of brevity we will refer to it
as ``host_url``.

Please note that the **host_url** must include the protocol ``http://`` or
``https://`` and the path to the GLPI itself if applicable. Ex: http://localhost:8000
or https://www.myhost.com/glpi .

Getting an app_token
--------------------

First you need to create a **API Client** object. It's not documented anywhere
when I last looked for it, so we will have to navigate through a few menus
to find it.

#. Make sure that you are logged into GLPI and your user is using a **super-admin**
   profile_.

#. Navigate to the **General Setup** screen that's usually in
   ``host_url``/front/config.form.php .

#. On the left menu bar click **API** link.

#. Make sure that the `Enable Rest API` and `Enable login with external token`
   are set to `Yes`.

     Note: You could also enable login with credentials but it's neither safer,
     not easier to do, so I'm not giving you that option for the sake of
     simplicity (on my part).

#. Note the **URL of the API** field we will be using that to make our requests,
   however please also observe that up to GLPI 9.5.3 the method will always be
   ``HTTP`` even if you use ``HTTPS`` in your ``host_url``.

#. If you are going to be using GLPI from localhost, the **full access from
   localhost** object should be enough for you (if it exists) and you can stop
   right here and skip to `Getting an user_api_token`_.

#. If you are using the ``docker-compose.yml`` that I have included in this
   project or you are accessing a remote host (most likely). You will need
   to create a new **API Client** object. For that click the **Add API client**
   button.

#. Fill the obligatory fields and make sure the new **API Client** is set as
   *Active*. The IP range should be within the range of the client (whatever
   device that will be making calls to the GLPI API).
   Make sure that the **Application Token**'s **Regenerate** checkbox is marked
   and click the **Add** button.

#. Go back to the previous screen and click the new **API Client** you just
   created.
   Take note of value of the ``app_token`` field.

Getting an user_api_token
-------------------------

Now you need an ``user_api_token``. This is the key that informs the API which
user is trying to access the **API**.

Getting this value is far more straightforward than the previous one.

#. As a **super-admin** profile_ use the **Administration** menu and select **Users**.

#. Find the user that you want to use to access the API and click on it.

#. Close to the bottom of the first page that opens you will see a `Remote
   access keys` section. Beneath it there is a **API token** label. If there's a
   field there, copy that value. That's our ``user_api_token``.

#. If there's no value check the **Regenerate** box on the right side of it and
   click Save. After the page reloads there should be a field next to the label
   copy it as described in the last step.

Testing your settings
---------------------

Now we should be almost done. You can test that the you can access the api with the
parameters we just collected.

Example::

    $ curl -X GET \
        -H 'Content-Type: application/json' \
        -H "Authorization: user_token <user_api_token>" \
        -H "App-Token: <app_token>" \
        '<host_url>/apirest.php/initSession?get_full_session=true'

    < 200 OK
    < {
    <     "session_token": "83af7e620c83a50a18d3eac2f6ed05a3ca0bea62"
    < }

Source: https://github.com/glpi-project/glpi/blob/master/apirest.md#init-session

If you got an answer ``200 OK`` as in the previous example you are done and can plug the
parameters you just collected to the library as mentioned on the `How to use`_ section.

Otherwise there are a few things that might have gone wrong.
Check the `documentation for common errors <https://github.com/glpi-project/glpi/blob/master/apirest.md#errors>`_.

Now, if after making sure that every parameter is set correctly you are still
getting ``ERROR_LOGIN_PARAMETERS_MISSING``. There's the possibility that the
application server that's hosting (usually **Apache**) GLPI is removing the headers
with the authentication data. Check this
`bug report <https://github.com/glpi-project/glpi/issues/4386#issuecomment-408027947>`_
And this `server configuration guide <https://github.com/glpi-project/glpi/blob/master/apirest.md#servers-configuration>`_
for more info.

DISCLAIMER
==========

GLPI API is quirky, some options don't work, some things aren't documented and the
documentation doesn't always describes what the software actually does. Besides that
GLPI is known to be prone to break a few things between updates. While I've done my best
to shield the user from all of this with this library, sometimes unexpected errors will
leak to the user. Please bear with me as we travel along this bumpy road.

.. _profile: https://wiki.glpi-project.org/doku.php?id=en:manual:admin:7_administration#profiles.

License
=======

This project is licensed under the GPL-2.0 license.
