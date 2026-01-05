#!/bin/bash
set -e
# Smoke tests for base role

echo "=== Base Role Smoke Tests ==="

for cmd in git gcc cmake pkg-config autoconf; do
    $cmd --version >/dev/null 2>&1
    if [ $? -ne 0 ]; then
        echo "FAIL: $cmd --version failed"
        exit 1
    fi
    echo "PASS: $cmd works"
done
