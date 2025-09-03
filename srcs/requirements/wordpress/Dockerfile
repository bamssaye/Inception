FROM alpine:3.20

RUN apk update && apk add --no-cache \
    php \
    php-fpm \
    php-mysqli \
    php-pdo \
    php-pdo_mysql \
    curl 

COPY ./conf/wp-config.php  ./conf/www.conf ./tools/script.sh /

# RUN chmod +x /script.sh

CMD ["/bin/sh", "/script.sh"]
