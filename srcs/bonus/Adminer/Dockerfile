FROM alpine:3.20

RUN apk update && apk add --no-cache \
    curl less mariadb-client php php-fpm php-common \
    php-session php-simplexml php-pdo php-pdo_mysql \
    php-iconv php-json php-gd php-curl php-xml \
    php-mysqli php-imap php-ldap php-ctype php-dom \
    php-soap php-posix php-gettext

RUN mkdir -p /var/www/html
RUN curl -L -o /var/www/html/index.php https://github.com/vrana/adminer/releases/download/v5.4.0/adminer-5.4.0.php
RUN adduser -u 82 -D -S -G www-data www-data && \
    chown -R www-data:www-data /var/www/html
COPY /tools/www.conf /etc/php83/php-fpm.d/www.conf

CMD ["php", "-S", "0.0.0.0:8080", "-t", "/var/www/html"]

