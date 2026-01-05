#!/bin/bash
# Smoke tests for rbenv role

echo "=== Rbenv Role Smoke Tests ==="

export HOME=/home/faraz
export PATH="$HOME/.rbenv/bin:$PATH"

rbenv --version
if [ $? -ne 0 ]; then
    echo "FAIL: rbenv --version failed"
    exit 1
fi
echo "PASS: rbenv works"
