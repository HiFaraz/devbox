#!/bin/bash
set -e
# Tests for base role

echo "=== Base Role Tests ==="

# Unit tests: role file exists and has expected content
if [ ! -f "roles/base/tasks/main.yml" ]; then
    echo "FAIL: roles/base/tasks/main.yml does not exist"
    exit 1
fi
echo "PASS: base role exists"

for pkg in git build-essential cmake pkg-config autoconf; do
    if grep -q "$pkg" roles/base/tasks/main.yml; then
        echo "PASS: base role references $pkg"
    else
        echo "FAIL: base role does not reference $pkg"
        exit 1
    fi
done
