FROM alpine:3.9

RUN echo "https://dl-cdn.alpinelinux.org/alpine/edge/community/" >> /etc/apk/repositories;
RUN apk update; \
	apk add --no-cache bash vim openrc vsftpd openssl telegraf

# Set SSL certificate
RUN openssl req -newkey rsa:4096 -days 365 -nodes -x509 -subj "/C=JP/ST=Tokyo/L=Tokyo/O=42Tokyo/OU=hyuki/CN=localhost" -out /etc/ssl/certs/vsftpd.crt -keyout /etc/ssl/private/vsftpd.key

#COPY vsftpd.conf /etc/vsftpd/vsftpd.conf


EXPOSE 20 21 21000 21001

# telegraf
# setup telegraf
COPY telegraf.conf /etc/telegraf/

#start.sh
COPY start.sh .

CMD /bin/bash /start.sh