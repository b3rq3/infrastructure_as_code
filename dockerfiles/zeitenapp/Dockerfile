FROM ubuntu:14.04
MAINTAINER bkju
ENV REFRESHED_AT 2015-10-28

# install dependencies
RUN apt-get -yqq update 
RUN apt-get -yqq install git python3 python3.4-venv python3-pip nginx \
nodejs-legacy npm supervisor
# cleanup apt-files
RUN rm -rf /var/lib/apt/lists/*

# prepare the python pyenv and install the requirements
RUN pyvenv-3.4 /opt/venv
ADD zeitenapp/requirements.txt /opt/venv/requirements.txt
RUN cd /opt/venv && . bin/activate && pip3 install -r /opt/venv/requirements.txt

# install npm modules 
# one need an unprivliged user for installing
RUN adduser --disabled-password --gecos '' njs
ADD zeitenapp/package.json /home/njs/package.json
ADD zeitenapp/bower.json /home/njs/bower.json
RUN su -l njs -c "npm install"
#RUN cd /tmp && npm install

# create the necessary folders
RUN mkdir -p /var/log/supervisor 

#nginx
ADD default.conf /etc/nginx/conf.d/default.conf
ADD nginx.conf /etc/nginx/nginx.conf
RUN mkdir -p /etc/nginx/ssl
ADD zeitenapp/app01.key /etc/nginx/ssl/app01.key
ADD zeitenapp/app01.pem /etc/nginx/ssl/app01.pem

# supervisord
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# add the sourcecode
ADD zeitenapp /opt/zeitenapp

# add the node_module and bower_components
RUN cp -a /home/njs/node_modules /opt/zeitenapp && cp -a /home/njs/bower_components /opt/zeitenapp/zeitenapp/app

# ADD the zeitenapp.sh script for supervisord
ADD zeitenapp.sh /opt/zeitenapp/zeitenapp.sh
RUN chmod 0700 /opt/zeitenapp/zeitenapp.sh

VOLUME [ "/var/cache/nginx", "/zeitenapp", "/tmp" ]

EXPOSE 80 443

#ENTRYPOINT [ "/usr/bin/supervisord" ]
CMD [ "/usr/bin/supervisord" ]
