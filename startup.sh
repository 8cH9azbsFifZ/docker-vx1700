#!/bin/bash
TTY_CAT=/dev/$(dmesg|grep FTDI |tail -n1|sed 's/.* //g')
TTY_PTT=/dev/$(dmesg|grep pl2303|tail -n1|sed 's/.* //g')


pulseaudio --start

pactl load-module module-native-protocol-unix socket=/tmp/pulseaudio.socket

cat << eof > /tmp/pulseaudio.client.conf
default-server = unix:/tmp/pulseaudio.socket
# Prevent a server running in the container
autospawn = no
daemon-binary = /bin/true
# Prevent the use of shared memory
enable-shm = false
eof

docker run --rm \
    --env PULSE_SERVER=unix:/tmp/pulseaudio.socket \
    --env PULSE_COOKIE=/tmp/pulseaudio.cookie \
    --volume /tmp/pulseaudio.socket:/tmp/pulseaudio.socket \
    --volume /tmp/pulseaudio.client.conf:/etc/pulse/client.conf \
    --user $(id -u):$(id -g) --rm -it -e PTT_CAT=$TTY_CAT -e TTY_PTT=$TTY_PTT --device=$TTY_CAT --device=$TTY_PTT -p 8080:8080 asdlfkj31h/vx1700:0.1

