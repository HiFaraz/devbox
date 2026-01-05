#!/bin/bash
# Smoke tests for rustup role

echo "=== Rustup Role Smoke Tests ==="

export HOME=/home/faraz
export PATH="$HOME/.cargo/bin:$PATH"

rustup --version
if [ $? -ne 0 ]; then
    echo "FAIL: rustup --version failed"
    exit 1
fi
echo "PASS: rustup works"
