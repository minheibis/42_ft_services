FROM alpine:3.9

# install packages
RUN apk update; \
	apk add bash vim nginx mysql-client openssl

# Wordpress
# Download
#RUN wget https://wordpress.org/latest.tar.gz
#RUN tar xvf latest.tar.gz
#RUN mv wordpress /var/www/html
#RUN rm latest.tar.gz
# Configuration
#RUN cp /root/wp-config.php /var/www/html/wordpress/
#RUN rm /var/www/html/wordpress/wp-config-sample.php
#RUN chown -R www-data:www-data /var/www/html/wordpress/

# Set SSL certificate
RUN openssl req -newkey rsa:4096 -days 365 -nodes -x509 -subj "/C=JP/ST=Tokyo/L=Tokyo/O=42Tokyo/OU=hyuki/CN=localhost" -out /etc/ssl/certs/localhost.crt -keyout /etc/ssl/private/localhost.key

EXPOSE 5050

CMD tail -f /dev/null
