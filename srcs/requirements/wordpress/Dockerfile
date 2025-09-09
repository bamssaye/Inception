FROM alpine:3.21

RUN apk update
RUN apk add --no-cache php mysql-client php-fpm php-phar php-mysqli php-pdo php-pdo_mysql php-mbstring php-iconv curl php-tokenizer  bash
RUN adduser -S -G www-data -h /var/www -s /sbin/nologin www-data || true

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 
RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /files
COPY ./conf/www.conf        /files
COPY ./tools/script.sh      /files


CMD ["/files/script.sh"]
