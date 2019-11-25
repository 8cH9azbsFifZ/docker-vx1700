# docker-vx1700

docker run --rm -it -e PTT_CAT=/dev/ttyUSB0 -e TTY_CAT=/dev/ttyUSB1 --device=/dev/ttyUSB0 --device=/dev/ttyUSB1 -p 8080:8080 asdlfkj31h/vx1700:0.1




# Test Hamlib
echo f |rigctl -m 120 -r  /dev/tty.usbserial-1420 -vvvvv
docker run -t -i --device=/dev/ttyUSB0 docker-vx1700 bash
echo get_freq |rigctl -m 133 -r /dev/ttyUSB4  -s 4800 -C stop_bits=2 -vvvvv

# Use CE77WIN
- Software to programm the VX-1700

# Hardware
- Make sure S4002 and S4003 or in Position "A" (cf. manual)
- USE the 9-pin Connector with a "null modem" cable. (i.e. https://www.amazon.de/gp/product/B008634VJY/ref=ppx_od_dt_b_asin_title_s00?ie=UTF8&psc=1)
   FTDI USB Serial Device converter now attached to ttyUSB0

    # dmesg|grep FTDI |tail -n1|sed 's/.* //g'

- Use Cable (i.e. https://radioarena.co.uk/data-mode-cables/audio-usb-ptt/vertex/vertex-standard-vx-1700-data-mode-cable.html)
- PTT: RTS
   pl2303 converter now attached to ttyUSB4

    # dmesg|grep pl2303|tail -n1|sed 's/.* //g'


# Soundcard:
- https://github.com/mviereck/x11docker/wiki/Container-sound:-ALSA-or-Pulseaudio

apt-get -y install pulseaudio-utils pulseaudio
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
    --user $(id -u):$(id -g) --rm -it -e PTT_CAT=/dev/ttyUSB0 -e TTY_CAT=/dev/ttyUSB1 --device=/dev/ttyUSB0 --device=/dev/ttyUSB1 -p 8080:8080 asdlfkj31h/vx1700:0.1




docker run --rm \
    --env PULSE_SERVER=unix:/tmp/pulseaudio.socket \
    --env PULSE_COOKIE=/tmp/pulseaudio.cookie \
    --volume /tmp/pulseaudio.socket:/tmp/pulseaudio.socket \
    --volume /tmp/pulseaudio.client.conf:/etc/pulse/client.conf \
    --user $(id -u):$(id -g) --rm -it -e PTT_CAT=/dev/ttyUSB0 -e TTY_CAT=/dev/ttyUSB1 --device=/dev/ttyUSB0 --device=/dev/ttyUSB1 -p 8080:8080 asdlfkj31h/vx1700:0.1




