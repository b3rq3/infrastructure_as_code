FROM ubuntu:14.04
MAINTAINER bkju
ENV REFRESHED_AT 2015-10-23

RUN apt-get -yqq update 
RUN apt-get -yqq install nginx  \
                php5-common php5-fpm php5-cgi php5-cli php5-json php5-readline php5-sqlite \
                sqlite3  \
                supervisor 
RUN mkdir -p /var/www/roundcube && mkdir -p /var/log/supervisor
RUN rm -rf /var/lib/apt/lists/*

ADD default.conf /etc/nginx/conf.d/default.conf
ADD nginx.conf /etc/nginx/nginx.conf
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
ADD www.conf /etc/php5/fpm/pool.d/www.conf

VOLUME [ "/var/cache/nginx", "/var/www/roundcube" ]

EXPOSE 80 

ENTRYPOINT [ "/usr/bin/supervisord" ]
