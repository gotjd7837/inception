#!/bin/bash

service mariadb start

cat << eof > mariadb.sql
CREATE DATABASE $DATABASE_NAME;
FLUSH PRIVILEGES;
CREATE USER '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_USER_PASSWORD';
GRANT ALL ON $DATABASE_NAME.* TO '$MARIADB_USER'@'%';
FLUSH PRIVILEGES;
eof

mariadb < mariadb.sql

service mariadb stop

exec $@