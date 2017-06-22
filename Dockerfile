FROM thalhalla/steamer
MAINTAINER Josh Cox <josh 'at' webhosting coop>

ENV DOCKARMAIII_UPDATED 2017062001

# override these variables in with the prompts
ENV STEAM_GID=233780 \
  CLIENT_IP=10.42.227.21 \
  CLIENT_IP2=10.42.227.22 \
  CLIENT_IP3=10.42.227.23 \
  CLIENT_IP4=10.42.227.24 \
  CLIENT_IP5=10.42.227.25 \
  CLIENT_IP6=10.42.227.26

USER root
# install requirements
RUN apt-get update && apt-get install -y sudo less vim libtbb2:i386 && \
# remove git and tmp dirs
  apt-get remove -y git cmake linux-headers-amd64 build-essential libssl-dev libboost-dev libboost-thread-dev libboost-system-dev libsqlite3-dev libcurl4-openssl-dev libusb-dev zlib1g-dev libudev-dev && \
     apt-get autoremove -y && \
     apt-get clean && \
     rm -rf /var/lib/apt/lists/*

# and override this file with the command to start your server
COPY assets /assets
RUN chmod 755 /assets/*.sh && \
chmod 755 /assets/*.cfg && \
chmod 755 /assets/steamer.txt && \
chown -R steam. /home/steam

WORKDIR /home/steam

USER steam

CMD ["/bin/bash",  "/assets/controller.sh"]
