FROM selenium/node-base:3.9.1-actinium
LABEL authors=PrivaliaQATeam

USER root

#============================================
# Google Chrome
#============================================
ARG CHROME_VERSION="64.0.3282.140"
COPY chrome64_64.0.3282.140.deb /tmp/google-chrome-stable.deb
RUN apt-get update -qqy \
  && apt-get -qqy install \
  fonts-liberation \
  gconf-service \
  libappindicator1 \
  libasound2 \
  libatk1.0-0 \
  libcairo2 \
  libgconf-2-4 \
  libgdk-pixbuf2.0-0 \
  libglib2.0-0 \
  libxss1 \
  lsb-release \
  xdg-utils \
  && dpkg -i /tmp/google-chrome-stable.deb

#============================================
# VNC and xvfb
#============================================
RUN apt-get update -qqy \
  && apt-get -qqy install \
  apt-utils \
  x11vnc \
  xvfb \
  && rm -rf /var/lib/apt/lists/* /var/cache/apt/*

#============================================
# Chrome Launch Script Wrapper
#============================================
COPY wrap_chrome_binary /opt/bin/wrap_chrome_binary
RUN /opt/bin/wrap_chrome_binary

#============================================
# Locale settings
#============================================
ENV LANGUAGE en_US.UTF-8
ENV LANG en_US.UTF-8
RUN locale-gen en_US.UTF-8 \
  && dpkg-reconfigure --frontend noninteractive locales \
  && apt-get update -qqy \
  && apt-get -qqy --no-install-recommends install \
    language-pack-en \
  && rm -rf /var/lib/apt/lists/* /var/cache/apt/*

#============================================
# Fonts
#============================================
RUN apt-get update -qqy \
  && apt-get -qqy --no-install-recommends install \
    fonts-ipafont-gothic \
    xfonts-100dpi \
    xfonts-75dpi \
    xfonts-cyrillic \
    xfonts-scalable \
  && rm -rf /var/lib/apt/lists/* /var/cache/apt/*

#============================================
# fluxbox
# A fast, lightweight and responsive window manager
#============================================
RUN apt-get update -qqy \
  && apt-get -qqy install \
    fluxbox \
  && rm -rf /var/lib/apt/lists/* /var/cache/apt/*

USER seluser

#============================================
# Chrome webdriver
#============================================
# can specify versions by CHROME_DRIVER_VERSION
# Latest released version will be used by default
#============================================
ARG CHROME_DRIVER_VERSION="2.35"
RUN CD_VERSION=$(if [ ${CHROME_DRIVER_VERSION:-latest} = "latest" ]; then echo $(wget -qO- https://chromedriver.storage.googleapis.com/LATEST_RELEASE); else echo $CHROME_DRIVER_VERSION; fi) \
  && echo "Using chromedriver version: "$CD_VERSION \
  && wget --no-verbose -O /tmp/chromedriver_linux64.zip https://chromedriver.storage.googleapis.com/$CD_VERSION/chromedriver_linux64.zip \
  && rm -rf /opt/selenium/chromedriver \
  && unzip /tmp/chromedriver_linux64.zip -d /opt/selenium \
  && rm /tmp/chromedriver_linux64.zip \
  && mv /opt/selenium/chromedriver /opt/selenium/chromedriver-$CD_VERSION \
  && chmod 755 /opt/selenium/chromedriver-$CD_VERSION \
  && sudo ln -fs /opt/selenium/chromedriver-$CD_VERSION /usr/bin/chromedriver

#============================================
# Generating the VNC password as seluser
# So the service can be started with seluser
#============================================

RUN mkdir -p ~/.vnc \
  && x11vnc -storepasswd secret ~/.vnc/passwd

#============================================
# Scripts to run Selenium Node
#============================================
COPY entry_point.sh /opt/bin/entry_point.sh


COPY generate_config /opt/bin/generate_config

# Generating a default config during build time
RUN /opt/bin/generate_config > /opt/selenium/config.json

EXPOSE 5900
