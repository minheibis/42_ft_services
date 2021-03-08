echo -e "$PASSWORD\n$PASSWORD" | adduser $USER

/usr/sbin/sshd
telegraf &
nginx -g "daemon off;"