FROM ubuntu:14.04
MAINTAINER Jarret Raim <jarret@raim.io>

# To get rid of error messages like "debconf: unable to initialize frontend: Dialog":
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

RUN apt-get -qq update &&\
    apt-get -qqy --force-yes dist-upgrade

RUN apt-get install -qqy wget

RUN wget -q -O /tmp/plex-media-server.deb https://d094b47584b89614f59f-d7ec5dd44c7e2bf2d2eb5be09fa8b339.ssl.cf1.rackcdn.com/plexmediaserver_0.9.11.7.803-87d0708_amd64.deb

RUN dpkg -i /tmp/plex-media-server.deb

VOLUME /mnt/config

ADD ./start.sh /start.sh
RUN chmod u+x  /start.sh

EXPOSE 32400

CMD ["/start.sh"]
