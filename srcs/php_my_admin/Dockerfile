FROM alpine:3.9

# install packages
RUN echo "https://dl-cdn.alpinelinux.org/alpine/edge/community/" >> /etc/apk/repositories;
RUN apk update; \
	apk --no-cache add bash vim curl openssl nginx openrc mysql-client telegraf; \
	apk --no-cache add lighttpd php7-common php7-iconv php7-json php7-gd php7-curl;\
	apk --no-cache add php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo ;\
	apk --no-cache add php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt ;\
	apk --no-cache add php7-session php7-gettext php7-ldap php7-ctype php7-dom php7-fpm php7-mbstring;

# config nginx
RUN adduser -D -g 'www' www; \
	mkdir /www; \
	mkdir -p /run/nginx ; \
	chown -R www:www /var/lib/nginx; \
	chown -R www:www /www;

# phpMyAdmin
# Download
RUN wget https://files.phpmyadmin.net/phpMyAdmin/4.9.5/phpMyAdmin-4.9.5-all-languages.tar.gz
RUN tar xvf phpMyAdmin-4.9.5-all-languages.tar.gz
RUN mv phpMyAdmin-4.9.5-all-languages/ phpmyadmin/
RUN mv phpmyadmin/ /var/www/phpmyadmin/
RUN rm phpMyAdmin-4.9.5-all-languages.tar.gz
# Configuration
RUN mkdir -p /var/lib/phpmyadmin/tmp
RUN rm /var/www/phpmyadmin/config.sample.inc.php
RUN chown -R www:www /var/lib/phpmyadmin
RUN chown -R www:www /var/lib/phpmyadmin/tmp
RUN	chmod 777 /var/lib/phpmyadmin/tmp

# Set SSL certificate
RUN openssl req -newkey rsa:4096 -days 365 -nodes -x509 -subj "/C=JP/ST=Tokyo/L=Tokyo/O=42Tokyo/OU=hyuki/CN=localhost" -out /etc/ssl/certs/localhost.crt -keyout /etc/ssl/private/localhost.key

# COPY
COPY nginx.conf /etc/nginx/nginx.conf
COPY config.inc.php /var/www/phpmyadmin/config.inc.php
COPY start.sh .

# setup nginx
RUN rc-service nginx checkconfig

# telegraf
# setup telegraf
COPY telegraf.conf /etc/telegraf/

EXPOSE 5000

# Launch all
#CMD tail -f /dev/null
CMD /bin/bash start.sh