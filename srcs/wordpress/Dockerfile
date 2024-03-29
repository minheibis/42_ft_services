FROM base_docker:latest

RUN	apk update && apk add nginx php7 php7-fpm \
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
RUN	rm /etc/nginx/nginx.conf
COPY ./nginx.conf /etc/nginx/nginx.conf

# Wordpress
# Download
RUN wget https://wordpress.org/latest.tar.gz
RUN tar xvf latest.tar.gz
RUN mv wordpress /var/www/
RUN rm latest.tar.gz
# config
COPY ./wp-config.php /var/www/wordpress/
RUN chown -R www:www /var/www/wordpress/

RUN	openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/example.key -out /etc/nginx/example.crt -subj "/C=FR/ST=IDE/L=Paris/O=42/OU=42/CN=mywebsite.com" 

# telegraf
# setup telegraf
COPY telegraf.conf /etc/telegraf/

COPY ./start.sh .

EXPOSE 5050

CMD	["sh", "./start.sh" ]