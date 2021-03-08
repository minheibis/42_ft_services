FROM base_docker:latest

RUN	apk add --no-cache vsftpd

# Set SSL certificate
RUN openssl req -newkey rsa:4096 -days 365 -nodes -x509 -subj "/C=JP/ST=Tokyo/L=Tokyo/O=42Tokyo/OU=hyuki/CN=localhost" -out /etc/ssl/certs/vsftpd.crt -keyout /etc/ssl/private/vsftpd.key

# set ftp
COPY vsftpd.conf /etc/vsftpd/vsftpd.conf

EXPOSE 20 21 21000 21001

# telegraf
# setup telegraf
COPY telegraf.conf /etc/telegraf/

#start.sh
COPY start.sh .

CMD /bin/bash /start.sh