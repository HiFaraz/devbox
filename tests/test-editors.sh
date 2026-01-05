#!/bin/bash
# Tests for editors role

echo "=== Editors Role Tests ==="

if [ ! -f "roles/editors/tasks/main.yml" ]; then
    echo "FAIL: roles/editors/tasks/main.yml does not exist"
    exit 1
fi
echo "PASS: editors role exists"

for pkg in vim neovim nano ripgrep fd-find fzf shellcheck code; do
    if grep -q "$pkg" roles/editors/tasks/main.yml; then
        echo "PASS: editors role references $pkg"
    else
        echo "FAIL: editors role does not reference $pkg"
        exit 1
    fi
done
