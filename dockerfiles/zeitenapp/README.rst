=============
zeitenapp docker
=============

How to install:

- first clone into this folder the zeitenapp sourcecode
- build the docker: docker build -t="bkju/zeitenapp" .
- run the container: docker run -d --name=zeitenapp -p 443:443 bkju/zeitenapp
