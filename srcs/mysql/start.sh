mysql_install_db --user=root --datadir=/var/lib/mysql
sed -i 's/skip-networking/#skip-networking/' /etc/my.cnf.d/mariadb-server.cnf

mysqld -u root &
sleep 10
mysql -u root < /tmp/start.sql
mysql -u root < /tmp/wordpress.sql

telegraf