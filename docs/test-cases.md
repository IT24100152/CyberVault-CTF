# CyberVault CTF - Test Cases

| Test ID | Test Description | Expected Result | Status |
|---|---|---|---|
| TC-01 | Verify Docker Compose configuration | Configuration is valid | Not Run |
| TC-02 | Verify all required containers start | Required containers are running | Not Run |
| TC-03 | Open the CTFd homepage | Homepage loads successfully | Not Run |
| TC-04 | Submit a correct flag | Challenge is marked as solved | Blocked |
| TC-05 | Submit an incorrect flag | Submission is rejected | Blocked |
| TC-06 | Submit an empty flag | Empty submission is handled correctly | Blocked |
| TC-07 | Submit a flag to the wrong challenge | Flag is not accepted for the wrong challenge | Blocked |
| TC-08 | Verify challenge progression | Progress updates according to challenge configuration | Blocked |
| TC-09 | Test the documented reset procedure | Services reset as expected | Not Run |
| TC-10 | Verify access control | Restricted actions require appropriate permissions | Not Run |
| TC-11 | Verify local service binding | CTFd port is bound to localhost | Not Run |
| TC-12 | Verify challenge instructions | Instructions are understandable and complete | Blocked |
| TC-13 | Verify integration of all six challenges | Configured challenges are accessible and functional | Blocked |
| TC-14 | Verify recovery after service restart | Services recover according to configuration | Not Run |

## Status Definitions

- **Not Run:** Testing has not yet been performed.
- **Pass:** Actual result matches the expected result.
- **Fail:** Actual result does not match the expected result.
- **Blocked:** Testing cannot proceed because a required component or configuration is unavailable.

## Test Execution Record

For each executed test, record the date, actual result, status, evidence, and any issue identified.

Do not mark a test as Pass until it has been executed and the result verified.
