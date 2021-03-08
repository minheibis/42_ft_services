FROM alpine:3.9

RUN apk add --no-cache bash vim libc6-compat

RUN wget https://dl.grafana.com/oss/release/grafana-7.4.3.linux-amd64.tar.gz
RUN tar -zxvf grafana-7.4.3.linux-amd64.tar.gz; \
	mv grafana-7.4.3 grafana ; \
	rm grafana-7.4.3.linux-amd64.tar.gz

#COPY grafana.db /grafana/data/

EXPOSE 3000

# telegraf
# setup telegraf
COPY telegraf.conf /etc/telegraf/

COPY start.sh .
# Launch all
CMD /bin/bash start.sh
