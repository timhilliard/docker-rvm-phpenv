FROM ubuntu:14.04

MAINTAINER Tim Hilliard "https://github.com/timhilliard"

ADD install.sh /tmp/install.sh
RUN /bin/bash /tmp/install.sh
