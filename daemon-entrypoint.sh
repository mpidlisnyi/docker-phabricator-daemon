#!/bin/bash

source /phabricator_configs_init.sh

exec ${@} < /phd-daemon.json
