# TROUBLESHOOTING

### Task
In case of an application server becomes unresponsive. You’ll need to identify and solve the issue.

### Approach
+ I will perform first part of the analysis from a remote machine, assuming server is not allowing to connect by ssh and the second part of the analysis from the physical server, assuming onsite location
+ We need to simulate that server becomes unresponsive so I will reduce the max count of incoming connections into the “affected” application server

### Steps
1. Prepare our unresponsive scenario (simulated)

    Simulate max 100 connections allowed in affected server
    ```
    echo 100 > /proc/sys/net/netfilter/nf_conntrack_max
    ```

    Send a bunch of http request to full nf_conntrack_max table
    ```
    ab -s 300 -n 100000 -c 1000 http://server1/
    ```

1. Analysis using a remote Ubuntu Linux console, I will perform some quick validation commands

    Dig to check if name resolution is working as expected
    ```
    dig server1
    ```

    Ping to check if server is alive (in case ICMP incoming packets are allowed)
    ```
    ping 192.168.0.201
    ```

    Tracepath to check routing to the server
    ```
    tracepath 192.168.0.201
    ```

    Netcat to check ssh port response
    ```
    nc -vvv 192.168.0.201 22
    ```

    Curl to check if application server is responding to http requests
    ```
    curl -i http://192.168.0.201/
    ```

1. As we could see, incoming connections to the server are unresponsive so it's time to get infront of the physical server and check system logs
    ```
    tail -F /var/log/syslog

    Jul 31 23:24:07 server1 kernel: [ 8430.420174] nf_conntrack: nf_conntrack: table full, dropping packet
    Jul 31 23:24:12 server1 kernel: [ 8435.544303] nf_conntrack: nf_conntrack: table full, dropping packet
    Jul 31 23:24:12 server1 kernel: [ 8435.544312] nf_conntrack: nf_conntrack: table full, dropping packet
    Jul 31 23:24:12 server1 kernel: [ 8435.544314] nf_conntrack: nf_conntrack: table full, dropping packet
    Jul 31 23:24:12 server1 kernel: [ 8435.544317] nf_conntrack: nf_conntrack: table full, dropping packet
    Jul 31 23:24:12 server1 kernel: [ 8435.544319] nf_conntrack: nf_conntrack: table full, dropping packet
    Jul 31 23:24:12 server1 kernel: [ 8435.544320] nf_conntrack: nf_conntrack: table full, dropping packet
    ```
    This output tell us where the problem is, our nf_conntrack table has been fulled due many incoming connections, so we need to determine if server has enough resources to increase the table size, if yes, we just need to set up a new value for nf_conntrack_max parameter.

    ```
    vim /etc/sysctl.conf
    net.netfilter.nf_conntrack_max = 524288
    sysctl -p
    ```