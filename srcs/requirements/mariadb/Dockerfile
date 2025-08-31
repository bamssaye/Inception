FROM alpine:3.21

RUN apk update && apk add --no-cache mariadb-server

COPY ./conf/mariadb.conf ./tools/script.sh /

CMD [ "./script.sh" ]