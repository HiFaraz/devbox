#!/bin/bash
set -e
# Tests for databases role

echo "=== Databases Role Tests ==="

if [ ! -f "roles/databases/tasks/main.yml" ]; then
    echo "FAIL: roles/databases/tasks/main.yml does not exist"
    exit 1
fi
echo "PASS: databases role exists"

for pkg in postgresql-client default-mysql-client redis-tools sqlite3; do
    if grep -q "$pkg" roles/databases/tasks/main.yml; then
        echo "PASS: databases role references $pkg"
    else
        echo "FAIL: databases role does not reference $pkg"
        exit 1
    fi
done
