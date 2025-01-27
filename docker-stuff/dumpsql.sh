#!/bin/sh

docker compose exec db mariadb-dump -h localhost -uroot -pexample glpi > new-database_dump.sql