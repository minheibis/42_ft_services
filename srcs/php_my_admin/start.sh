telegraf &
/usr/sbin/php-fpm7
mysql -h mysql-service -u wordpress -pwppass < /var/www/phpmyadmin/sql/create_tables.sql
nginx -g "daemon off;"