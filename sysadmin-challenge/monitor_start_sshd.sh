#!/bin/bash
# monitor_start_sshd.sh

# starting ssh
mkdir /var/run/sshd ; /usr/sbin/sshd -e -D