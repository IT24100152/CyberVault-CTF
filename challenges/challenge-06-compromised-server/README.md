# Stage 06 – Compromised Server

## Challenge Details
- Category: Linux Security
- Difficulty: Moderate
- Points: 350
- Flag format: `CVCTF{...}`

## Scenario
The CyberVault security team suspects suspicious activity on a Linux server.
Authentication logs and command-history artefacts were preserved for investigation.

## Objectives
1. Analyse the authentication log for repeated failed SSH login attempts.
2. Identify the source IP address associated with those failed attempts.
3. Identify the account that executed a privileged command.
4. Determine which sensitive file the command accessed.
5. Construct the flag using the evidence and the rule below.

## Flag Construction Rule
Construct the flag using these three values, in this order:

1. The source IP associated with the repeated failed SSH attempts. Replace each dot (`.`) with an underscore (`_`).
2. The account that executed the privileged command.
3. The filename of the sensitive file accessed, excluding its directory path.

Convert the values to lowercase and join them with underscores (`_`).
Wrap the resulting string in `CVCTF{...}`.

Use only the supplied evidence. Do not assume that the IP associated with failed logins is the same source as the successful login.

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
