# setup nginx
rc-service nginx checkconfig

telegraf &
/usr/sbin/php-fpm7
nginx -g "daemon off;"