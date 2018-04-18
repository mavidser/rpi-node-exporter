FROM resin/rpi-raspbian:stretch-20180411
LABEL maintainer="Sid Verma <me@sidverma.io>"

RUN apt-get update \
  && apt-get upgrade

ADD https://github.com/prometheus/node_exporter/releases/download/v0.16.0-rc.1/node_exporter-0.16.0-rc.1.linux-armv7.tar.gz /node-exporter.tar.gz

RUN mkdir node-exporter && \
  tar -xvf node-exporter.tar.gz -C /node-exporter/ --strip-components=1 && \
  rm node-exporter.tar.gz && \
  mkdir host && \
  mkdir host_root

EXPOSE 9100

ENTRYPOINT ["/node-exporter/node_exporter"]
