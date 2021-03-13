#!/bin/bash
docker run --rm guacamole/guacamole /opt/guacamole/bin/initdb.sh --postgres > initdb.sql
docker-compose exec guacpsql dropdb -U guacamole_user guacamole_db
docker-compose exec guacpsql createdb -U guacamole_user guacamole_db
docker-compose exec -T guacpsql psql -U guacamole_user guacamole_db < initdb.sql

