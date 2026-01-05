#!/bin/bash
# Smoke tests for nvm role
set -e

echo "=== NVM Role Smoke Tests ==="

export NVM_DIR="${HOME}/.config/nvm"
. "$NVM_DIR/nvm.sh"

nvm --version
if [ $? -ne 0 ]; then
    echo "FAIL: nvm --version failed"
    exit 1
fi
echo "PASS: nvm works"
