FROM alpine:3.9

RUN apk update && apk add bash influxdb

EXPOSE 8086

CMD influxd -config /etc/influxdb.conf
