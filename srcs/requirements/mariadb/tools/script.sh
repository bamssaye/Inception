#!/bin/bash

# RUN mkdir -p /var/lib/mysql /run/mysqld && chown -R mysql:mysql /var/lib/mysql /run/mysqld
# RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql

# USER mysql
# CMD ["mysqld", "--datadir=/var/lib/mysql", "--bind-address=0.0.0.0"]


echo "CREATE DATABASE IF NOT EXISTS $DB_NAME ;" > db1.sql
echo "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD' ;" >> db1.sql
echo "GRANT ALL PRIVILEGES ON $DB_HOST.* TO '$DB_USER'@'%' ;" >> db1.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY 'dabi121' ;" >> db1.sql
echo "FLUSH PRIVILEGES;" >> db1.sql
