FROM ubuntu:16.04

RUN apt-get update && apt-get install -y exim4 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

EXPOSE 25

COPY exim.sh /exim.sh
RUN chmod 700 /exim.sh

VOLUME /var/spool/exim4
VOLUME /etc/exim4


CMD ["/exim.sh"]