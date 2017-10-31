FROM debian:9
MAINTAINER Jakub Kwiatkowski <jakub@ajbisoft.pl>

RUN apt-get update && apt-get install -y openssh-server \
  && apt-get -y --purge autoremove && apt-get clean && rm -rf /var/lib/apt/lists/* \
  && mkdir /var/run/sshd
  
EXPOSE 22

CMD [ "/usr/sbin/sshd", "-D" ]

