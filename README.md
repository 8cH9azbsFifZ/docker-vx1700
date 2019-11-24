# docker-vx1700

# Test Hamlib
echo f |rigctl -m 120 -r  /dev/tty.usbserial-1420 -vvvvv
docker run -t -i --device=/dev/ttyUSB0 docker-vx1700 bash
echo get_freq |rigctl -m 133 -r /dev/ttyUSB4  -s 4800 -C stop_bits=2 -vvvvv

# Use CE77WIN
~/.wine/dosdevices/

# Hardware
- Make sure S4002 and S4003 or in Position "A" (cf. manual)
- USE the 9-pin Connector with a "null modem" cable. (i.e. https://www.amazon.de/gp/product/B008634VJY/ref=ppx_od_dt_b_asin_title_s00?ie=UTF8&psc=1)
   FTDI USB Serial Device converter now attached to ttyUSB0

- Use Cable (i.e. https://radioarena.co.uk/data-mode-cables/audio-usb-ptt/vertex/vertex-standard-vx-1700-data-mode-cable.html)
- PTT: RTS
   pl2303 converter now attached to ttyUSB4





Soundcard:

