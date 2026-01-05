#!/bin/bash
# Smoke tests for pyenv role

echo "=== Pyenv Role Smoke Tests ==="

export HOME=/home/faraz
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

pyenv --version
if [ $? -ne 0 ]; then
    echo "FAIL: pyenv --version failed"
    exit 1
fi
echo "PASS: pyenv works"
