#!/bin/bash
set -e
DRY_RUN=false
[ "$1" = "--dry-run" ] && DRY_RUN=true

# Preflight: check passwordless sudo
sudo -n true 2>/dev/null
if [ $? -ne 0 ]; then
    echo "FAIL: passwordless sudo not available"
    exit 1
fi
echo "PASS: passwordless sudo works"

echo "Architecture: $(uname -m)"

. /etc/os-release
echo "OS: $PRETTY_NAME"

case "$ID" in
    debian|ubuntu)
        CMD="sudo apt update && sudo apt install -y ansible"
        ;;
    *)
        CMD="pip3 install --user ansible"
        ;;
esac

if [ "$DRY_RUN" = true ]; then
    echo "Would run: $CMD"
else
    eval "$CMD"
fi
