#!/bin/bash
set -e
# Tests for ansible.cfg

echo "=== Ansible Config Tests ==="

if [ ! -f "ansible.cfg" ]; then
    echo "FAIL: ansible.cfg does not exist"
    exit 1
fi
echo "PASS: ansible.cfg exists"

if grep -q "host_key_checking = False" ansible.cfg; then
    echo "PASS: ansible.cfg disables host key checking"
else
    echo "FAIL: ansible.cfg does not disable host key checking"
    exit 1
fi

if grep -q "retry_files_enabled = False" ansible.cfg; then
    echo "PASS: ansible.cfg disables retry files"
else
    echo "FAIL: ansible.cfg does not disable retry files"
    exit 1
fi

if grep -q "deprecation_warnings = False" ansible.cfg; then
    echo "PASS: ansible.cfg disables deprecation warnings"
else
    echo "FAIL: ansible.cfg does not disable deprecation warnings"
    exit 1
fi
