FROM asdlfkj31h/debian-wine:0.2

MAINTAINER Gerolf Ziegenhain <gerolf.ziegenhain@gmail.com>

# Configuration VX1700
ENV TTY_CAT /dev/ttyUSB0
ENV TTY_PTT /dev/ttyUSB1
ENV SOUND_IN NONE
ENV SOUND_OUT NONE

# Configuration Operator
ENV CALLSIGN DG6FL
ENV LOCATOR JN49dx

# Prepare CE77
ADD yaesu_ce77win /
RUN mkdir -p /root/.wine/dosdevices/
RUN ln -s /dev/ttyUSB0 ~/.wine/dosdevices/com1
RUN ln -s /dev/ttyUSB1 ~/.wine/dosdevices/com2

# Install additional SW
RUN apt-get update
RUN apt-get -y install libhamlib-utils wsjtx fldigi
RUN apt-get -y install socat ser2net
RUN apt-get -qqy autoclean && rm -rf /tmp/* /var/tmp/*


EXPOSE 8080

CMD ["/usr/bin/supervisord"]
