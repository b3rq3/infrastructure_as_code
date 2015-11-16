FROM debian:jessie
MAINTAINER bkju
ENV REFRESHED_AT 2015-10-25

ENV HOME /home/user
RUN useradd --create-home --home-dir $HOME user \
    && mkdir -p $HOME/.config/profanity \
    && chown -R user:user $HOME

ENV LANG C.UTF-8

RUN apt-get -yqq update 
RUN apt-get -yqq install git automake make autoconf libssl-dev libexpat1-dev libncursesw5-dev libglib2.0-dev \
                 libnotify-dev libcurl3-dev libxss-dev libotr5-dev libreadline-dev libtool \
                 libgpgme11-dev uuid-dev coreutils curl
RUN rm -rf /var/lib/apt/lists/*

#ADD ["profanity-0.4.7.tar.gz", "/opt/"]
RUN curl -o /opt/profanity-0.4.7.tar.gz http://www.profanity.im/profanity-0.4.7.tar.gz 
RUN echo "1d9406796d2aaa6761ee5d2f660c1cbdfb300998  profanity-0.4.7.tar.gz" > /opt/sha1sum
RUN cd /opt && sha1sum -c /opt/sha1sum
RUN cd /opt/ && tar xzf /opt/profanity-0.4.7.tar.gz

RUN git clone git://github.com/strophe/libstrophe.git /opt/profanity-0.4.7/libstrophe
RUN cd /opt/profanity-0.4.7/libstrophe/ && git checkout 0.8.8 && ./bootstrap.sh && ./configure --prefix=/usr/local && make && make install
RUN ldconfig
RUN cd /opt/profanity-0.4.7/ && ./configure && make && make install
RUN rm -rf /opt/profanity-0.4.7

WORKDIR $HOME
VOLUME $HOME/.config/profanity/

USER user

CMD [ "/usr/local/bin/profanity" ]
