#!/bin/bash
set -e
# Smoke tests for cloud role

echo "=== Cloud Role Smoke Tests ==="

kubectl version --client 2>/dev/null | head -1
if [ $? -ne 0 ]; then
    echo "FAIL: kubectl version failed"
    exit 1
fi
echo "PASS: kubectl works"

helm version --short
if [ $? -ne 0 ]; then
    echo "FAIL: helm version failed"
    exit 1
fi
echo "PASS: helm works"

terraform version | head -1
if [ $? -ne 0 ]; then
    echo "FAIL: terraform version failed"
    exit 1
fi
echo "PASS: terraform works"

aws --version
if [ $? -ne 0 ]; then
    echo "FAIL: aws --version failed"
    exit 1
fi
echo "PASS: aws-cli works"

gcloud --version | head -1
if [ $? -ne 0 ]; then
    echo "FAIL: gcloud --version failed"
    exit 1
fi
echo "PASS: gcloud-cli works"

gh --version | head -1
if [ $? -ne 0 ]; then
    echo "FAIL: gh --version failed"
    exit 1
fi
echo "PASS: gh works"
