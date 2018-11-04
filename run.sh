#! /usr/bin/env bash

open -a XQuartz
ip_address=$(ifconfig | grep inet | grep -v : | grep -v 127.0.0.1 | cut -d ' ' -f2)
xhost + $ip_address

docker run \
    --env DISPLAY=$ip_address:0 \
    --detach \
    --name cisco-packet-tracer \
    --privileged \
    --rm \
    --volume /tmp/.X11-unix/:/tmp/.X11-unix/ \
    --volume $HOME/CiscoPacketTracer:/root/pt \
    cisco-packet-tracer
