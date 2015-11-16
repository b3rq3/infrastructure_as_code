#!/usr/bin/env bash
############
# Date="Wed 2015-10-28"
# Author="berq"
############
export HOME=/opt/cumtum
source /opt/venv/bin/activate
cd $HOME
uwsgi --ini uwsgi_unixsocket.ini
exit $?
