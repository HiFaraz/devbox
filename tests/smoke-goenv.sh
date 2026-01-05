#!/bin/bash
# Smoke tests for goenv role
set -e

echo "=== Goenv Role Smoke Tests ==="

export GOENV_ROOT="${HOME}/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"

goenv --version
if [ $? -ne 0 ]; then
    echo "FAIL: goenv --version failed"
    exit 1
fi
echo "PASS: goenv works"
