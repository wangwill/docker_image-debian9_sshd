FROM debian:9
MAINTAINER Jakub Kwiatkowski <jakub@ajbisoft.pl>

RUN apt-get update && apt-get install -y python openssh-server \
  && apt-get -y --purge autoremove && apt-get clean && rm -rf /var/lib/apt/lists/* \
  && mkdir /var/run/sshd && mkdir -p /root/.ssh/

EXPOSE 22

CMD [ "/usr/sbin/sshd", "-eD" ]
