FROM alpine:3.9

# Installing packages MariaDB
RUN echo "https://dl-cdn.alpinelinux.org/alpine/edge/community/" >> /etc/apk/repositories;
RUN apk update; \
	apk add --no-cache bash vim openrc mysql mysql-client telegraf

RUN addgroup mysql mysql; \
	chown -R mysql:mysql /var/lib/mysql; \
	mkdir -p /run/mysqld/; \
	chown -R mysql:mysql /run/mysqld/

COPY start.sh .
COPY start.sql /tmp/start.sql

# telegraf
# setup telegraf
COPY telegraf.conf /etc/telegraf/

EXPOSE 3306

CMD /bin/bash /start.sh

