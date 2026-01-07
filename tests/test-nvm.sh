#!/bin/bash
set -e
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

# Test: nvm role should configure zshrc
if grep -q "zshrc" roles/nvm/tasks/main.yml; then
    echo "PASS: nvm role configures zshrc"
else
    echo "FAIL: nvm role does not configure zshrc"
    exit 1
fi

# Test: nvm role should use user_home variable
if grep -q "user_home" roles/nvm/tasks/main.yml; then
    echo "PASS: nvm role uses user_home variable"
else
    echo "FAIL: nvm role does not use user_home variable"
    exit 1
fi
