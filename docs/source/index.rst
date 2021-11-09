.. glpilib2 documentation master file, created by
   sphinx-quickstart on Sun May 23 15:09:20 2021.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

Welcome to glpilib2's documentation!
====================================

Release v\ |version|. (:ref:`Installation <install>`)
**glpilib2** is an easy to use python library for interfacing with `GLPI <https://github.com/glpi-project/glpi>`_'s API.

-------------------

How to use
----------

**Example**::

    from glpilib2 import RequestHandler
    handler = RequestHandler(
        host_url,
        app_token,
        user_api_token,
    )
    handler.init_session()
    ticket = handler.get_item("Ticket", 1)
    handler.delete_items("Software", [6])
    handler.kill_session()


.. toctree::
   :maxdepth: 2
   :caption: Contents:

Features
--------

* Lots of  tests for each API method
* A comprehensive documentation that dwelves into unusual behaviors of GLPI's
* Some obtuse errors that GLPI throws are wrapped with more meaningful ones
* Supports Python 3.7+

API Documentation
-----------------

.. toctree::
   :maxdepth: 2

   api
