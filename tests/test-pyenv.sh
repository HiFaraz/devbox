#!/bin/bash
set -e
# Tests for pyenv role

echo "=== Pyenv Role Tests ==="

if [ ! -f "roles/pyenv/tasks/main.yml" ]; then
    echo "FAIL: roles/pyenv/tasks/main.yml does not exist"
    exit 1
fi
echo "PASS: pyenv role exists"

if grep -q "pyenv" roles/pyenv/tasks/main.yml; then
    echo "PASS: pyenv role references pyenv"
else
    echo "FAIL: pyenv role does not reference pyenv"
    exit 1
fi
