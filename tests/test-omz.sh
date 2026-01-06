#!/bin/bash
set -e
# Tests for omz role

echo "=== OMZ Role Tests ==="

if [ ! -f "roles/omz/tasks/main.yml" ]; then
    echo "FAIL: roles/omz/tasks/main.yml does not exist"
    exit 1
fi
echo "PASS: omz role exists"

if grep -q "oh-my-zsh" roles/omz/tasks/main.yml; then
    echo "PASS: omz role references oh-my-zsh"
else
    echo "FAIL: omz role does not reference oh-my-zsh"
    exit 1
fi
