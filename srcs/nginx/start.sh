echo -e "$PASSWORD\n$PASSWORD" | adduser $USER

# setup nginx
rc-service nginx checkconfig

/usr/sbin/sshd
telegraf &
nginx -g "daemon off;"