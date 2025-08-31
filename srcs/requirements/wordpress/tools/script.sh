#!/bin/bash

mkdir -p data && cd /data
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 
chmod +x wp-cli.phar 
mv wp-cli.phar /usr/local/bin/wp

mkdir -p /var/www/html
cd /var/www/html

wp core download --allow-root
mv /wp-config.php /var/www/html/wp-config.php

sed -i -r "s/database_name_here/$DB_NAME/1"   wp-config.php
sed -i -r "s/username_here/$DB_USER/1"  wp-config.php
sed -i -r "s/password_here/$DB_PASSWORD/1"    wp-config.php
sed -i -r "s/localhost/$DB_HOST/1"    wp-config.php

wp core install --url=$DOMAIN_NAME/ --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root

wp theme install mavix-portfolio --activate --allow-root
wp plugin update --all --allow-root

version=$(php -r 'echo PHP_MAJOR_VERSION.".".PHP_MINOR_VERSION;')
cp /www.conf /etc/php/$version/fpm/pool.d/www.conf

mkdir -p /run/php

FPM="/usr/sbin/php-fpm$version"
$FPM -F