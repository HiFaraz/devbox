#!/bin/bash
# Tests for sdkman role

echo "=== SDKMAN Role Tests ==="

if [ ! -f "roles/sdkman/tasks/main.yml" ]; then
    echo "FAIL: roles/sdkman/tasks/main.yml does not exist"
    exit 1
fi
echo "PASS: sdkman role exists"

if grep -q "sdkman" roles/sdkman/tasks/main.yml; then
    echo "PASS: sdkman role references sdkman"
else
    echo "FAIL: sdkman role does not reference sdkman"
    exit 1
fi
