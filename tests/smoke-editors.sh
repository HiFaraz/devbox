#!/bin/bash
set -e
# Smoke tests for editors role

echo "=== Editors Role Smoke Tests ==="

vim --version | head -1
if [ $? -ne 0 ]; then
    echo "FAIL: vim --version failed"
    exit 1
fi
echo "PASS: vim works"

nvim --version | head -1
if [ $? -ne 0 ]; then
    echo "FAIL: nvim --version failed"
    exit 1
fi
echo "PASS: neovim works"

nano --version | head -1
if [ $? -ne 0 ]; then
    echo "FAIL: nano --version failed"
    exit 1
fi
echo "PASS: nano works"

rg --version | head -1
if [ $? -ne 0 ]; then
    echo "FAIL: rg --version failed"
    exit 1
fi
echo "PASS: ripgrep works"

fdfind --version >/dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "FAIL: fdfind --version failed"
    exit 1
fi
echo "PASS: fd-find works"

fzf --version >/dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "FAIL: fzf --version failed"
    exit 1
fi
echo "PASS: fzf works"

shellcheck --version | head -1
if [ $? -ne 0 ]; then
    echo "FAIL: shellcheck --version failed"
    exit 1
fi
echo "PASS: shellcheck works"

code --version | head -1
if [ $? -ne 0 ]; then
    echo "FAIL: code --version failed"
    exit 1
fi
echo "PASS: VS Code works"
