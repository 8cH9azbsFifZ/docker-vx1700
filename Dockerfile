FROM debian:latest AS wine

# Install Wine & XFCE 
ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive
ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
RUN apt-get update && apt-get -y install gettext-base tigervnc-standalone-server dbus-x11 novnc python3-websockify python3-pip  xfce4 xdotool wget tar net-tools gnupg2 procps wine
RUN apt-get -qqy autoclean && rm -rf /tmp/* /var/tmp/*
ENV DISPLAY :0

RUN dpkg --add-architecture i386 && apt update && apt -y install wine32
ENV WINEARCH=win32
RUN winecfg

# Set VNC password
RUN mkdir /root/.vnc 
RUN echo "" | vncpasswd -f > /root/.vnc/passwd
RUN chmod 0600 /root/.vnc/passwd
#RUN printf "password\npassword\n\n" | vncpasswd

RUN winecfg

# Prepare CE77
WORKDIR /app
ADD yaesu_ce77win /app
RUN mkdir -p /root/.wine/dosdevices/
RUN ln -s /dev/cat ~/.wine/dosdevices/com1


FROM wine AS novnc

ADD ./config/xfce4 /root/.config/xfce4
COPY entrypoint.sh .

EXPOSE 8080

CMD ["./entrypoint.sh"]
