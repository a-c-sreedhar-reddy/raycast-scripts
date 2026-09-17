# raycast-scripts

A small collection of [Raycast Script Commands](https://github.com/raycast/script-commands) I use day to day.

## Commands

### Set Browser Width

Resizes the front **Google Chrome** window to an exact pixel width — handy for quickly checking responsive breakpoints. Keeps the window's current position and height; only the width changes.

### Approve PR

Approves every GitHub PR link on the clipboard (Slack's `<url|text>` wrapping is fine). Runs `gh pr review --approve`, so `gh auth login` must be done once.

## Setup

1. Open **Raycast → Settings → Extensions**.
2. Click **+ → Add Script Directory** and select this folder.
3. The scripts now appear as Raycast commands (e.g. **Set Browser Width**).

## Usage

- Trigger **Set Browser Width**, type a number (e.g. `375`, `768`, `1024`), press Enter.
- Optional: assign an **alias** (e.g. `w`) or a **hotkey** on the command's row in Settings → Extensions for faster access. An alias works well here since the command takes a numeric argument anyway.

## Notes

- The width sets the OS **window frame** width; Chrome's content area is a hair narrower due to scrollbars/borders. For pixel-perfect viewport widths, use Chrome DevTools' device toolbar (`⌘⇧M`).
- To target a different browser, swap `"Google Chrome"` in the script for the app name (e.g. `"Arc"`, `"Safari"`).
