#!/bin/bash
set -e
# Tests for rbenv role

echo "=== Rbenv Role Tests ==="

if [ ! -f "roles/rbenv/tasks/main.yml" ]; then
    echo "FAIL: roles/rbenv/tasks/main.yml does not exist"
    exit 1
fi
echo "PASS: rbenv role exists"

if grep -q "rbenv" roles/rbenv/tasks/main.yml; then
    echo "PASS: rbenv role references rbenv"
else
    echo "FAIL: rbenv role does not reference rbenv"
    exit 1
fi

if grep -q "ruby-build" roles/rbenv/tasks/main.yml; then
    echo "PASS: rbenv role references ruby-build"
else
    echo "FAIL: rbenv role does not reference ruby-build"
    exit 1
fi
