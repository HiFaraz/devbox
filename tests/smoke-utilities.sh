#!/bin/bash
set -e
# Smoke tests for utilities role

echo "=== Utilities Role Smoke Tests ==="

htop --version >/dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "FAIL: htop --version failed"
    exit 1
fi
echo "PASS: htop works"

tmux -V >/dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "FAIL: tmux -V failed"
    exit 1
fi
echo "PASS: tmux works"

jq --version >/dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "FAIL: jq --version failed"
    exit 1
fi
echo "PASS: jq works"

tree --version >/dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "FAIL: tree --version failed"
    exit 1
fi
echo "PASS: tree works"

unzip -v >/dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "FAIL: unzip -v failed"
    exit 1
fi
echo "PASS: unzip works"

zip --version >/dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "FAIL: zip --version failed"
    exit 1
fi
echo "PASS: zip works"

rsync --version >/dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "FAIL: rsync --version failed"
    exit 1
fi
echo "PASS: rsync works"

lsof -v 2>&1 | grep -q revision
if [ $? -ne 0 ]; then
    echo "FAIL: lsof not found"
    exit 1
fi
echo "PASS: lsof works"

strace -V >/dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "FAIL: strace -V failed"
    exit 1
fi
echo "PASS: strace works"

zsh --version >/dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "FAIL: zsh --version failed"
    exit 1
fi
echo "PASS: zsh works"

dpkg -s fonts-powerline >/dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "FAIL: fonts-powerline not installed"
    exit 1
fi
echo "PASS: fonts-powerline installed"
