#!/bin/bash
set -e
# Tests for playbook.yml

echo "=== Playbook Tests ==="

if [ ! -f "playbook.yml" ]; then
    echo "FAIL: playbook.yml does not exist"
    exit 1
fi
echo "PASS: playbook.yml exists"

# Test that tags are defined for selective execution
if grep -q "tags:" playbook.yml; then
    echo "PASS: playbook.yml has tags defined"
else
    echo "FAIL: playbook.yml does not have tags defined"
    exit 1
fi

# Test specific tag groups
for tag in system user languages; do
    if grep -q "'$tag'" playbook.yml; then
        echo "PASS: playbook.yml has '$tag' tag"
    else
        echo "FAIL: playbook.yml missing '$tag' tag"
        exit 1
    fi
done

# Test that each role has a tag
for role in base libraries networking utilities databases editors cloud docker nvm pyenv rbenv rustup goenv sdkman; do
    if grep -q "'$role'" playbook.yml; then
        echo "PASS: playbook.yml has '$role' tag"
    else
        echo "FAIL: playbook.yml missing '$role' tag"
        exit 1
    fi
done
