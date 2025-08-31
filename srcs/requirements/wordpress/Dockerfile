FROM alpine:3.21

RUN apk update && apk add --no-cache php-fpm php-mysql curl

COPY ./conf/wp-config.php  ./conf/www.conf ./tools/script.sh /

CMD [ "chmod +x script.sh && ./script.sh" ]
