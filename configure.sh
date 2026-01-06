#!/bin/bash
set -e

echo "=== Configuration ==="

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
