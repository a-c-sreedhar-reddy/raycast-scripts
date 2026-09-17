#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Approve PR
# @raycast.mode silent

# Optional parameters:
# @raycast.icon ✅
# @raycast.packageName GitHub

# Documentation:
# @raycast.description Approve every GitHub PR link on the clipboard.
# @raycast.author sreedhar

export PATH="/opt/homebrew/bin:/usr/local/bin:$PATH"

urls="$(pbpaste | grep -oE 'https://github\.com/[^/ >|]+/[^/ >|]+/pull/[0-9]+' | sort -u)"

if [ -z "$urls" ]; then
  echo "no PR link on clipboard"
  exit 1
fi

ok=0
failed=()
while IFS= read -r url; do
  if gh pr review "$url" --approve --body "LGTM" >/dev/null 2>&1; then
    ok=$((ok + 1))
  else
    failed+=("${url#https://github.com/}")
  fi
done <<< "$urls"

if [ ${#failed[@]} -eq 0 ]; then
  echo "approved $ok PR(s)"
else
  echo "approved $ok, failed: ${failed[*]}"
  exit 1
fi
