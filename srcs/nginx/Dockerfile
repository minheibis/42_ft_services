FROM alpine:latest

# install packages
RUN apk update; \
apk --no-cache add curl openssh openssl nginx openrc; \
adduser -D -g 'www' www; \
mkdir /www; \
mkdir -p /run/nginx ; \
chown -R www:www /var/lib/nginx; \
chown -R www:www /www;

# COPY
COPY nginx.conf /etc/nginx/nginx.conf
COPY index.html /www/index.html

# run nginx
RUN rc-service nginx checkconfig

# Set SSL certificate
# RUN openssl req -newkey rsa:4096 -days 365 -nodes -x509 -subj "/C=JP/ST=Tokyo/L=Tokyo/O=42Tokyo/OU=hyuki/CN=localhost" -out /etc/ssl/certs/localhost.crt -keyout /etc/ssl/private/localhost.key

# EXPOSE 80
# EXPOSE 443
# EXPOSE 22

# Launch all
CMD nginx -g "daemon off;"
