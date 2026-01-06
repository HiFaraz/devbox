#!/bin/bash
set -e

echo "=== Configuration ==="

# Git user configuration
GIT_USER_NAME=$(git config --global user.name 2>/dev/null || echo "")
GIT_USER_EMAIL=$(git config --global user.email 2>/dev/null || echo "")

if [ -z "$GIT_USER_NAME" ]; then
    echo "Git user.name not configured"
    echo "Run: git config --global user.name \"Your Name\""
else
    echo "Git user.name: $GIT_USER_NAME"
fi

if [ -z "$GIT_USER_EMAIL" ]; then
    echo "Git user.email not configured"
    echo "Run: git config --global user.email \"your.email@example.com\""
else
    echo "Git user.email: $GIT_USER_EMAIL"
fi

echo ""

# SSH key for GitHub
SSH_KEY="$HOME/.ssh/id_ed25519"
if [ -f "$SSH_KEY" ]; then
    echo "SKIP: SSH key already exists at $SSH_KEY"
else
    echo "Generating SSH key for GitHub..."
    ssh-keygen -t ed25519 -f "$SSH_KEY" -N "" -C "$(git config user.email || echo 'user@example.com')"
    echo "DONE: SSH key generated at $SSH_KEY"
fi

echo ""
echo "Add this public key to GitHub:"
echo "https://github.com/settings/ssh/new"
echo ""
cat "$SSH_KEY.pub"
echo ""

# GitHub CLI authentication
if gh auth status >/dev/null 2>&1; then
    echo "SKIP: GitHub CLI already authenticated"
else
    echo "GitHub CLI not authenticated"
    echo "Run: gh auth login"
fi

echo ""
echo "Configuration complete!"
