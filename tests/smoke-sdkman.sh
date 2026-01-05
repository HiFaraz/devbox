#!/bin/bash
# Smoke tests for sdkman role

echo "=== SDKMAN Role Smoke Tests ==="

export HOME=/home/faraz
export SDKMAN_DIR="$HOME/.sdkman"

if [ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]; then
    echo "PASS: sdkman installed"
else
    echo "FAIL: sdkman not installed"
    exit 1
fi

source "$SDKMAN_DIR/bin/sdkman-init.sh"
sdk version
if [ $? -ne 0 ]; then
    echo "FAIL: sdk version failed"
    exit 1
fi
echo "PASS: sdkman works"
