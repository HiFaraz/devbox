#!/bin/bash
# Test: Playbook exists and includes roles

echo "=== Playbook Structure Tests ==="

if [ ! -f "playbook.yml" ]; then
    echo "FAIL: playbook.yml does not exist"
    exit 1
fi
echo "PASS: playbook.yml exists"

# Test: Playbook includes all required roles
for role in base libraries networking utilities databases editors cloud docker nvm pyenv rbenv rustup goenv sdkman; do
    if grep -q "\- $role" playbook.yml; then
        echo "PASS: playbook.yml includes $role role"
    else
        echo "FAIL: playbook.yml does not include $role role"
        exit 1
    fi
done
