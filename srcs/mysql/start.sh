mysql_install_db --user=root --datadir=/var/lib/mysql
sed -i 's/skip-networking/#skip-networking/' /etc/my.cnf.d/mariadb-server.cnf

cat > /tmp/start.sql << eof
CREATE DATABASE wordpress DEFAULT CHARACTER SET utf8mb4;
CREATE USER 'wordpress'@'%' IDENTIFIED BY 'wppass';
GRANT ALL PRIVILEGES ON *.* TO 'wordpress'@'%';
FLUSH PRIVILEGES;
eof

#telegraf &
mysqld -u root &
sleep 10
mysql -u root < /tmp/start.sql
tail -f /dev/null
