#!/bin/bash
set -euo pipefail

# Only run in Claude Code cloud sessions
if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  exit 0
fi

# Idempotent: skip if claude-mem is already installed
if [ -d "$HOME/.claude-mem" ] || [ -d "$HOME/.claude/plugins/marketplaces/thedotmack" ]; then
  echo "claude-mem already installed"
  exit 0
fi

# Non-interactive install (skip browser sign-in)
CLAUDE_MEM_ONLINE_OPTIN=false npx --yes claude-mem install < /dev/null
