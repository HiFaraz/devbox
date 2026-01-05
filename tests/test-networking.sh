#!/bin/bash
set -e
# Tests for networking role

echo "=== Networking Role Tests ==="

if [ ! -f "roles/networking/tasks/main.yml" ]; then
    echo "FAIL: roles/networking/tasks/main.yml does not exist"
    exit 1
fi
echo "PASS: networking role exists"

for pkg in openssh-client openssh-server curl wget ca-certificates gnupg ufw net-tools dnsutils iputils-ping traceroute; do
    if grep -q "$pkg" roles/networking/tasks/main.yml; then
        echo "PASS: networking role references $pkg"
    else
        echo "FAIL: networking role does not reference $pkg"
        exit 1
    fi
done
