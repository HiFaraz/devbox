#!/bin/bash
# Run all smoke tests

set -e
cd "$(dirname "$0")/.."

for test in tests/smoke-*.sh; do
    # Run docker smoke test with docker group activated
    if [[ "$test" == *"smoke-docker.sh"* ]]; then
        sg docker "bash $test"
    else
        bash "$test"
    fi
done

echo ""
echo "=== All smoke tests passed ==="
