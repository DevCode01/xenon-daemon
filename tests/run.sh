#!/usr/bin/env bash
# Auto-generated test harness — run after cloning to verify the build.
set -uo pipefail
FAIL=0

echo "-- syntax/build check --"
if bash -n xenon-daemon.sh; then echo "  ok"; else echo "  FAIL"; FAIL=1; fi

echo "-- functional check --"
OUT="$(mkdir -p /tmp/backup-test-xenon-daemon && bash xenon-daemon.sh /tmp/backup-test-xenon-daemon 2>&1)"
if echo "$OUT" | grep -qF -- 'Backup created:'; then
  echo "  ok   - contains: Backup created:"
else
  echo "  FAIL - expected to contain: Backup created:"
  echo "  got: $OUT"
  FAIL=1
fi

if [ "$FAIL" = "1" ]; then echo; echo "FAILED"; exit 1; fi
echo; echo "All tests passed."
