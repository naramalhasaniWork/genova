#!/usr/bin/env bash
# Genova Global — push this folder to your EXISTING GitHub repo "genova"
# Usage:  cd into this folder, then:  bash publish.sh
#         (optional)                  bash publish.sh https://github.com/<you>/genova.git
set -euo pipefail

REMOTE_URL="${1:-}"

echo "→ Cleaning any stale git state from the sandbox..."
rm -rf .git

echo "→ Initializing and committing..."
git init -b main
git add -A
git commit -m "Genova Global landing page — bilingual EN/AR, Ledger G identity, AIEO (JSON-LD, llms.txt, robots, sitemap), Railway deploy config"

if [ -z "$REMOTE_URL" ]; then
  if command -v gh >/dev/null 2>&1; then
    GH_USER="$(gh api user -q .login)"
    REMOTE_URL="https://github.com/${GH_USER}/genova.git"
    echo "→ Detected GitHub user '${GH_USER}' via gh CLI"
  else
    echo "gh CLI not found and no remote URL given."
    echo "Re-run with your repo URL:  bash publish.sh https://github.com/<you>/genova.git"
    exit 1
  fi
fi

echo "→ Pushing to existing repo: ${REMOTE_URL}"
git remote add origin "$REMOTE_URL"
# --force: this snapshot is the canonical content; it replaces any placeholder
# README/init commit already in the repo.
git push -u origin main --force

echo ""
echo "✓ Pushed. Next: railway.app → New Project → Deploy from GitHub repo → genova"
echo "  Then add genovaglobal.org under Settings → Networking → Custom Domain."
