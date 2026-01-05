#!/bin/bash
# Test: Makefile exists
if [ ! -f "Makefile" ]; then
    echo "FAIL: Makefile does not exist"
    exit 1
fi
echo "PASS: Makefile exists"

# Test: make runs install-ansible.sh
OUTPUT=$(make --dry-run 2>&1)
if echo "$OUTPUT" | grep -q "install-ansible"; then
    echo "PASS: make runs install-ansible.sh"
else
    echo "FAIL: make does not run install-ansible.sh"
    exit 1
fi

# Test: make test runs test scripts
OUTPUT=$(make test --dry-run 2>&1)
if echo "$OUTPUT" | grep -q "test-"; then
    echo "PASS: make test runs test scripts"
else
    echo "FAIL: make test does not run test scripts"
    exit 1
fi
