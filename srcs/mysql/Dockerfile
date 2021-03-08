FROM base_docker:latest

# Installing packages MariaDB
RUN apk update; \
	apk add --no-cache mysql mysql-client

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

