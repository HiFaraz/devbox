#!/bin/bash
set -e
# Unit tests for configure.sh

echo "=== Configure Script Tests ==="

# Test: configure.sh exists
if [ ! -f "configure.sh" ]; then
    echo "FAIL: configure.sh does not exist"
    exit 1
fi
echo "PASS: configure.sh exists"

# Test: configure.sh is executable
if [ ! -x "configure.sh" ]; then
    echo "FAIL: configure.sh is not executable"
    exit 1
fi
echo "PASS: configure.sh is executable"

# Test: configure.sh checks git user.name
if grep -q "git config.*user.name" configure.sh; then
    echo "PASS: configure.sh checks git user.name"
else
    echo "FAIL: configure.sh does not check git user.name"
    exit 1
fi

# Test: configure.sh checks git user.email
if grep -q "git config.*user.email" configure.sh; then
    echo "PASS: configure.sh checks git user.email"
else
    echo "FAIL: configure.sh does not check git user.email"
    exit 1
fi

# Test: configure.sh checks for SSH key
if grep -q "ssh-keygen\|\.ssh" configure.sh; then
    echo "PASS: configure.sh handles SSH keys"
else
    echo "FAIL: configure.sh does not handle SSH keys"
    exit 1
fi

# Test: configure.sh checks GitHub CLI auth
if grep -q "gh auth" configure.sh; then
    echo "PASS: configure.sh checks GitHub CLI auth"
else
    echo "FAIL: configure.sh does not check GitHub CLI auth"
    exit 1
fi
