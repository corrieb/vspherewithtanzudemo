#!/bin/bash

iptables -P INPUT ACCEPT
iptables -P OUTPUT ACCEPT
iptables -P FORWARD ACCEPT

# make sure forwarding is enabled in the kernel
echo 1 > /proc/sys/net/ipv4/ip_forward

# where is iptables located?
iptables=`which iptables`

# flush all existing rules
$iptables -F

# this is for NAT
# enable masquerading
/sbin/iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

# don't forward packets from off-lan to lan if
# they are a brand new connection being initiated
$iptables -A FORWARD -i eth0 -o eth1 -m state --state NEW -j REJECT

# if the packets come from off-lan but they are
# related to a connection that was established from
# within the lan, go ahead and forward them
$iptables -A FORWARD -i eth0 -o eth1 -m state --state RELATED,ESTABLISHED -j ACCEPT

# whatever traffic comes from the lan to go to
# the world allow thru
$iptables -A FORWARD -i eth1 -o eth0 -j ACCEPT

