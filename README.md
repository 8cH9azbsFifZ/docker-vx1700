# docker-vx1700

# Use CE77WIN
- Software to programm the VX-1700

# Hardware
- Preparation for CAT: Make sure S4002 and S4003 or in Position "A" (cf. manual)
- Cable for CAT: USE the 9-pin Connector with a "null modem" cable. (i.e. https://www.amazon.de/gp/product/B008634VJY/ref=ppx_od_dt_b_asin_title_s00?ie=UTF8&psc=1)
- Cable for PTT (RTS) (i.e. https://radioarena.co.uk/data-mode-cables/audio-usb-ptt/vertex/vertex-standard-vx-1700-data-mode-cable.html)

# Soundcard:
- https://github.com/mviereck/x11docker/wiki/Container-sound:-ALSA-or-Pulseaudio

apt-get -y install pulseaudio-utils pulseaudio
