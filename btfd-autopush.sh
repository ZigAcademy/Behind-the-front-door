#!/bin/bash
# Auto-commit + push voor Behind-the-front-door.
# Draait via launchd zodra index.html in de lokale clone verandert.
REPO_DIR="$HOME/Downloads/Behind-the-front-door"
cd "$REPO_DIR"

if [[ -n "$(git status --porcelain)" ]]; then
  git add -A
  git commit -m "Auto-update via Claude ($(date '+%Y-%m-%d %H:%M'))"
fi

# Altijd proberen te pushen - ook als er nu niets nieuws te committen viel,
# kan er nog een eerdere lokale commit klaarstaan die nog niet gepusht is.
if git push origin main; then
  echo "$(date '+%Y-%m-%d %H:%M:%S') Gepusht." >> /tmp/btfd-autopush.log
else
  echo "$(date '+%Y-%m-%d %H:%M:%S') Push mislukt (zie /tmp/btfd-autopush.err)." >> /tmp/btfd-autopush.err
fi
