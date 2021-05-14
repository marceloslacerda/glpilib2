#!/bin/sh -xe

rm -rf webapp
rm -rf glpi
mkdir -p webapp
mkdir -p database
touch forensic_log
curl -s https://api.github.com/repos/glpi-project/glpi/releases/latest | grep browser_download_url | cut -d : -f 2,3 | tr -d \" | xargs curl -sL  | tar -xz
mv glpi webapp
docker-compose up &
sleep 10
docker exec docker-stuff_db_1 mysql -u root -pexample < database_dump.sql
# run install routine on glpi
docker exec docker-stuff_webapp_1 php bin/console glpi:system:check_requirements
docker exec docker-stuff_webapp_1 php bin/console glpi:maintenance:enable || true
docker exec docker-stuff_webapp_1 php bin/console db:install -H db -d glpi -u root -p example
docker exec docker-stuff_webapp_1 php bin/console db:update
docker exec docker-stuff_webapp_1 php bin/console glpi:maintenance:disable || true
