#!/bin/bash
set -e
# Unit tests for configure.sh

echo "=== Configure Script Tests ==="

# Test: configure.sh exists
if [ ! -f "configure.sh" ]; then
    echo "FAIL: configure.sh does not exist"
    exit 1
fi
echo "PASS: configure.sh exists"

# Test: configure.sh is executable
if [ ! -x "configure.sh" ]; then
    echo "FAIL: configure.sh is not executable"
    exit 1
fi
echo "PASS: configure.sh is executable"

# Test: configure.sh prompts for git user.name
if grep -q "read.*user.name\|read.*USER_NAME" configure.sh; then
    echo "PASS: configure.sh prompts for git user.name"
else
    echo "FAIL: configure.sh does not prompt for git user.name"
    exit 1
fi

# Test: configure.sh prompts for git user.email
if grep -q "read.*user.email\|read.*USER_EMAIL" configure.sh; then
    echo "PASS: configure.sh prompts for git user.email"
else
    echo "FAIL: configure.sh does not prompt for git user.email"
    exit 1
fi

# Test: configure.sh sets git config
if grep -q "git config --global user.name" configure.sh && grep -q "git config --global user.email" configure.sh; then
    echo "PASS: configure.sh sets git config"
else
    echo "FAIL: configure.sh does not set git config"
    exit 1
fi

# Test: configure.sh checks for SSH key
if grep -q "ssh-keygen\|\.ssh" configure.sh; then
    echo "PASS: configure.sh handles SSH keys"
else
    echo "FAIL: configure.sh does not handle SSH keys"
    exit 1
fi

# Test: configure.sh checks GitHub CLI auth
if grep -q "gh auth" configure.sh; then
    echo "PASS: configure.sh checks GitHub CLI auth"
else
    echo "FAIL: configure.sh does not check GitHub CLI auth"
    exit 1
fi

# Test: configure.sh sets powerline theme
if grep -q "ZSH_THEME.*agnoster\|powerline" configure.sh; then
    echo "PASS: configure.sh sets powerline theme"
else
    echo "FAIL: configure.sh does not set powerline theme"
    exit 1
fi

# Test: configure.sh sets default shell to zsh
if grep -q "chsh -s" configure.sh; then
    echo "PASS: configure.sh sets default shell to zsh"
else
    echo "FAIL: configure.sh does not set default shell to zsh"
    exit 1
fi

# Test: configure.sh adds zsh auto-launch to bashrc
if grep -q '>> "\$BASHRC"' configure.sh; then
    echo "PASS: configure.sh adds zsh auto-launch to bashrc"
else
    echo "FAIL: configure.sh does not add zsh auto-launch to bashrc"
    exit 1
fi
