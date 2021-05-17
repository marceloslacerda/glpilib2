#!/bin/sh -xe

docker-compose down
rm -rf webapp
rm -rf glpi
mkdir -p webapp
mkdir -p database
touch forensic_log
curl -s https://api.github.com/repos/glpi-project/glpi/releases/latest | grep browser_download_url | cut -d : -f 2,3 | tr -d \" | xargs curl -sL  | tar -xz
mv glpi webapp
docker-compose up -d
until docker-compose -T exec db mysql -uroot -pexample glpi --execute 'SELECT 1' ; do
    sleep 1
done
docker-compose exec -T db mysql -u root -pexample glpi < database_dump.sql
docker-compose exec -T -u www-data webapp php bin/console glpi:system:check_requirements
docker-compose exec -T -u www-data webapp php bin/console glpi:maintenance:enable || true
docker-compose exec -T -u www-data webapp php bin/console db:configure -r -H db -d glpi -u root -p example
docker-compose exec -T -u www-data webapp php bin/console db:update --allow-unstable
docker-compose exec -T -u www-data webapp php bin/console glpi:maintenance:disable || true
