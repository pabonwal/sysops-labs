#!/bin/bash
# monitor_start_all.sh

# start grafana
./tmp/monitor_start_grafana.sh &

# start_prometheus
./tmp/monitor_start_prometheus.sh &

# start_node_exporter
./tmp/monitor_start_node_exporter.sh &

# start_sshd
./tmp/monitor_start_sshd.sh &

# wait for any process to exit
wait -n

# exit with status of process that exited first
exit $?