service mysql start
echo "CREATE DATABASE wordpress DEFAULT CHARACTER SET utf8mb4;" | mysql -u root
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'localhost' WITH GRANT OPTION;" | mysql -u root
echo "update mysql.user set plugin='mysql_native_password' where user='root';" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root
