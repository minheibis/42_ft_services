FROM alpine:3.9

# install packages
RUN	apk update; \
	apk add bash vim mysql-client nginx curl openrc openssl openssh php7 php7-fpm \
	php7-mcrypt php7-soap php7-openssl php7-gmp \
	php7-pdo_odbc php7-json php7-dom php7-pdo \
	php7-zip php7-mysqli php7-sqlite3 php7-apcu \
	php7-pdo_pgsql php7-bcmath php7-gd php7-odbc \
	php7-pdo_mysql php7-pdo_sqlite php7-gettext \
	php7-xmlreader php7-xmlrpc php7-bz2 php7-iconv \
	php7-pdo_dblib php7-curl php7-ctype 

# nginx
RUN	adduser -D -g 'www' www; \
	mkdir /www; \
	mkdir -p /run/nginx ; \
	chown -R www:www /var/lib/nginx; \
	chown -R www:www /www;
COPY ./index.html var/www/
RUN	rm /etc/nginx/nginx.conf
COPY ./nginx.conf /etc/nginx/nginx.conf

# Wordpress
# Download
RUN wget https://wordpress.org/latest.tar.gz
RUN tar xvf latest.tar.gz
RUN mv wordpress /var/www/
RUN rm latest.tar.gz
# Configuration
COPY wp-config.php /var/www/wordpress/
COPY index.html /var/www/wordpress/
RUN rm /var/www/wordpress/wp-config-sample.php
RUN chown -R www:www /var/www/wordpress/

# Set SSL certificate
RUN openssl req -newkey rsa:4096 -days 365 -nodes -x509 -subj "/C=JP/ST=Tokyo/L=Tokyo/O=42Tokyo/OU=hyuki/CN=localhost" -out /etc/ssl/certs/localhost.crt -keyout /etc/ssl/private/localhost.key

# setup nginx
RUN rc-service nginx checkconfig

EXPOSE 5050

#COPY
COPY start.sh .
#CMD nginx -g "daemon off;"
CMD /bin/bash start.sh