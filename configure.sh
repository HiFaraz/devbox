#!/bin/bash
set -e

echo "=== Configuration ==="

# Git user configuration
CURRENT_USER_NAME=$(git config --global user.name 2>/dev/null || echo "")
CURRENT_USER_EMAIL=$(git config --global user.email 2>/dev/null || echo "")

# Prompt for user.name
if [ -n "$CURRENT_USER_NAME" ]; then
    echo "Current git user.name: $CURRENT_USER_NAME"
    read -p "Keep this value? [Y/n]: " KEEP_NAME
    if [ "$KEEP_NAME" = "n" ] || [ "$KEEP_NAME" = "N" ]; then
        read -p "Enter new git user.name: " NEW_USER_NAME
        git config --global user.name "$NEW_USER_NAME"
        echo "Git user.name set to: $NEW_USER_NAME"
    else
        echo "Git user.name unchanged"
    fi
else
    read -p "Enter git user.name: " NEW_USER_NAME
    git config --global user.name "$NEW_USER_NAME"
    echo "Git user.name set to: $NEW_USER_NAME"
fi

# Prompt for user.email
if [ -n "$CURRENT_USER_EMAIL" ]; then
    echo "Current git user.email: $CURRENT_USER_EMAIL"
    read -p "Keep this value? [Y/n]: " KEEP_EMAIL
    if [ "$KEEP_EMAIL" = "n" ] || [ "$KEEP_EMAIL" = "N" ]; then
        read -p "Enter new git user.email: " NEW_USER_EMAIL
        git config --global user.email "$NEW_USER_EMAIL"
        echo "Git user.email set to: $NEW_USER_EMAIL"
    else
        echo "Git user.email unchanged"
    fi
else
    read -p "Enter git user.email: " NEW_USER_EMAIL
    git config --global user.email "$NEW_USER_EMAIL"
    echo "Git user.email set to: $NEW_USER_EMAIL"
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

# Configure zsh powerline theme
ZSHRC="$HOME/.zshrc"
if [ -f "$ZSHRC" ]; then
    if grep -q '^ZSH_THEME="agnoster"' "$ZSHRC"; then
        echo "SKIP: zsh theme already set to agnoster (powerline)"
    else
        sed -i 's/^ZSH_THEME=.*/ZSH_THEME="agnoster"/' "$ZSHRC"
        echo "DONE: zsh theme set to agnoster (powerline)"
    fi
else
    echo "SKIP: .zshrc not found (oh-my-zsh not installed)"
fi

# Set zsh as default shell
CURRENT_SHELL=$(getent passwd "$USER" | cut -d: -f7)
ZSH_PATH=$(which zsh)
if [ "$CURRENT_SHELL" = "$ZSH_PATH" ]; then
    echo "SKIP: default shell already set to zsh"
else
    echo "Setting default shell to zsh..."
    if chsh -s "$ZSH_PATH" 2>/dev/null; then
        echo "DONE: default shell set to zsh (logout required to take effect)"
    else
        echo "NOTE: Could not set default shell automatically (password may be required)"
        echo "To set zsh as your default shell manually, run:"
        echo "  chsh -s $ZSH_PATH"
        echo "Or add this to your ~/.bashrc:"
        echo "  [ -n \"\$BASH_VERSION\" ] && exec zsh"
    fi
fi

echo ""
echo "Configuration complete!"
