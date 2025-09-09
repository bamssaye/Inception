#!/bin/sh
# set -ex

until nc -z "$DB_HOST" $DB_PORT; do
    sleep 3
done

version=$(php -r 'echo PHP_MAJOR_VERSION.PHP_MINOR_VERSION;')
if [ ! -f /var/www/html/wp-config-sample.php ]; then
    mkdir -p /var/www/html && cd /var/www/html
    php -d memory_limit=512M /usr/local/bin/wp core download --allow-root --force --path=/var/www/html
fi

if [ ! -f /var/www/html/wp-config.php ]; then
    URL="https://$DOMAIIN_NAME"
    wp config create \
      --dbname="$DB_NAME" \
      --dbuser="$DB_USER" \
      --dbpass="$DB_PASSWORD" \
      --dbhost="$DB_HOST" \
      --allow-root
    wp config set WP_HOME "$URL" --type=constant --allow-root
    wp config set WP_SITEURL "$URL" --type=constant --allow-root
    
fi

if ! wp core is-installed --path=/var/www/html --allow-root; then
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

    wp theme install variations --activate --allow-root
    wp plugin update --all --allow-root
    wp plugin install redis-cache --activate --path=/var/www/html --allow-root
    
    wp config set WP_REDIS_HOST redis --path=/var/www/html --allow-root 
    wp config set WP_REDIS_PORT 6379 --path=/var/www/html --raw --allow-root 
    wp config set WP_CACHE true --path=/var/www/html --raw --allow-root 
    wp redis enable --path=/var/www/html --allow-root
    mv /files/www.conf /etc/php$version/php-fpm.d/www.conf
    mkdir -p /run/php
fi

#     
FPM="/usr/sbin/php-fpm$version"
$FPM -F

