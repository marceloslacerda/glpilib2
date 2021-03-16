#!/bin/sh

docker exec glpi_db_1 mysqldump -h localhost -uroot -pexample glpi  > database_dump.sql