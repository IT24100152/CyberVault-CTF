#!/bin/bash

set -u

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT_DIR" || exit 1

COMPOSE_FILE="platform/deployment/docker-compose.yml"
ENV_FILE="platform/deployment/.env"

echo "=== CyberVault CTF Validation ==="

if [ ! -f "$ENV_FILE" ]; then
    echo "FAIL: .env file not found."
    echo "Create it from .env.example before running validation."
    exit 1
fi

if ! docker info >/dev/null 2>&1; then
    echo "FAIL: Docker Desktop is not running."
    exit 1
fi

if ! docker compose -f "$COMPOSE_FILE" \
    --env-file "$ENV_FILE" config --quiet; then
    echo "FAIL: Docker Compose configuration is invalid."
    exit 1
fi

echo "PASS: Docker Compose configuration is valid."

docker compose -f "$COMPOSE_FILE" \
    --env-file "$ENV_FILE" ps

CTFD_PORT="$(grep '^CTFD_PORT=' "$ENV_FILE" | tail -n 1 | cut -d '=' -f 2)"
CTFD_PORT="${CTFD_PORT:-8000}"

if curl --fail --silent \
    "http://127.0.0.1:${CTFD_PORT}/" \
    --output /dev/null; then
    echo "PASS: CTFd homepage responds successfully."
else
    echo "FAIL: CTFd homepage is not responding."
    echo "Check whether the containers are running."
    exit 1
fi

echo "=== Validation completed ==="
