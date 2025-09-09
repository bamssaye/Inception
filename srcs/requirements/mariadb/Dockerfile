FROM alpine:3.21

RUN apk update && \
    apk add --no-cache mariadb  mariadb-client
RUN mkdir -p /var/log/mysql /run/mysqld /var/lib/mysql && \
    chown -R mysql:mysql /var/lib/mysql /var/log/mysql /run/mysqld



RUN mkdir -p /files

COPY ./conf/mariadb-server.cnf      /files
COPY ./tools/script.sh              /files

CMD ["/files/script.sh"]
