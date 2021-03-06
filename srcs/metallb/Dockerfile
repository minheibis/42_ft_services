FROM alpine:3.9

RUN apk update && apk add influxdb

EXPOSE 8086

CMD influxd run -config /etc/influxdb.conf