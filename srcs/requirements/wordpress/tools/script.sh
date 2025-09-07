#!/bin/bash
set -ex



while ! nc -z mariadb 3306; do
    sleep 2
done

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 
chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp


mkdir -p /var/www/html && cd /var/www/html
# mv /files/wp-config.php /var/www/html/wp-config.php


php -d memory_limit=512M /usr/local/bin/wp core download --allow-root --force --path=/var/www/html

wp config create \
  --dbname="$DB_NAME" \
  --dbuser="$DB_USER" \
  --dbpass="$DB_PASSWORD" \
  --dbhost="$DB_HOST" \
  --allow-root

wp core install \
    --url=$DOMAIN_NAME \
    --title=$WP_TITLE \
    --admin_user=$WP_ADMIN_USR \
    --admin_password=$WP_ADMIN_PWD \
    --admin_email=$WP_ADMIN_EMAIL \
    --skip-email --allow-root

wp user create $WP_USER_USR $WP_USER_EMAIL \
    --role=editor --user_pass=$WP_USER_PWD \
    --allow-root

wp theme install mavix-portfolio --activate --allow-root
wp plugin update --all --allow-root

version=$(php -r 'echo PHP_MAJOR_VERSION.PHP_MINOR_VERSION;')
ls /files
ls /etc/php$version/php-fpm.d

mv /files/www.conf /etc/php$version/php-fpm.d/www.conf

mkdir -p /run/php

cat /etc/passwd | grep www-data

FPM="/usr/sbin/php-fpm$version"
$FPM -F

