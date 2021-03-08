FROM alpine:3.9

RUN echo "https://dl-cdn.alpinelinux.org/alpine/edge/community/" >> /etc/apk/repositories;
RUN apk update; \
	apk add --no-cache bash vim openrc openssh openssl telegraf curl mysql-client
