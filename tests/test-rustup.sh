#!/bin/bash
set -e
# Tests for rustup role

echo "=== Rustup Role Tests ==="

if [ ! -f "roles/rustup/tasks/main.yml" ]; then
    echo "FAIL: roles/rustup/tasks/main.yml does not exist"
    exit 1
fi
echo "PASS: rustup role exists"

if grep -q "rustup" roles/rustup/tasks/main.yml; then
    echo "PASS: rustup role references rustup"
else
    echo "FAIL: rustup role does not reference rustup"
    exit 1
fi
