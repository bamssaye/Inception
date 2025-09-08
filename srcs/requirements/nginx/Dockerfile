FROM alpine:3.21

RUN apk update 
RUN apk add --no-cache nginx openssl

RUN mkdir -p /files
COPY ./conf/nginx.conf  /files
COPY ./tools/script.sh  /files

EXPOSE 443

CMD ["/files/script.sh"]