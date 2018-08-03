FROM debian:9
MAINTAINER Will

RUN apt-get update && apt-get install -y openssh-server \
  && apt-get -y --purge autoremove && apt-get clean && rm -rf /var/lib/apt/lists/* \
  
RUN echo 'root:root' |chpasswd

RUN sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config && \
	sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

RUN mkdir -p /var/run/sshd
	
EXPOSE 22 80 443 1080 12500 25000

CMD    ["/usr/sbin/sshd", "-eD"]
