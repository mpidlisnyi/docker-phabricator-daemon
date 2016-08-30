FROM mpidlisnyi/phabricator-base:latest
MAINTAINER maksim@nightbook.info

COPY daemon-entrypoint.sh /entrypoint
COPY phd-daemon.json /phd-daemon.json

RUN pip install dumb-init==1.1.3

RUN chmod +x /entrypoint
WORKDIR /srv/phabricator

ENTRYPOINT [ "/entrypoint" ]

CMD ["./scripts/daemon/phd-daemon"]
