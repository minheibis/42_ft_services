#tail -f /dev/null
influxd -config /etc/influxdb.conf &
sleep 5
telegraf