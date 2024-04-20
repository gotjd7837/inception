#!/bin/bash

service mysql start

cat << eof > mariadb.sql
CREATE DATABASE $DATABASE_NAME;
FLUSH PRIVILEGES;
CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_USER_PASSWORD';
GRANT ALL ON $DATABASE_NAME.* TO '$MYSQL_USER'@'%';
GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
FLUSH PRIVILEGES;
eof

mysql -u root < mariadb.sql

service mysql stop

exec $@