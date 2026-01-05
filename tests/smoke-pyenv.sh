#!/bin/bash
# Smoke tests for pyenv role
set -e

echo "=== Pyenv Role Smoke Tests ==="

export PYENV_ROOT="${HOME}/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

pyenv --version
if [ $? -ne 0 ]; then
    echo "FAIL: pyenv --version failed"
    exit 1
fi
echo "PASS: pyenv works"
