FROM alpine:3.9

RUN echo "https://dl-cdn.alpinelinux.org/alpine/edge/community/" >> /etc/apk/repositories;
RUN apk update && apk add bash influxdb telegraf

EXPOSE 8086

# telegraf
# setup telegraf
COPY telegraf.conf /etc/telegraf/

COPY start.sh .
# Launch all
CMD /bin/bash start.sh