FROM alpine:3.21

RUN	apk update && apk upgrade && apk add --no-cache redis
RUN mkdir -p /files
COPY ./tools/script.sh /files/script.sh

ENTRYPOINT ["/tmp/script.sh"]

