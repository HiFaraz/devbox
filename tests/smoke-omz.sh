#!/bin/bash
set -e
# Smoke tests for omz role

echo "=== OMZ Role Smoke Tests ==="

if [ ! -f "$HOME/.oh-my-zsh/oh-my-zsh.sh" ]; then
    echo "FAIL: oh-my-zsh not installed"
    exit 1
fi
echo "PASS: oh-my-zsh installed"

if [ ! -f "$HOME/.zshrc" ]; then
    echo "FAIL: .zshrc not created"
    exit 1
fi
echo "PASS: .zshrc exists"
