# docker-vx1700

# Test Hamlib
echo f |rigctl -m 120 -r  /dev/tty.usbserial-1420 -vvvvv
docker run -t -i --device=/dev/ttyUSB0 docker-vx1700 bash
echo get_freq |rigctl -m 133 -r /dev/ttyUSB4  -s 4800 -C stop_bits=2 -vvvvv

# Use CE77WIN
~/.wine/dosdevices/

# Hardware
- Make sure S4002 and S4003 or in Position "A" (cf. manual)
- USE the 9-pin Connector with a "null modem" cable.

