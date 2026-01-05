#!/bin/bash
set -e
# Tests for cloud role

echo "=== Cloud Role Tests ==="

if [ ! -f "roles/cloud/tasks/main.yml" ]; then
    echo "FAIL: roles/cloud/tasks/main.yml does not exist"
    exit 1
fi
echo "PASS: cloud role exists"

for pkg in kubectl helm terraform aws gcloud gh; do
    if grep -q "$pkg" roles/cloud/tasks/main.yml; then
        echo "PASS: cloud role references $pkg"
    else
        echo "FAIL: cloud role does not reference $pkg"
        exit 1
    fi
done
