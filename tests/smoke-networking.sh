#!/bin/bash
set -e
# Smoke tests for networking role

echo "=== Networking Role Smoke Tests ==="

ssh -V 2>&1
if [ $? -ne 0 ]; then
    echo "FAIL: ssh -V failed"
    exit 1
fi
echo "PASS: ssh works"

curl --version >/dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "FAIL: curl --version failed"
    exit 1
fi
echo "PASS: curl works"

wget --version >/dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "FAIL: wget --version failed"
    exit 1
fi
echo "PASS: wget works"

gpg --version >/dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "FAIL: gpg --version failed"
    exit 1
fi
echo "PASS: gpg works"

sudo ufw --version >/dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "FAIL: ufw --version failed"
    exit 1
fi
echo "PASS: ufw works"

netstat --version >/dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "FAIL: netstat --version failed"
    exit 1
fi
echo "PASS: net-tools works"

dig -v 2>&1 | grep -q DiG
if [ $? -ne 0 ]; then
    echo "FAIL: dig not found"
    exit 1
fi
echo "PASS: dnsutils works"

ping -V >/dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "FAIL: ping -V failed"
    exit 1
fi
echo "PASS: iputils-ping works"

traceroute --version >/dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "FAIL: traceroute --version failed"
    exit 1
fi
echo "PASS: traceroute works"
