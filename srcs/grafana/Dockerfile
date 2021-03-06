FROM alpine:3.9

RUN apk add --no-cache libc6-compat

RUN wget https://dl.grafana.com/oss/release/grafana-7.2.1.linux-amd64.tar.gz ; \
        tar xzvf grafana-7.2.1.linux-amd64.tar.gz ; \
        mv grafana-7.2.1 grafana ; \
	rm grafana-7.2.1.linux-amd64.tar.gz

//COPY grafana.db /grafana/data/

EXPOSE 3000

CMD cd /grafana/bin ; \
        ./grafana-server