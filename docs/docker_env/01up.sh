#!/usr/bin/env bash

#for file in $(find ../db -name "*.sql" -exec ls {} \;| grep -v postgres | sort | tr ' ' '|' | tr '\n' ' ')
#do
#    file=$(echo ${file} | tr '|' ' ')
#    printf "Applying update ${file}\n"
#    mysql -uroot -p$MYSQL_ROOT_PASSWORD -h xxx-db < ${file}
#done
#mysql -uroot -p$MYSQL_ROOT_PASSWORD -h portal < ../db/portal.sql
#mysql -uroot -p$MYSQL_ROOT_PASSWORD -h vole < ../db/vole.sql
docker-compose up -d
echo "docker logs -f app-mysql"