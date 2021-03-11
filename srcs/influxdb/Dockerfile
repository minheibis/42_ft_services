FROM base_docker:latest

RUN apk update && apk add influxdb

EXPOSE 8086

# telegraf
# setup telegraf
COPY telegraf.conf /etc/telegraf/

COPY start.sh .
# Launch all
CMD /bin/bash start.sh