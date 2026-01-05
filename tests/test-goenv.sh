#!/bin/bash
# Tests for goenv role

echo "=== Goenv Role Tests ==="

if [ ! -f "roles/goenv/tasks/main.yml" ]; then
    echo "FAIL: roles/goenv/tasks/main.yml does not exist"
    exit 1
fi
echo "PASS: goenv role exists"

if grep -q "goenv" roles/goenv/tasks/main.yml; then
    echo "PASS: goenv role references goenv"
else
    echo "FAIL: goenv role does not reference goenv"
    exit 1
fi
