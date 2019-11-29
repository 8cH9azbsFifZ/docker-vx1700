#!/bin/bash
set -e 

echo "Start sink for CAT port"
socat PTY,link=/dev/cat TCP:$RIGSERVER:$RIGSERVER_CAT_PORT &
socat PTY,link=/dev/ptt TCP:$RIGSERVER:$RIGSERVER_PTT_PORT &


echo "Configure Pulseaudio for remote access"
#pulseaudio -k
cat << eof >> /etc/pulse/default.pa 
load-module module-tunnel-sink-new server=10.101.10.53 sink_name=Remote 
load-module module-tunnel-source-new server=10.101.10.53 source_name=Remote1
eof
pulseaudio --start


exec "$@"

