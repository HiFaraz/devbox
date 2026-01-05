#!/bin/bash
set -e
# Tests for docker role

echo "=== Docker Role Tests ==="

if [ ! -f "roles/docker/tasks/main.yml" ]; then
    echo "FAIL: roles/docker/tasks/main.yml does not exist"
    exit 1
fi
echo "PASS: docker role exists"

if grep -q "docker-ce" roles/docker/tasks/main.yml; then
    echo "PASS: docker role references docker-ce"
else
    echo "FAIL: docker role does not reference docker-ce"
    exit 1
fi

if grep -q "docker-compose-plugin" roles/docker/tasks/main.yml; then
    echo "PASS: docker role references docker-compose-plugin"
else
    echo "FAIL: docker role does not reference docker-compose-plugin"
    exit 1
fi

if grep -q "groups: docker" roles/docker/tasks/main.yml; then
    echo "PASS: docker role adds user to docker group"
else
    echo "FAIL: docker role does not add user to docker group"
    exit 1
fi
