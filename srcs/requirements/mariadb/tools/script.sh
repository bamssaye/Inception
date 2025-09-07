#!/bin/sh
set -e

if [ ! -d "/var/lib/mysql/mysql" ]; then
    mariadb-install-db --user=mysql --datadir=/var/lib/mysql
    mv /files/mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf
fi

mariadbd --skip-networking --user=mysql &
pid="$!"

sleep 3

mariadb -protocol=socket -u root << x80
    CREATE DATABASE IF NOT EXISTS $DB_NAME ;
    CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD' ;
    GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%' ;
    CREATE USER 'root'@'%' IDENTIFIED BY 'dabi121';
    GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;
    FLUSH PRIVILEGES;
x80

mysqladmin --protocol=socket -u root shutdown
exec mariadbd --user=mysql --console
