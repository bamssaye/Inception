#!/bin/sh

chown -R mysql:mysql /var/lib/mysql

if [ ! -d "/var/lib/mysql/mysql" ]; then

	mariadb-install-db --user=mysql
	/usr/bin/mariadbd --user=mysql --bootstrap << x80
    USE mysql;
    FLUSH PRIVILEGES;

    DELETE FROM	mysql.user WHERE User='';
    DROP DATABASE test;
    DELETE FROM mysql.db WHERE Db='test';
    DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
    
    ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_PASSWORD';

    CREATE DATABASE $DB_NAME CHARACTER SET utf8 COLLATE utf8_general_ci;
    CREATE USER '$DB_USER'@'%' IDENTIFIED by '$DB_PASSWORD';
    GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';

    FLUSH PRIVILEGES;
x80
fi

if [  -f "/files/mariadb-server.cnf" ]; then
    mv /files/mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf
fi 

exec /usr/bin/mariadbd --user=mysql --datadir=/var/lib/mysql --console