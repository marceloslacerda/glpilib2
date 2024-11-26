#!/bin/sh -xe
SCRIPT_PATH="$(dirname $0)"
cd "$SCRIPT_PATH"
docker compose down
rm -rf glpi
# The docker image of glpi contains dev code so it needs to be overwritten with official releases
curl -sL https://github.com/glpi-project/glpi/releases/download/10.0.17/glpi-10.0.17.tgz | tar -xz
touch forensic_log
docker compose build --no-cache
docker compose up -d
until docker compose exec -T db mariadb -uroot -pexample --execute 'SELECT 1' ; do
    sleep 1
done
docker compose exec -T db mariadb -u root -pexample --execute 'CREATE DATABASE glpi;'
docker compose exec -T db mariadb -u root -pexample glpi < database_dump.sql
docker compose exec -T -u www-data webapp php bin/console glpi:system:check_requirements
docker compose exec -T -u www-data webapp sh -c "echo yes | php bin/console db:update"
docker compose exec -T -u www-data webapp php bin/console glpi:maintenance:disable
