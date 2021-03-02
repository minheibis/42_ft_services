FROM alpine:3.9

# install packages
RUN apk update; \
apk --no-cache add bash vim curl openssh openssl nginx openrc; \
adduser -D -g 'www' www; \
mkdir /www; \
mkdir -p /run/nginx ; \
chown -R www:www /var/lib/nginx; \
chown -R www:www /www;

# COPY
COPY nginx.conf /etc/nginx/nginx.conf
COPY index.html /www/index.html

# Set SSL certificate
RUN openssl req -newkey rsa:4096 -days 365 -nodes -x509 -subj "/C=JP/ST=Tokyo/L=Tokyo/O=42Tokyo/OU=hyuki/CN=localhost" -out /etc/ssl/certs/localhost.crt -keyout /etc/ssl/private/localhost.key

# setup nginx
RUN rc-service nginx checkconfig

EXPOSE 80 443

# Launch all
CMD nginx -g "daemon off;"

