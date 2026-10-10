# Challenge 4 — The Deleted File

- **Category:** Digital Forensics
- **Difficulty:** Moderate
- **Points:** 250
- **Flag format:** `CVCTF{...}`

## Scenario

An investigation of Workstation-04 has uncovered evidence of a deleted archive and an incomplete recovery report. Some relevant information may no longer be accessible through normal file browsing.

Your task is to examine the supplied forensic artefacts and recover the missing information.

## Objective

Investigate the evidence, identify a relevant deleted artefact, and recover the challenge flag.

## Evidence Provided

- `evidence/workstation.img` — forensic disk image
- `evidence/recovered_fragment.txt` — partial archive recovery report
- `evidence/archive_fragment_7.bin` — archive-related fragment
- `evidence/incident_notes.txt` — incident notes
- `evidence/workstation_notes.txt` — workstation notes

## Suggested Tools

- Autopsy
- Sleuth Kit (`fls`, `istat`, `icat`)
- `strings`
- `grep`
- `find`
- `gzip`

## Investigation Guidance

- Examine the supplied files and identify relationships between the artefacts.
- Inspect the forensic image for deleted files and relevant metadata.
- Recover any relevant deleted content for further analysis.
- Consider whether recovered content requires additional processing before it becomes readable.

## Flag Submission

Submit the recovered flag through the CTF platform using the required format:

`CVCTF{...}`

## Challenge Validation

- Confirm the intended flag is accepted by CTFd.
- Confirm incorrect flags are rejected.
- Reset the challenge environment before another attempt.
