FROM base_docker:latest

# install packages
RUN	apk --no-cache add nginx; \
	adduser -D -g 'www' www; \
	mkdir /www; \
	mkdir -p /run/nginx ; \
	chown -R www:www /var/lib/nginx; \
	chown -R www:www /www;

# COPY
COPY nginx.conf /etc/nginx/nginx.conf
COPY index.html /www/index.html

# set ssh
RUN ssh-keygen -q -t rsa -N '' -f /etc/ssh/ssh_host_rsa_key

# Set SSL certificate
RUN openssl req -newkey rsa:4096 -days 365 -nodes -x509 -subj "/C=JP/ST=Tokyo/L=Tokyo/O=42Tokyo/OU=hyuki/CN=localhost" -out /etc/ssl/certs/localhost.crt -keyout /etc/ssl/private/localhost.key

# setup nginx
RUN rc-service nginx checkconfig

# telegraf
# setup telegraf
COPY telegraf.conf /etc/telegraf/

EXPOSE 80 443 22

COPY start.sh .
# Launch all
CMD /bin/bash start.sh