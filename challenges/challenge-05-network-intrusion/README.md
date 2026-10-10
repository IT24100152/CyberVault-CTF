# Stage 05 – Network Intrusion

## Challenge Details
- Category: Networking
- Difficulty: Moderate
- Points: 300
- Flag format: `CVCTF{...}`

## Scenario
The CyberVault security team detected suspicious traffic from a workstation.
A packet capture was collected for investigation.

Analyse the supplied PCAP file to determine which HTTP request is suspicious
and identify the incident associated with the server response.

## Objectives
1. Open the PCAP in Wireshark.
2. Identify the suspicious HTTP request.
3. Use Follow TCP Stream to inspect the related communication.
4. Determine the incident evidence and submit the flag.

## Suggested Tools
- Wireshark
- tcpdump
- tshark
- strings

## Rules
- Analyse only the evidence supplied with this challenge.
- Do not attack or scan external systems.
- Submit the flag recovered from the captured traffic.
