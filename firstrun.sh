#!/bin/bash
docker run --rm guacamole/guacamole /opt/guacamole/bin/initdb.sh --postgres > initdb.sql
docker-compose exec guacpsql dropdb -U guac_user_db guac_db
docker-compose exec guacpsql createdb -U guac_user_db guac_db
docker-compose exec -T guacpsql psql -U guac_user_db guac_db < initdb.sql

