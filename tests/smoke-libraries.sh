#!/bin/bash
set -e
# Smoke tests for libraries role

echo "=== Libraries Role Smoke Tests ==="

for pkg in libssl-dev libffi-dev zlib1g-dev libreadline-dev libbz2-dev libsqlite3-dev libncurses-dev libxml2-dev libxslt1-dev libyaml-dev; do
    dpkg -s "$pkg" >/dev/null 2>&1
    if [ $? -ne 0 ]; then
        echo "FAIL: $pkg not installed"
        exit 1
    fi
    echo "PASS: $pkg installed"
done
