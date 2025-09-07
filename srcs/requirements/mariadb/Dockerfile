FROM alpine:3.21

RUN apk update
RUN apk add --no-cache mariadb  mariadb-client bash
RUN mkdir -p /var/log/mysql && chown -R mysql:mysql /var/log/mysql
RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld

RUN mkdir -p /files

COPY ./conf/mariadb-server.cnf      /files
COPY ./tools/script.sh              /files

CMD ["/files/script.sh"]
