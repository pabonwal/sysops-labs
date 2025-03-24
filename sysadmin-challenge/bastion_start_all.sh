#!/bin/bash
# bastion_start_all.sh

# start_node_exporter
./tmp/bastion_start_node_exporter.sh &

# start_sshd
./tmp/bastion_start_sshd.sh &

# start_firewall
#./tmp/bastion_start_firewall.sh &

# wait for any process to exit
wait -n

# exit with status of process that exited first
exit $?