#!/usr/bin/env bash
set -e

# Create simulated router
ip netns add router

# Create virtual link between VPC A and router
ip link add a-router type veth peer name router-a
ip link set a-router netns vpc-a
ip link set router-a netns router

# Create virtual link between VPC B and router
ip link add b-router type veth peer name router-b
ip link set b-router netns vpc-b
ip link set router-b netns router

# Configure VPC A
ip -n vpc-a addr add 10.10.1.10/16 dev a-router
ip -n vpc-a link set lo up
ip -n vpc-a link set a-router up
ip -n vpc-a route add 10.20.0.0/16 via 10.10.1.1

# Configure VPC B
ip -n vpc-b addr add 10.20.1.10/16 dev b-router
ip -n vpc-b link set lo up
ip -n vpc-b link set b-router up
ip -n vpc-b route add 10.10.0.0/16 via 10.20.1.1

# Configure router interfaces
ip -n router addr add 10.10.1.1/16 dev router-a
ip -n router addr add 10.20.1.1/16 dev router-b
ip -n router link set lo up
ip -n router link set router-a up
ip -n router link set router-b up

# Enable IPv4 forwarding
ip netns exec router sysctl -w net.ipv4.ip_forward=1

echo "Network setup completed successfully."
