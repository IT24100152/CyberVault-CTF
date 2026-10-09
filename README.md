# \# CyberVault CTF

# 

# CyberVault CTF is a cybersecurity Capture The Flag project developed for IE3132 Assignment 02.

# 

# The platform uses CTFd, Docker Compose, MariaDB and Redis to host cybersecurity challenges based on a corporate insider threat investigation.

# 

# \## Team Members

# 

# | Member | Responsibility |

# |---|---|

# | Member 1 | Platform deployment and architecture |

# | Member 2 – Thenul | Challenges 1–3 |

# | Member 3 – Kavindu | Challenges 4–6 |

# | Member 4 – Kaveesha | Integration and testing |

# 

# \## Requirements

# 

# \- Git

# \- Docker Desktop with Docker Compose

# \- Windows CMD

# \- Web browser

# 

# \## Installation

# 

# \### 1. Clone the project

# 

# ```cmd

# git clone https://github.com/IT24100152/CyberVault-CTF.git

# cd CyberVault-CTF

# ```

# 

# Switch to your assigned member branch:

# 

# ```cmd

# git fetch origin

# git switch --track origin/YOUR\_BRANCH\_NAME

# ```

# 

# \### 2. Clone CTFd

# 

# ```cmd

# git clone https://github.com/CTFd/CTFd.git platform\\ctfd

# cd platform\\ctfd

# git checkout 6b01b531e8445c781a8bdcdc9409400e19207037

# cd ..\\..

# ```

# 

# \### 3. Configure environment

# 

# ```cmd

# copy platform\\deployment\\.env.example platform\\deployment\\.env

# notepad platform\\deployment\\.env

# ```

# 

# Replace the example database passwords with strong, different passwords.

# 

# Set `CTFD\_PORT=8000` or another unused port.

# 

# \### 4. Start Docker containers

# 

# ```cmd

# docker compose -f platform\\deployment\\docker-compose.yml --env-file platform\\deployment\\.env up -d --build

# ```

# 

# \### 5. Verify containers

# 

# ```cmd

# docker compose -f platform\\deployment\\docker-compose.yml --env-file platform\\deployment\\.env ps

# ```

# 

# Verify that `ctfd`, `db` and `cache` are running.

# 

# \### 6. Open CTFd

# 

# Open `http://localhost:8000` or the port configured in `.env`.

# 

# Complete the administrator setup for a fresh installation.

# 

# \## Challenge Stages

# 

# | Stage | Challenge | Category | Points |

# |---|---|---|---|

# | 1 | Hidden Evidence | Steganography | 100 |

# | 2 | Broken Cipher | Cryptography | 150 |

# | 3 | Vulnerable Login | Web Security | 200 |

# | 4 | The Deleted File | Digital Forensics | 250 |

# | 5 | Network Intrusion | Networking | 300 |

# | 6 | Compromised Server | Linux Security | 350 |

# 

# The challenge entries and artifacts must be imported or configured separately after deployment.

# 

# \## Security

# 

# \- Do not commit `.env` files or credentials.

# \- Keep intentionally vulnerable challenge services isolated.

# \- Use localhost bindings for local development.

# \- Do not expose the CTF platform publicly without appropriate security controls.

# 

# \## Stop the Platform

# 

# ```cmd

# docker compose -f platform\\deployment\\docker-compose.yml --env-file platform\\deployment\\.env down

# ```

# 

# This stops and removes the containers while retaining the named volumes.

# 

# Do not use `down -v` unless intentionally deleting the deployment's stored data.

