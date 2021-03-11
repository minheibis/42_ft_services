mkdir -p /ftp/$USER
echo -e "$PASSWORD\n$PASSWORD" | adduser -h /ftp/$USER -s /sbin/nologin $USER
chown $USER:$USER /ftp/$USER
echo "hereistext" > /ftp/$USER/username.txt

/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf &

telegraf 