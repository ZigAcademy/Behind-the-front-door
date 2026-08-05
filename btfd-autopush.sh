#!/bin/bash
# Auto-commit + push voor Behind-the-front-door.
# Draait via launchd zodra index.html in de lokale clone verandert.
set -e
REPO_DIR="$HOME/Downloads/Behind-the-front-door"
cd "$REPO_DIR"

if [[ -n "$(git status --porcelain)" ]]; then
  git add -A
  git commit -m "Auto-update via Claude ($(date '+%Y-%m-%d %H:%M'))"
  git push origin main
  echo "$(date '+%Y-%m-%d %H:%M:%S') Gepusht." >> /tmp/btfd-autopush.log
else
  echo "$(date '+%Y-%m-%d %H:%M:%S') Geen wijzigingen." >> /tmp/btfd-autopush.log
fi
