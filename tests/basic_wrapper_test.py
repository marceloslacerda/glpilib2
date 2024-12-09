import os
import pathlib
import sys
import unittest
from typing import Sized, Iterable

import glpilib2

module_dir = pathlib.Path(__file__).parent
sys.path.insert(0, str(module_dir.parent.absolute()))

from glpilib2 import RequestHandler, SortOrder

GLPI_LOGO = pathlib.Path(module_dir / "logo-glpi-bleu-1.png")


class TestGLPIWrapper(unittest.TestCase):
    @classmethod
    def setUpClass(cls) -> None:
        cls.handler = RequestHandler(
            "http://localhost:8000",
            os.environ["APP_TOKEN"],
            os.environ["USER_API_TOKEN"],
        )
        cls.handler.init_session()

    @classmethod
    def tearDownClass(cls) -> None:
        cls.handler.kill_session()

    def assertNotEmpty(self, iterable: Iterable):
        self.assertGreater(len(list(iterable)), 0)

    def assertEmpty(self, iterable: Sized):
        self.assertLength(iterable, 0, f"Object is not empty")

    def assertLength(self, iterable: Sized, length, message=None):
        if message is None:
            message = f"Lengths differ: len({len(iterable)}) != {length}"
        self.assertEqual(len(iterable), length, message)

    def test_start_kill(self):
        self.assertTrue(True)

    def test_get_profiles(self):
        profiles = self.handler.get_my_profiles()
        self.assertNotEmpty(profiles)
        self.assertIn("entities", profiles[0])

    def test_get_active_profile(self):
        self.assertIn("entities", self.handler.get_active_profile())

    def test_request_error(self):
        with self.assertRaises(glpilib2.GLPIRequestError):
            self.handler.delete_items("Ticket", [-999])


    def test_change_active_profile_not_found(self):
        with self.assertRaises(glpilib2.GLPIError):
            self.handler.change_active_profile(0)

    def test_change_active_profile_found(self):
        self.handler.change_active_profile(4)

    def test_get_my_entities(self):
        entities = self.handler.get_my_entities(recursive=True)
        self.assertNotEmpty(entities)
        self.assertIn("id", entities[0])

    def test_get_active_entities(self):
        self.assertIn("active_entity_recursive", self.handler.get_active_entities())

    def test_change_active_entities(self):
        self.handler.change_active_entity(0)

    def test_change_active_entities_not_found(self):
        with self.assertRaises(glpilib2.GLPIError):
            self.handler.change_active_profile(3)

    def test_get_full_session(self):
        self.assertIn("glpifriendlyname", self.handler.get_full_session())

    def test_get_glpi_config(self):
        self.assertIn("languages", self.handler.get_glpi_config())

    def test_get_item_ticket_with_extra(self):
        ticket = self.handler.get_item(
            "Ticket", 1, with_problems=True, with_changes=True, with_logs=True
        )
        self.assertIn("_problems", ticket)
        self.assertIn("_changes", ticket)
        self.assertIn("_logs", ticket)

    def test_get_item_ticket(self):
        ticket = self.handler.get_item("Ticket", 1)
        self.assertEqual(ticket["name"], "ticket1")

    def test_get_item_computer(self):
        computer = self.handler.get_item(
            "Computer",
            1,
            with_contracts=True,
            with_connections=True,
            with_tickets=True,
            with_problems=True,
            with_changes=True,
            with_notes=True,
            with_logs=True,
            with_disks=True,
            with_devices=True,
            with_softwares=True,
            with_infocoms=True,
            with_networkports=True,
        )
        self.assertIn("comp", computer["name"])
        self.assertIn("_contracts", computer)
        self.assertIn("_tickets", computer)
        self.assertIn("_problems", computer)
        self.assertIn("_changes", computer)
        self.assertIn("_notes", computer)
        self.assertIn("_logs", computer)
        self.assertIn("_disks", computer)
        self.assertIn("_softwares", computer)
        self.assertIn("_infocoms", computer)
        self.assertIn("_networkports", computer)

    def test_get_item_computer_with_dropdowns(self):
        computer = self.handler.get_item("Computer", 1, expand_dropdowns=True)
        self.assertEqual(computer["groups_id"], "group1")
        computer = self.handler.get_item("Computer", 1)
        self.assertEqual(computer["groups_id"], 1)

    def test_get_item_computer_without_hateoas(self):
        computer = self.handler.get_item("Computer", 1, get_hateoas=True)
        self.assertIn("links", computer)
        computer = self.handler.get_item("Computer", 1, get_hateoas=False)
        self.assertNotIn("links", computer)

    def test_get_item_computer_sha(self):
        sha = self.handler.get_item("Computer", 1, get_sha1=True)
        self.assertIsInstance(sha, str)

    def test_get_item_computer_with_key_names(self):
        computer = self.handler.get_item("Computer", 1, add_key_names=["users_id_tech"])
        self.assertIn("_keys_names", computer)
        self.assertIn("users_id_tech", computer["_keys_names"])

    def test_get_many_items(self):
        computers = self.handler.get_many_items("Computer")
        self.assertNotEmpty(computers)
        self.assertEqual(computers[0]["id"], 1)

    def test_get_many_items_only_id(self):
        computers = self.handler.get_many_items(
            "Computer",
            only_id=True,
        )
        self.assertNotEmpty(computers[0])
        self.assertNotIn("name", computers)

    def test_get_many_items_range(self):
        computers = self.handler.get_many_items(
            "Computer",
            range_=(1, 2),
        )
        self.assertEmpty(computers)

    def test_get_many_items_expand_dropdowns(self):
        computers = self.handler.get_many_items("Computer", expand_dropdowns=True)
        self.assertEqual(computers[0]["groups_id_tech"], "group1")

    def test_get_many_items_is_deleted(self):
        tickets = self.handler.get_many_items("Ticket", is_deleted=False)
        self.assertLength(tickets, 1)
        self.assertEqual(tickets[0]["id"], 1)
        tickets = self.handler.get_many_items("Ticket", is_deleted=True)
        self.assertLength(tickets, 1)
        self.assertEqual(tickets[0]["id"], 2)

    def test_get_many_items_with_key_names(self):
        computers = self.handler.get_many_items(
            "Computer", add_key_names=["users_id_tech"]
        )
        self.assertNotEmpty(computers)
        computer = computers[0]
        self.assertIn("_keys_names", computer)
        self.assertIn("users_id_tech", computer["_keys_names"])

    def test_get_many_items_sort_by(self):
        monitors = self.handler.get_many_items("Monitor")
        self.assertEqual(len(monitors), 2)
        self.assertEqual(monitors[0]["id"], 1)
        self.assertEqual(monitors[1]["id"], 2)
        monitors = self.handler.get_many_items("Monitor", sort_by="size")
        self.assertEqual(len(monitors), 2)
        self.assertEqual(monitors[0]["id"], 2)
        self.assertEqual(monitors[1]["id"], 1)

    def test_get_many_items_order(self):
        monitors = self.handler.get_many_items(
            "Monitor",
            order=SortOrder.Ascending,
        )
        self.assertEqual(len(monitors), 2)
        self.assertEqual(monitors[0]["id"], 1)
        self.assertEqual(monitors[1]["id"], 2)
        monitors = self.handler.get_many_items(
            "Monitor",
            order=SortOrder.Descending,
        )
        self.assertEqual(len(monitors), 2)
        self.assertEqual(monitors[0]["id"], 2)
        self.assertEqual(monitors[1]["id"], 1)

    def test_get_many_items_get_hateoas(self):
        computer = self.handler.get_many_items(
            "Computer",
            get_hateoas=True,
        )
        self.assertNotEmpty(computer)
        self.assertIn("links", computer[0])
        computer = self.handler.get_many_items(
            "Computer",
            get_hateoas=False,
        )
        self.assertNotEmpty(computer)
        self.assertNotIn("links", computer[0])

    def test_get_many_items_search_text(self):
        name = "monitor1"
        monitors = self.handler.get_many_items(
            "Monitor",
            filter_by={"name": name},
        )
        self.assertLength(monitors, 1)
        self.assertEqual(monitors[0]["name"], name)
        name = "monitor2"
        monitors = self.handler.get_many_items(
            "Monitor",
            filter_by={"name": name},
        )
        self.assertLength(monitors, 1)
        self.assertEqual(monitors[0]["name"], name)

    def test_get_many_items_response_range(self):
        self.handler.get_many_items("Monitor", range_=(0, 1))
        self.assertEqual(self.handler.response_range.start, 0)
        self.assertEqual(self.handler.response_range.end, 1)
        self.assertEqual(self.handler.response_range.count, 2)

    def test_get_sub_items(self):
        computer_log = self.handler.get_sub_items("Computer", 1, "Log")
        self.assertNotEmpty(computer_log)
        self.assertIn("old_value", computer_log[0])
        self.assertTrue(computer_log)

    def test_get_sub_items_expand_dropdowns(self):
        computer_log = self.handler.get_sub_items(
            "Computer", 1, "Log", expand_dropdowns=True
        )
        self.assertNotEmpty(computer_log)
        self.assertEqual(computer_log[0]["items_id"], "computer1")

    @unittest.skip("Seems like there's a bug in the API")
    def test_get_sub_items_get_hateoas(self):
        computer_log = self.handler.get_sub_items(
            "Computer",
            1,
            "Log",
            get_hateoas=True,
        )
        self.assertNotEmpty(computer_log)
        self.assertIn("links", computer_log[0])
        self.handler.get_sub_items(
            "Computer",
            1,
            "Log",
            get_hateoas=False,
        )
        self.assertNotEmpty(computer_log)
        self.assertNotIn("links", computer_log[0])

    def test_get_sub_items_only_id(self):
        computer_log = self.handler.get_sub_items(
            "Computer",
            1,
            "Log",
            only_id=True,
        )
        self.assertNotEmpty(computer_log[0])
        self.assertNotIn("name", computer_log)

    def test_get_sub_items_range_(self):
        rack_log = self.handler.get_sub_items(
            "Rack",
            1,
            "Log",
            range_=(1, 2),
        )
        self.assertLength(rack_log, 1)

    def test_get_sub_items_sort_by(self):
        rack_log = self.handler.get_sub_items("Rack", 1, "Log")
        self.assertLength(rack_log, 2)
        self.assertEqual(rack_log[0]["id"], 959)
        self.assertEqual(rack_log[1]["id"], 960)
        rack_log = self.handler.get_sub_items("Rack", 1, "Log", sort_by="linked_action")
        self.assertLength(rack_log, 2)
        self.assertEqual(rack_log[0]["id"], 960)
        self.assertEqual(rack_log[1]["id"], 959)

    def test_get_sub_items_order(self):
        rack_log = self.handler.get_sub_items("Rack", 1, "Log")
        self.assertLength(rack_log, 2)
        self.assertEqual(rack_log[0]["id"], 959)
        self.assertEqual(rack_log[1]["id"], 960)
        rack_log = self.handler.get_sub_items(
            "Rack", 1, "Log", order=SortOrder.Descending
        )
        self.assertLength(rack_log, 2)
        self.assertEqual(rack_log[0]["id"], 960)
        self.assertEqual(rack_log[1]["id"], 959)

    @unittest.skip("Possibly another bug in the API")
    def test_get_sub_items_add_key_names(self):
        computers = self.handler.get_sub_items(
            "Computer", 1, "Log", add_key_names=["items_id"]
        )
        self.assertNotEmpty(computers)
        computer = computers[0]
        self.assertIn("_keys_names", computer)
        self.assertIn("users_id_tech", computer["_keys_names"])

    def test_get_sub_items_response_range(self):
        self.handler.get_sub_items("Rack", 1, "Log")
        self.assertEqual(self.handler.response_range.start, 0)
        self.assertEqual(self.handler.response_range.end, 1)
        self.assertEqual(self.handler.response_range.count, 2)

    def test_get_search_options(self):
        options = self.handler.get_search_options("Computer")
        self.assertIn("common", options)
        self.assertIn("name", options["1"])
        self.assertIn("table", options["1"])

    def test_search_options_pretty(self):
        options = self.handler.get_search_options("Computer", pretty=True)
        self.assertIn("Computer", options)
        self.assertIn("Location", options["Computer"])
        self.assertEqual(type(options["Computer"]["name"]["id"]), int)

    def test_search(self):
        query = self.handler.search_items("Computer")
        self.assertEqual(query["totalcount"], 1)

    def test_search_by_id(self):
        query = self.handler.search_items("Monitor")
        self.assertEqual(query["data"][0][1], "monitor1")
        query = self.handler.search_items("Monitor", sort_by_id=5)  # sort by serial
        self.assertEqual(query["data"][0][1], "monitor2")

    def test_search_order(self):
        query = self.handler.search_items("Monitor")
        self.assertEqual(query["data"][0][1], "monitor1")
        query = self.handler.search_items("Monitor", order=SortOrder.Descending)
        self.assertEqual(query["data"][0][1], "monitor2")

    def test_search_range(self):
        query = self.handler.search_items(
            "Computer",
            range_=(1, 2),
        )
        self.assertEqual(query["totalcount"], 1)
        self.assertEqual(query["count"], 0)

    def test_search_force_display(self):
        query = self.handler.search_items(
            "Computer",
            force_display=[2],
        )
        self.assertIn(1, query["data"][0])
        self.assertIn(2, query["data"][0])
        self.assertNotIn(3, query["data"][0])

    def test_search_raw_data(self):
        query = self.handler.search_items(
            "Computer",
            raw_data=True,
        )
        self.assertIn("rawdata", query)

    def test_search_with_indexes(self):
        query = self.handler.search_items(
            "Monitor",
        )
        self.assertEqual(type(query["data"]), list)
        query = self.handler.search_items(
            "Monitor",
            with_indexes=True,
        )
        self.assertEqual(type(query["data"]), dict)

    def test_search_uid_cols(self):
        query = self.handler.search_items(
            "Monitor",
            uid_cols=True,
        )
        self.assertIn("Monitor.name", query["data"][0])

    def test_search_give_items(self):
        query = self.handler.search_items(
            "Monitor",
            give_items=True,
        )
        self.assertIn("data_html", query)
        self.assertIn("<a", query["data_html"][0][1])

    def test_search_filters(self):
        query = self.handler.search_items(
            "Monitor",
            filters=[
                {"field": 5, "searchtype": "equals", "value": 1},
            ],
        )
        self.assertEqual(query["count"], 1)
        self.assertEqual(query["data"][0][1], "monitor2")
        query = self.handler.search_items(
            "Monitor",
            filters=[
                {"field": 5, "searchtype": "equals", "value": 2},
            ],
        )
        self.assertEqual(query["count"], 1)
        self.assertEqual(query["data"][0][1], "monitor1")
        query = self.handler.search_items(
            "Monitor",
            filters=[
                {"field": 5, "searchtype": "equals", "value": 2},
                {"link": "OR", "field": 5, "searchtype": "equals", "value": 1},
            ],
        )
        self.assertEqual(query["count"], 2)
        self.assertTrue(query["data"][0][1], query["data"][1][1])

    def test_add_items(self):
        result = self.handler.add_items(
            "Software", {"name": "software added", "location": 1}
        )
        self.assertIn("id", result)

    def test_add_items_several(self):
        results = self.handler.add_items(
            "Software",
            [
                {"name": "second software added", "location": 1},
                {"name": "third software added", "uuid": "2313"},
            ],
        )
        self.assertLength(results, 2)
        for result in results:
            self.assertIn("id", result)

    def test_update_items(self):
        results = self.handler.update_items(
            "Monitor",
            [{"id": 1, "uuid": "update uuid"}, {"id": 2, "uuid": "update uid2"}],
        )
        self.assertLength(results, 2)
        for result in results:
            self.assertIn("message", result)
            self.assertEmpty(result["message"])

    def test_delete_items(self):
        id_ = self.handler.add_items(
            "Software", {"name": "software deleted", "location": 1}
        )["id"]
        results = self.handler.delete_items("Software", [id_])
        self.assertLength(results, 1)
        self.assertIn(str(id_), results[0])
        result = self.handler.get_item("Software", id_)
        self.assertEqual(result["id"], id_)

    def test_delete_items_purge(self):
        id_ = self.handler.add_items("Software", {"name": "software purged"})["id"]
        self.handler.delete_items("Software", [id_], purge=True)
        with self.assertRaises(glpilib2.GLPIError):
            self.handler.get_item("Software", id_)

    @unittest.skip("I have no idea how to test this")
    def test_delete_items_no_log(self):
        id_ = self.handler.add_items(
            "Software", {"name": "software delete no log", "location": 1}
        )["id"]
        self.handler.delete_items("Software", [id_], log=False)
        self.assertTrue(True)

    def test_upload_document(self):
        result = self.handler.upload_document(
            open(GLPI_LOGO, "rb"), "GLPI logo blue", "logo-glpi.png"
        )
        self.assertIn("id", result)

    def test_download_document(self):
        result = self.handler.upload_document(open(GLPI_LOGO, "rb"))
        id_ = result["id"]
        result = self.handler.download_document(id_)
        logo_data = open(GLPI_LOGO, "rb").read()
        self.assertEqual(result, logo_data)
        self.handler.delete_items("Document", [id_])

    def test_download_user_profile_picture(self):
        result = self.handler.download_user_profile_picture(4)
        self.assertNotEmpty(result)


if __name__ == "__main__":
    unittest.main()
