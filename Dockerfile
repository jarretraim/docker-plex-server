FROM ubuntu:trusty
MAINTAINER Jarret Raim <jarret@raim.io>

# Assuming that the Ubuntu Trusty image is updated. 

RUN apt-get -q update && apt-get install -qy --force-yes avahi-daemon avahi-utils
ADD http://plex-current.raim.io/plexmediaserver_current_amd64.deb /plexmediaserver.deb
RUN dkpg -i /plexmediaserver.deb
RUN rm /plexmediaserver.deb

VOLUME /config

COPY ./start.sh /start.sh
RUN chmod u+x  /start.sh

# Ports from here: https://plexapp.zendesk.com/hc/en-us/articles/201543147-What-network-ports-do-I-need-to-allow-through-my-firewall-
EXPOSE 32400:32400 32443:32443 1900:1900/udp 32463:32463 5353:5353/udp 32410:32410/udp 32412:32412/udp 32413:32413/udp 32414:32414/udp

CMD ["/start.sh"]