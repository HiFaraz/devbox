#!/bin/bash
# Test: Script exists
if [ ! -f "./install-ansible.sh" ]; then
    echo "FAIL: Script does not exist"
    exit 1
fi
echo "PASS: Script exists"

# Test: Script is executable
if [ ! -x "./install-ansible.sh" ]; then
    echo "FAIL: Script is not executable"
    exit 1
fi
echo "PASS: Script is executable"

# Test: Script detects architecture
OUTPUT=$(./install-ansible.sh --dry-run 2>&1)
if echo "$OUTPUT" | grep -q "Architecture:"; then
    echo "PASS: Script detects architecture"
else
    echo "FAIL: Script does not output architecture"
    exit 1
fi

# Test: Script detects OS
if echo "$OUTPUT" | grep -q "OS:"; then
    echo "PASS: Script detects OS"
else
    echo "FAIL: Script does not output OS"
    exit 1
fi

# Test: Script shows install command for ansible
if echo "$OUTPUT" | grep -q "ansible"; then
    echo "PASS: Script references ansible installation"
else
    echo "FAIL: Script does not reference ansible"
    exit 1
fi
