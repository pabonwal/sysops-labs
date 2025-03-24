#!/bin/bash
# bastion_start_sshd.sh

# starting ssh
mkdir /var/run/sshd ; /usr/sbin/sshd -e -D