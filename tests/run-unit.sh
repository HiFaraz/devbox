#!/bin/bash
# Run all unit tests

set -e
cd "$(dirname "$0")/.."

for test in tests/test-*.sh; do
    bash "$test"
done

echo ""
echo "=== All unit tests passed ==="
