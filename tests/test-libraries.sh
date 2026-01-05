#!/bin/bash
# Tests for libraries role

echo "=== Libraries Role Tests ==="

if [ ! -f "roles/libraries/tasks/main.yml" ]; then
    echo "FAIL: roles/libraries/tasks/main.yml does not exist"
    exit 1
fi
echo "PASS: libraries role exists"

for pkg in libssl-dev libffi-dev zlib1g-dev libreadline-dev libbz2-dev libsqlite3-dev libncurses-dev libxml2-dev libxslt1-dev libyaml-dev; do
    if grep -q "$pkg" roles/libraries/tasks/main.yml; then
        echo "PASS: libraries role references $pkg"
    else
        echo "FAIL: libraries role does not reference $pkg"
        exit 1
    fi
done
