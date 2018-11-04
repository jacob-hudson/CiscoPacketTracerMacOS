# Cisco Packet Tracer Dockerfile
# author: Jacob A. Hudson

FROM ubuntu

LABEL maintainer "Jacob A. Hudson <jacob.alan.hudson@gmail.com>"

RUN apt-get update
RUN apt-get install -y qtmultimedia5-dev libqt5script5 libqt5webkit5 libqt5scripttools5 libqt5svg5 libssl1.0.0 ca-certificates wget apt-utils
RUN mkdir -p /opt/pt
COPY PacketTracer72Linux64.tar.gz /tmp/pt/Cisco-PT-711-x64.tar.gz
RUN tar -xzvf /tmp/pt/Cisco-PT-711-x64.tar.gz -C /opt/pt
RUN sed 's/III/\/opt\/pt/' /opt/pt/tpl.packettracer > /opt/pt/packettracer
RUN sed -i 's/^export/# export/' /opt/pt/packettracer
RUN sed 's/III/\/opt\/pt/' /opt/pt/tpl.linguist > /opt/pt/linguist
RUN chmod +x /opt/pt/linguist /opt/pt/packettracer
RUN apt-get clean
RUN rm -rf /tmp/pt /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENTRYPOINT ["/opt/pt/packettracer"]
