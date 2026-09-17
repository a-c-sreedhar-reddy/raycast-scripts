#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Approve PR
# @raycast.mode silent

# Optional parameters:
# @raycast.icon ✅
# @raycast.packageName GitHub

# Documentation:
# @raycast.description Approve the GitHub PR whose link is on the clipboard.
# @raycast.author sreedhar

export PATH="/opt/homebrew/bin:/usr/local/bin:$PATH"

url="$(pbpaste)"
url="$(printf '%s' "$url" | grep -oE 'https://github\.com/[^/ ]+/[^/ ]+/pull/[0-9]+' | head -1)"

if [ -z "$url" ]; then
  echo "no PR link given or on clipboard"
  exit 1
fi

if out="$(gh pr review "$url" --approve --body "LGTM" 2>&1)"; then
  echo "approved ${url#https://github.com/}"
else
  echo "failed: $out"
  exit 1
fi
