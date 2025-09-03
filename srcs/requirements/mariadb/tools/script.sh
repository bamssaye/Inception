#!/bin/sh
set -e

cat > /tmp/db.sql << FIN
CREATE DATABASE IF NOT EXISTS $DB_NAME ;
CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD' ;
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%' ;
ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_PASSWORD' ;
FLUSH PRIVILEGES ;
FIN

mysqld --user=mysql --bootstrap < /tmp/db.sql
exec mysqld --user=mysql --console
