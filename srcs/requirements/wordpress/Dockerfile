FROM alpine:3.21

RUN apk update
RUN apk add --no-cache php php-fpm php-phar php-mysqli php-pdo php-pdo_mysql php-mbstring php-iconv curl bash
RUN	adduser -S nginx &&	addgroup -S nginx

RUN mkdir -p /files
COPY ./conf/www.conf        /files
COPY ./tools/script.sh      /files

EXPOSE 3306

CMD ["/files/script.sh"]
