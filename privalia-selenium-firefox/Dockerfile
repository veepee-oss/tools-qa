FROM selenium/node-base:3.9.1-actinium
LABEL authors=PrivaliaQATeam

USER root

#=========
# Firefox
#=========
  COPY firefox-60.0.tar.bz2 /tmp/firefox.tar.bz2
  RUN apt-get update -qqy \
  && apt-get -qqy --no-install-recommends install firefox \
  && rm -rf /var/lib/apt/lists/* /var/cache/apt/* \
  && apt-get -y purge firefox \
  && rm -rf /opt/firefox \
  && tar -C /opt -xjf /tmp/firefox.tar.bz2 \
  && rm /tmp/firefox.tar.bz2 \
  && mv /opt/firefox /opt/firefox-60.0 \
  && ln -fs /opt/firefox-60.0/firefox /usr/bin/firefox

#============
# GeckoDriver
#============
COPY geckodriver-v0.20.1-linux64.tar.gz /tmp/geckodriver.tar.gz
RUN rm -rf /opt/geckodriver \
  && tar -C /opt -zxf /tmp/geckodriver.tar.gz \
  && rm /tmp/geckodriver.tar.gz \
  && chmod 755 /opt/geckodriver \
  && ln -fs /opt/geckodriver /usr/bin/geckodriver

#=====
# VNC
#=====
RUN apt-get update -qqy \
  && apt-get -qqy install \
  x11vnc \
  && rm -rf /var/lib/apt/lists/* /var/cache/apt/*

#=========
# fluxbox
# A fast, lightweight and responsive window manager
#=========
RUN apt-get update -qqy \
  && apt-get -qqy install \
    fluxbox \
  && rm -rf /var/lib/apt/lists/* /var/cache/apt/*


USER seluser

#==============================
# Generating the VNC password as seluser
# So the service can be started with seluser
#==============================
RUN mkdir -p ~/.vnc \
  && x11vnc -storepasswd secret ~/.vnc/passwd


#============================================
# Scripts to run Selenium Node
#============================================
COPY entry_point.sh /opt/bin/entry_point.sh

COPY generate_config /opt/bin/generate_config

# Running this command as sudo just to avoid the message:
# To run a command as administrator (user "root"), use "sudo <command>". See "man sudo_root" for details.
# When logging into the container
RUN sudo echo ""

# Generating a default config during build time
RUN /opt/bin/generate_config > /opt/selenium/config.json

EXPOSE 5900