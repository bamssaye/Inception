FROM alpine:3.21

RUN apk update && apk add --no-cache nginx

COPY ./conf/nginx.conf ./tools/script.sh /

CMD [ "chmod +x script.sh && ./script.sh" ]