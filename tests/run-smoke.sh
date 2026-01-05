#!/bin/bash
# Run all smoke tests

set -e
cd "$(dirname "$0")/.."

for test in tests/smoke-*.sh; do
    bash "$test"
done

echo ""
echo "=== All smoke tests passed ==="
