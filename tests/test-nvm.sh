#!/bin/bash
# Tests for nvm role

echo "=== NVM Role Tests ==="

if [ ! -f "roles/nvm/tasks/main.yml" ]; then
    echo "FAIL: roles/nvm/tasks/main.yml does not exist"
    exit 1
fi
echo "PASS: nvm role exists"

if grep -q "nvm" roles/nvm/tasks/main.yml; then
    echo "PASS: nvm role references nvm"
else
    echo "FAIL: nvm role does not reference nvm"
    exit 1
fi
