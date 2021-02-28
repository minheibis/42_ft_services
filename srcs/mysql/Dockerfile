FROM alpine:latest

# install packages
RUN apk update; \
	apk --no-cache add openrc mysql;

#COPY mysql.cnf /etc/my.cnf
#COPY mysql.cnf /etc/my.cnf
COPY creatdb.sql .
COPY setup_mysql.sh .
COPY wordpress.sql .
