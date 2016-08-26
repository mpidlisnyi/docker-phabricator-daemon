#!/bin/bash
source /phabricator_configs_init.sh
erb -T - /msmtp.conf.erb > /etc/msmtp.conf
bin/storage upgrade --force
exec ${@} < /phd-daemon.json
