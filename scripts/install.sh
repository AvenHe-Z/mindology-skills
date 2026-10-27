#!/usr/bin/env bash
# Install the mindology skill pack into an AI agent's skills directory.
#
# Usage:
#   bash scripts/install.sh <target-skills-dir>
#
# Examples:
#   bash scripts/install.sh ~/.agents/skills      # Codex CLI
#   bash scripts/install.sh ~/.claude/skills      # Claude Code
#   bash scripts/install.sh ~/.workbuddy/skills   # WorkBuddy
#
# The script "flattens" the pack: the router becomes <target>/mindology/ and
# each of the 28 member skills becomes a direct child <target>/<slug>/ so that
# clients which only scan one level can still discover every skill.

set -euo pipefail

TARGET="${1:-${INSTALL_TARGET:-}}"
if [ -z "$TARGET" ]; then
  echo "Usage: bash scripts/install.sh <target-skills-dir>"
  echo "Example:"
  echo "  bash scripts/install.sh ~/.agents/skills      # Codex CLI"
  echo "  bash scripts/install.sh ~/.claude/skills      # Claude Code"
  echo "  bash scripts/install.sh ~/.workbuddy/skills   # WorkBuddy"
  exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
SRC="$REPO_ROOT/mindology"

if [ ! -f "$SRC/SKILL.md" ]; then
  echo "ERROR: cannot find $SRC/SKILL.md"
  echo "Please run this script from the cloned repository:"
  echo "  git clone https://github.com/AvenHe-Z/mindology-skills.git"
  echo "  bash mindology-skills/scripts/install.sh <target-skills-dir>"
  exit 1
fi

mkdir -p "$TARGET"

# 1) router skill
mkdir -p "$TARGET/mindology"
cp "$SRC/SKILL.md" "$TARGET/mindology/SKILL.md"
if [ -f "$SRC/_meta.json" ]; then
  cp "$SRC/_meta.json" "$TARGET/mindology/_meta.json"
fi

# 2) 28 member skills, each as a top-level directory
count=0
for d in "$SRC"/*/; do
  [ -d "$d" ] || continue
  name="$(basename "$d")"
  rm -rf "$TARGET/$name"
  cp -r "$d" "$TARGET/$name"
  count=$((count + 1))
done

echo "Done: installed 1 router + $count member skills -> $TARGET"
echo "Next: restart/reload your AI agent, then ask: 测一下我的心智水平"
