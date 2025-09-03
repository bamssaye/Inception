FROM alpine:3.20

RUN apk update && apk add --no-cache mariadb

COPY ./conf/mariadb.conf ./tools/script.sh /

# EXPOSE 3306
# RUN chmod +x /script.sh
CMD ["/bin/sh", "/script.sh"]
