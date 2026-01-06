#!/bin/bash
set -e
# Test: User package roles use correct home directory variable

echo "=== User Roles Home Directory Tests ==="

# Test: pyenv role uses user home variable
if grep -q "ansible_user_dir\|lookup.*SUDO_USER\|user_home" roles/pyenv/tasks/main.yml; then
    echo "PASS: pyenv role uses user home variable"
else
    echo "FAIL: pyenv role does not use user home variable"
    exit 1
fi

# Test: rbenv role uses user home variable
if grep -q "ansible_user_dir\|lookup.*SUDO_USER\|user_home" roles/rbenv/tasks/main.yml; then
    echo "PASS: rbenv role uses user home variable"
else
    echo "FAIL: rbenv role does not use user home variable"
    exit 1
fi

# Test: rustup role uses user home variable
if grep -q "ansible_user_dir\|lookup.*SUDO_USER\|user_home" roles/rustup/tasks/main.yml; then
    echo "PASS: rustup role uses user home variable"
else
    echo "FAIL: rustup role does not use user home variable"
    exit 1
fi

# Test: goenv role uses user home variable
if grep -q "ansible_user_dir\|lookup.*SUDO_USER\|user_home" roles/goenv/tasks/main.yml; then
    echo "PASS: goenv role uses user home variable"
else
    echo "FAIL: goenv role does not use user home variable"
    exit 1
fi

# Test: sdkman role uses user home variable
if grep -q "ansible_user_dir\|lookup.*SUDO_USER\|user_home" roles/sdkman/tasks/main.yml; then
    echo "PASS: sdkman role uses user home variable"
else
    echo "FAIL: sdkman role does not use user home variable"
    exit 1
fi

# Test: omz role uses user home variable
if grep -q "ansible_user_dir\|lookup.*SUDO_USER\|user_home" roles/omz/tasks/main.yml; then
    echo "PASS: omz role uses user home variable"
else
    echo "FAIL: omz role does not use user home variable"
    exit 1
fi
