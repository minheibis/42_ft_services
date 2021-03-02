FROM alpine:3.9

# Installing packages MariaDB
RUN apk update; \
	apk add --no-cache bash vim openrc mysql mysql-client
#RUN addgroup mysql mysql; \
#	chown -R mysql:mysql /var/lib/mysql; \
#	mkdir -p /run/openrc; \
#	touch /run/openrc/softlevel; \
#	mkdir -p /run/mysqld/; \
#	touch /run/mysqld/mysqld.sock; \
#	chown -R mysql:mysql /run/mysqld/
COPY my.cnf /etc/

# Copy of the MySQL startup script
#COPY start.sh start.sh

# Creating the persistent volume
# VOLUME [ "/var/lib/mysql" ]

EXPOSE 3306

COPY start.sh .

#COPY init.sql .

EXPOSE 3306

CMD /bin/sh /start.sh

#ENTRYPOINT [ "./start.sh" ]