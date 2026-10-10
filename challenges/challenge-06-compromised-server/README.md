# Stage 06 – Compromised Server

## Challenge Details
- Category: Linux Security
- Difficulty: Moderate
- Points: 350
- Flag format: `CVCTF{...}`

## Scenario
The CyberVault security team suspects that a Linux server was compromised.
Authentication logs and command-history artefacts were preserved for investigation.

## Objectives
1. Analyse the authentication log for repeated failed SSH login attempts.
2. Identify the source address associated with those attempts.
3. Find the account that executed a privileged command.
4. Determine which sensitive file the command accessed.
5. Use the evidence to recover and submit the flag.

## Suggested Tools
- cat
- grep
- awk
- less
- find

## Rules
- Analyse only the evidence supplied with this challenge.
- Do not connect to or attack external systems.
- The supplied logs are synthetic training artefacts.
