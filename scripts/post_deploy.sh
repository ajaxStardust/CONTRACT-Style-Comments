#!/usr/bin/env bash
# ─────────────────────────────────────────────────────────────
# post_deploy.sh — CSC Post-Deploy Verification (Template)
#
# CSC Annotation: post_deploy_boundary
# Chains restart + smoke test into a single verification command.
# Adapt the restart command to your project's stack.
#
# Usage: ./scripts/post_deploy.sh [--live]
# Exit 0 = all pass, 1 = failures.
# ─────────────────────────────────────────────────────────────
set -euo pipefail

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$PROJECT_DIR"

echo "=================================================="
echo "  POST-DEPLOY: Restart + Smoke Test"
echo "=================================================="

# Step 1: Restart your application
# TODO: Replace with your project's restart command
# Examples:
#   Flask/Gunicorn:  bash restart-gunicorn.sh
#   Django:          sudo systemctl restart gunicorn
#   Node.js:         pm2 restart app
#   Docker:          docker compose restart
echo ""
echo "-- Step 1: Restart --"
echo "TODO: Add your restart command here"
# bash restart-gunicorn.sh

# Step 2: Wait for boot
echo ""
echo "-- Step 2: Waiting for boot --"
sleep 3

# Step 3: Run smoke tests
echo ""
echo "-- Step 3: Smoke Tests --"
./env/bin/python scripts/smoke_test.py "$@"
EXIT_CODE=$?

echo ""
if [ $EXIT_CODE -eq 0 ]; then
    echo "=================================================="
    echo "  DEPLOY VERIFIED - all checks passed"
    echo "=================================================="
else
    echo "=================================================="
    echo "  DEPLOY FAILED - smoke test failures detected"
    echo "  Review output above and fix before shipping."
    echo "=================================================="
fi

exit $EXIT_CODE
