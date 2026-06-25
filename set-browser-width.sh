#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Set Browser Width
# @raycast.mode silent

# Optional parameters:
# @raycast.icon ↔️
# @raycast.packageName Window
# @raycast.argument1 { "type": "text", "placeholder": "width px" }

# Documentation:
# @raycast.description Resize the front Chrome window to an exact pixel width (keeps position & height).
# @raycast.author sreedhar

width="$1"

osascript -e "
tell application \"Google Chrome\"
  set b to bounds of front window
  set {l, t, r, btm} to b
  set bounds of front window to {l, t, l + $width, btm}
end tell
"
