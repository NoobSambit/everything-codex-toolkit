#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

failures=0

require_path() {
  local path="$1"
  if [[ ! -e "$path" ]]; then
    echo "Missing required path: $path" >&2
    failures=$((failures + 1))
  fi
}

forbidden_active_path() {
  local path="$1"
  if [[ -e "$path" ]]; then
    echo "Forbidden active path still exists: $path" >&2
    failures=$((failures + 1))
  fi
}

require_path "AGENTS.md"
require_path "README.md"
require_path ".codex/config.toml"
require_path ".codex/AGENTS.md"
require_path ".codex/agents"
require_path ".codex-plugin/plugin.json"
require_path "skills"
require_path "agents"
require_path "prompts"
require_path "rules"
require_path "docs/USING-IN-PROJECTS.md"
require_path "docs/MIGRATION-FROM-CLAUDE.md"
require_path "docs/CODEX-LIMITATIONS.md"
require_path "docs/CONVERSION-SUMMARY.md"
require_path "legacy/unsupported-claude"
require_path "legacy/unsupported-hooks"

forbidden_active_path ".claude"
forbidden_active_path ".claude-plugin"
forbidden_active_path "CLAUDE.md"
forbidden_active_path "commands"
forbidden_active_path "hooks"

if [[ "$failures" -gt 0 ]]; then
  echo "Layout check failed with $failures issue(s)." >&2
  exit 1
fi

echo "Codex layout check passed."
