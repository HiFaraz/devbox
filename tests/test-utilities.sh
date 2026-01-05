#!/bin/bash
set -e
# Tests for utilities role

echo "=== Utilities Role Tests ==="

if [ ! -f "roles/utilities/tasks/main.yml" ]; then
    echo "FAIL: roles/utilities/tasks/main.yml does not exist"
    exit 1
fi
echo "PASS: utilities role exists"

for pkg in cron htop tmux jq tree unzip zip rsync lsof strace; do
    if grep -q "$pkg" roles/utilities/tasks/main.yml; then
        echo "PASS: utilities role references $pkg"
    else
        echo "FAIL: utilities role does not reference $pkg"
        exit 1
    fi
done
