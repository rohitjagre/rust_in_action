#!/bin/sh

sudo ip tuntap add mode tap name tap-rust user $user

sudo ip link set tap-rust up
sudo ip addr add 192.168.42.100/24 dev tap-rust

sudo iptables -t nat -A POSTROUTING -s 192.168.42.0/24 -j MASQUERADE
sudo sysctl net.ipv4.ip_forward=1

# to delete device
sudo ip tuntap del mode tap name tap-rust user $user
