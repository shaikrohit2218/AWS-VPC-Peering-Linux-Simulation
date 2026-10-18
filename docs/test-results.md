# AWS VPC Peering — Linux Simulation

## Environment
- Operating system: Ubuntu on Windows WSL2
- Tools: iproute2, iputils-ping
- VPC A CIDR: 10.10.0.0/16
- VPC B CIDR: 10.20.0.0/16

## Simulated endpoints
- VPC A: 10.10.1.10
- VPC B: 10.20.1.10
- Router interface toward VPC A: 10.10.1.1
- Router interface toward VPC B: 10.20.1.1

## Test result
VPC A to VPC B: PASS
- Packets transmitted: 4
- Packets received: 4
- Packet loss: 0%

## Architecture note
This is a local Linux routing simulation. The router models
the forwarding role of a connection between two networks.
It is not an actual AWS VPC peering connection.
