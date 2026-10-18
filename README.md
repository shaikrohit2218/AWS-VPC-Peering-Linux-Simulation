# AWS VPC Peering — Linux Networking Simulation

A hands-on Linux networking project that demonstrates how two
isolated IP networks communicate through a router using static
routes and IPv4 forwarding.

## Project Overview

This project simulates AWS VPC peering concepts locally on
Ubuntu running through Windows WSL2. It does not require AWS
resources or incur AWS charges.

## Network Architecture

                    Simulated Router
                   /                \
                  /                  \
             VPC A                    VPC B
          10.10.0.0/16             10.20.0.0/16
          10.10.1.10               10.20.1.10
          Gateway:                 Gateway:
          10.10.1.1                10.20.1.1

## Technologies Used

- Ubuntu Linux on WSL2
- Linux network namespaces
- Virtual Ethernet interfaces (veth)
- IPv4 addressing and CIDR
- Static routing
- IPv4 packet forwarding
- ping and iproute2
- Git and GitHub

## Features

- Two isolated network namespaces
- A separate router namespace
- Static routes between the networks
- Bidirectional connectivity testing
- Routing table inspection
- Documented test results

## Network Addressing

| Component | Address |
|---|---|
| VPC A network | 10.10.0.0/16 |
| VPC A endpoint | 10.10.1.10 |
| VPC A gateway | 10.10.1.1 |
| VPC B network | 10.20.0.0/16 |
| VPC B endpoint | 10.20.1.10 |
| VPC B gateway | 10.20.1.1 |

## Test Results

The initial VPC A to VPC B ping test succeeded:
- Packets transmitted: 4
- Packets received: 4
- Packet loss: 0%

The reverse ping test also succeeded with 0% packet loss.

See [docs/test-results.md](docs/test-results.md).

## Run the Simulation

The setup script creates the network namespaces, virtual
interfaces, IP addresses, routes, and router forwarding rule.

Run it from the project directory:

    sudo bash scripts/setup.sh

Note: the setup script expects the namespaces not to exist
already. Delete the existing lab namespaces before rerunning
the script.

## Limitations

This is a local Linux networking simulation. The router models
the forwarding role of a connection between two networks.
It does not create actual AWS VPCs, AWS route tables, security
groups, or an AWS VPC peering connection.

## Learning Outcomes

- Understanding CIDR and subnet addressing
- Creating Linux network namespaces
- Configuring virtual network interfaces
- Adding static routes
- Enabling IPv4 forwarding
- Testing and troubleshooting network connectivity

## Author

Rohit Shaik

## License

This project is provided for educational purposes.
