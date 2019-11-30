FROM asdlfkj31h/debian-wine:0.2

MAINTAINER Gerolf Ziegenhain <gerolf.ziegenhain@gmail.com>

# Configuration VX1700
ENV RIGSERVER 10.101.10.53
ENV RIGSERVER_PTT_PORT 3003
ENV RIGSERVER_CAT_PORT 3002
ENV RIGMODEL 133

# Configuration Operator
ENV CALLSIGN DG6FL
ENV LOCATOR JN49dx

# Prepare CE77
ADD yaesu_ce77win /
RUN mkdir -p /root/.wine/dosdevices/
RUN ln -s /dev/cat ~/.wine/dosdevices/com1

# Install additional SW
RUN apt-get update
RUN apt-get -y install libhamlib-utils wsjtx fldigi
RUN apt-get -y install socat 
RUN apt-get -y install pulseaudio pavucontrol
RUN apt-get -qqy autoclean && rm -rf /tmp/* /var/tmp/*

#HEALTHCHECK --interval=10s --timeout=3s CMD rigctl -m $RIGMODEL -r /dev/YPort f ||exit 1


ADD startup.sh /bin
RUN mkdir /root/.config
ADD WSJT-X.ini /root/.config
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf


EXPOSE 8080

ENTRYPOINT ["startup.sh"]
CMD ["/usr/bin/supervisord"]
