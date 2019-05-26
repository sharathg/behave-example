FROM ubuntu:18.04
MAINTAINER Sharath G Pai <sharath.g.pai@gmail.com>
ENV DEBIAN_FRONTEND noninteractive

#=================
# Install Packages
#=================
RUN apt-get update && \
    apt-get install -y \
    python3-dev \
    python3-pip \
    unzip \
    wget  \
    zip && \
    apt-get clean -y && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#================
# Install Firefox
#================
RUN FIREFOX_VERSION="66.0.3" \
  && FIREFOX_DOWNLOAD_URL="https://download-installer.cdn.mozilla.net/pub/firefox/releases/$FIREFOX_VERSION/linux-x86_64/en-US/firefox-$FIREFOX_VERSION.tar.bz2" \
  && apt-get update -qqy \
  && apt-get -qqy --no-install-recommends install firefox \
  && rm -rf /var/lib/apt/lists/* /var/cache/apt/* \
  && wget --no-verbose -O /tmp/firefox.tar.bz2 $FIREFOX_DOWNLOAD_URL \
  && apt-get -y purge firefox \
  && rm -rf /opt/firefox \
  && tar -C /opt -xjf /tmp/firefox.tar.bz2 \
  && rm /tmp/firefox.tar.bz2 \
  && mv /opt/firefox /opt/firefox-$FIREFOX_VERSION \
  && ln -fs /opt/firefox-$FIREFOX_VERSION/firefox /usr/bin/firefox

#====================
# Install GeckoDriver
#====================
RUN GK_VERSION="0.24.0" \
  && echo "Using GeckoDriver version: "$GK_VERSION \
  && wget --no-verbose -O /tmp/geckodriver.tar.gz https://github.com/mozilla/geckodriver/releases/download/v$GK_VERSION/geckodriver-v$GK_VERSION-linux64.tar.gz \
  && rm -rf /opt/geckodriver \
  && tar -C /opt -zxf /tmp/geckodriver.tar.gz \
  && rm /tmp/geckodriver.tar.gz \
  && mv /opt/geckodriver /opt/geckodriver-$GK_VERSION \
  && chmod 755 /opt/geckodriver-$GK_VERSION \
  && ln -fs /opt/geckodriver-$GK_VERSION /usr/bin/geckodriver

#=============================
# Define Environment Variables
#=============================
ENV SHELL=/bin/bash
ENV PATH=/home/behave/selenium/:${PATH}

#==================
# Add user to Group
#==================
RUN getent group 1000 || groupadd behave --gid 1000 && \
    useradd --create-home --shell /bin/bash behave --uid 1000 --gid 1000

#============
# Change User
#============
USER behave
SHELL ["/bin/bash", "-l", "-c"]

#============================
# Install Python Dependencies
#============================
COPY requirements.txt /home/behave/
RUN pip3 install -r /home/behave/requirements.txt