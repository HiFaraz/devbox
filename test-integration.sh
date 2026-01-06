#!/bin/bash
set -e

# Preflight: check passwordless sudo
sudo -n true 2>/dev/null
if [ $? -ne 0 ]; then
    echo "FAIL: passwordless sudo not available"
    exit 1
fi
echo "PASS: passwordless sudo works"

# Run the playbook
ansible-playbook playbook.yml
if [ $? -ne 0 ]; then
    echo "FAIL: Playbook failed to run"
    exit 1
fi
echo "PASS: Playbook ran successfully"

# Smoke test: git --version works
git --version
if [ $? -ne 0 ]; then
    echo "FAIL: git --version failed"
    exit 1
fi
echo "PASS: git --version works"

# Smoke test: nvm --version works
export NVM_DIR="${HOME}/.config/nvm"
. "$NVM_DIR/nvm.sh"
nvm --version
if [ $? -ne 0 ]; then
    echo "FAIL: nvm --version failed"
    exit 1
fi
echo "PASS: nvm --version works"

# Smoke test: docker --version works
docker --version
if [ $? -ne 0 ]; then
    echo "FAIL: docker --version failed"
    exit 1
fi
echo "PASS: docker --version works"

# Smoke test: gcc --version works
gcc --version
if [ $? -ne 0 ]; then
    echo "FAIL: gcc --version failed"
    exit 1
fi
echo "PASS: gcc --version works"

# Smoke test: cmake --version works
cmake --version
if [ $? -ne 0 ]; then
    echo "FAIL: cmake --version failed"
    exit 1
fi
echo "PASS: cmake --version works"

# Smoke test: pkg-config --version works
pkg-config --version
if [ $? -ne 0 ]; then
    echo "FAIL: pkg-config --version failed"
    exit 1
fi
echo "PASS: pkg-config --version works"

# Smoke test: autoconf --version works
autoconf --version
if [ $? -ne 0 ]; then
    echo "FAIL: autoconf --version failed"
    exit 1
fi
echo "PASS: autoconf --version works"

# Smoke test: libssl-dev installed
dpkg -s libssl-dev >/dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "FAIL: libssl-dev not installed"
    exit 1
fi
echo "PASS: libssl-dev installed"

# Smoke test: libffi-dev installed
dpkg -s libffi-dev >/dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "FAIL: libffi-dev not installed"
    exit 1
fi
echo "PASS: libffi-dev installed"

# Smoke test: zlib1g-dev installed
dpkg -s zlib1g-dev >/dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "FAIL: zlib1g-dev not installed"
    exit 1
fi
echo "PASS: zlib1g-dev installed"

# Smoke test: libreadline-dev installed
dpkg -s libreadline-dev >/dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "FAIL: libreadline-dev not installed"
    exit 1
fi
echo "PASS: libreadline-dev installed"

# Smoke test: libbz2-dev installed
dpkg -s libbz2-dev >/dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "FAIL: libbz2-dev not installed"
    exit 1
fi
echo "PASS: libbz2-dev installed"

# Smoke test: libsqlite3-dev installed
dpkg -s libsqlite3-dev >/dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "FAIL: libsqlite3-dev not installed"
    exit 1
fi
echo "PASS: libsqlite3-dev installed"

# Smoke test: libncurses-dev installed
dpkg -s libncurses-dev >/dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "FAIL: libncurses-dev not installed"
    exit 1
fi
echo "PASS: libncurses-dev installed"

# Smoke test: libxml2-dev installed
dpkg -s libxml2-dev >/dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "FAIL: libxml2-dev not installed"
    exit 1
fi
echo "PASS: libxml2-dev installed"

# Smoke test: libxslt1-dev installed
dpkg -s libxslt1-dev >/dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "FAIL: libxslt1-dev not installed"
    exit 1
fi
echo "PASS: libxslt1-dev installed"

# Smoke test: libyaml-dev installed
dpkg -s libyaml-dev >/dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "FAIL: libyaml-dev not installed"
    exit 1
fi
echo "PASS: libyaml-dev installed"

# Smoke test: ssh -V works
ssh -V 2>&1
if [ $? -ne 0 ]; then
    echo "FAIL: ssh -V failed"
    exit 1
fi
echo "PASS: ssh -V works"

# Smoke test: oh-my-zsh installed
if [ ! -f "$HOME/.oh-my-zsh/oh-my-zsh.sh" ]; then
    echo "FAIL: oh-my-zsh not installed"
    exit 1
fi
echo "PASS: oh-my-zsh installed"

# Smoke test: fonts-powerline installed
dpkg -s fonts-powerline >/dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "FAIL: fonts-powerline not installed"
    exit 1
fi
echo "PASS: fonts-powerline installed"
