FROM alpine

RUN apk update && apk add influxdb

EXPOSE 8086

CMD influxd run -config /etc/influxdb.conf