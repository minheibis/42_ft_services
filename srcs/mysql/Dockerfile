FROM alpine:3.9

# Installing packages MariaDB
RUN apk update; \
	apk add --no-cache bash vim openrc mysql mysql-client

RUN addgroup mysql mysql; \
	chown -R mysql:mysql /var/lib/mysql; \
	mkdir -p /run/mysqld/; \
	chown -R mysql:mysql /run/mysqld/

COPY start.sh .
COPY start.sql /tmp/start.sql

EXPOSE 3306

CMD /bin/bash /start.sh

