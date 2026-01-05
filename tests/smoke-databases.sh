#!/bin/bash
set -e
# Smoke tests for databases role

echo "=== Databases Role Smoke Tests ==="

psql --version >/dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "FAIL: psql --version failed"
    exit 1
fi
echo "PASS: postgresql-client works"

mysql --version >/dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "FAIL: mysql --version failed"
    exit 1
fi
echo "PASS: mysql-client works"

redis-cli --version >/dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "FAIL: redis-cli --version failed"
    exit 1
fi
echo "PASS: redis-tools works"

sqlite3 --version >/dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "FAIL: sqlite3 --version failed"
    exit 1
fi
echo "PASS: sqlite3 works"
