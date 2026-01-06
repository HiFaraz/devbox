#!/bin/bash
set -e
# Smoke tests for docker role

echo "=== Docker Role Smoke Tests ==="

docker --version
if [ $? -ne 0 ]; then
    echo "FAIL: docker --version failed"
    exit 1
fi
echo "PASS: docker works"

# Check docker version is 24.x+
docker_version=$(docker --version | grep -oP '\d+\.\d+' | head -1)
major_version=$(echo "$docker_version" | cut -d. -f1)
if [ "$major_version" -ge 24 ]; then
    echo "PASS: docker version $docker_version >= 24.x"
else
    echo "FAIL: docker version $docker_version < 24.x"
    exit 1
fi

# Check Compose V2 plugin
docker compose version
if [ $? -ne 0 ]; then
    echo "FAIL: docker compose version failed"
    exit 1
fi
echo "PASS: docker compose v2 works"

# Test docker can run containers
docker run hello-world
if [ $? -ne 0 ]; then
    echo "FAIL: docker run hello-world failed"
    exit 1
fi
echo "PASS: docker can run containers"
