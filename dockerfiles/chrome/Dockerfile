# docker run -v /tmp/.X11-unix:/tmp/.X11-unix \
#   -v /dev/snd:/dev/snd \
#   -e DISPLAY=unix$DISPLAY \
#   --device /dev/dri \
#   bkju/chrome

#FROM debian:jessie
FROM ubuntu:trusty
MAINTAINER bkju
ENV REFRESHED_AT 2015-11-15

ENV HOME /home/user
RUN useradd --create-home --home-dir $HOME user \
    && chown -R user:user $HOME

ENV LANG C.UTF-8

# https://www.google.com/linuxrepositories/

RUN apt-get -yqq update 
RUN apt-get -yqq install gnupg curl

RUN curl https://dl.google.com/linux/linux_signing_key.pub | apt-key add -

RUN sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list' \
&& chmod 644 /etc/apt/sources.list.d/google-chrome.list

RUN apt-get -yqq update 
RUN apt-get -yqq install google-chrome-stable

RUN rm -rf /var/lib/apt/lists/*

RUN chown root:user /opt/google/chrome/chrome-sandbox
RUN chmod 4755 /opt/google/chrome/chrome-sandbox

WORKDIR $HOME
USER user

CMD [ "google-chrome" ]
