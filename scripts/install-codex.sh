#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'EOF'
Usage:
  bash scripts/install-codex.sh --global [--dry-run]
  bash scripts/install-codex.sh --project /path/to/project [--dry-run]

Options:
  --global        Install shared toolkit files under ~/.codex/everything-codex
  --project PATH  Copy a small Codex starter set into one project
  --dry-run       Print actions without writing files
  --help          Show this help
EOF
}

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
CODEX_HOME="${CODEX_HOME:-$HOME/.codex}"
MODE=""
PROJECT_PATH=""
DRY_RUN=0

while [[ $# -gt 0 ]]; do
  case "$1" in
    --global)
      MODE="global"
      shift
      ;;
    --project)
      MODE="project"
      PROJECT_PATH="${2:-}"
      if [[ -z "$PROJECT_PATH" ]]; then
        echo "Missing path after --project" >&2
        exit 1
      fi
      shift 2
      ;;
    --dry-run)
      DRY_RUN=1
      shift
      ;;
    --help|-h)
      usage
      exit 0
      ;;
    *)
      echo "Unknown argument: $1" >&2
      usage
      exit 1
      ;;
  esac
done

if [[ -z "$MODE" ]]; then
  usage
  exit 1
fi

log() {
  printf '[everything-codex] %s\n' "$*"
}

run() {
  if [[ "$DRY_RUN" -eq 1 ]]; then
    printf '[dry-run]'
    printf ' %q' "$@"
    printf '\n'
  else
    "$@"
  fi
}

copy_dir() {
  local src="$1"
  local dest="$2"
  if [[ ! -d "$src" ]]; then
    log "Skipping missing directory: $src"
    return
  fi
  run mkdir -p "$dest"
  run cp -R "$src/." "$dest/"
}

copy_file() {
  local src="$1"
  local dest="$2"
  if [[ ! -f "$src" ]]; then
    log "Skipping missing file: $src"
    return
  fi
  run mkdir -p "$(dirname "$dest")"
  run cp "$src" "$dest"
}

merge_marked_block() {
  local file="$1"
  local block_file="$2"
  local begin="<!-- BEGIN EVERYTHING CODEX TOOLKIT -->"
  local end="<!-- END EVERYTHING CODEX TOOLKIT -->"

  run mkdir -p "$(dirname "$file")"

  if [[ "$DRY_RUN" -eq 1 ]]; then
    log "Would merge marked instruction block into $file"
    return
  fi

  local tmp
  tmp="$(mktemp)"

  {
    printf '%s\n' "$begin"
    cat "$block_file"
    printf '\n%s\n' "$end"
  } > "$tmp.block"

  if [[ ! -f "$file" ]]; then
    cp "$tmp.block" "$file"
    rm -f "$tmp" "$tmp.block"
    return
  fi

  if grep -Fq "$begin" "$file" && grep -Fq "$end" "$file"; then
    awk -v begin="$begin" -v end="$end" -v block="$tmp.block" '
      $0 == begin {
        while ((getline line < block) > 0) print line
        close(block)
        skip = 1
        next
      }
      $0 == end {
        skip = 0
        next
      }
      !skip { print }
    ' "$file" > "$tmp"
    cp "$tmp" "$file"
  else
    {
      cat "$file"
      printf '\n\n'
      cat "$tmp.block"
    } > "$tmp"
    cp "$tmp" "$file"
  fi

  rm -f "$tmp" "$tmp.block"
}

create_global_block() {
  local out="$1"
  {
    printf '# Everything Codex Toolkit\n\n'
    printf 'Use the shared toolkit installed at `%s/everything-codex`.\n\n' "$CODEX_HOME"
    printf 'Prefer project `AGENTS.md` first. Use toolkit skills, prompts, and rules when they fit the task.\n\n'
    printf 'Useful shared paths:\n\n'
    printf '- `%s/everything-codex/skills/`\n' "$CODEX_HOME"
    printf '- `%s/everything-codex/agents/`\n' "$CODEX_HOME"
    printf '- `%s/everything-codex/prompts/`\n' "$CODEX_HOME"
    printf '- `%s/everything-codex/rules/`\n' "$CODEX_HOME"
  } > "$out"
}

create_project_block() {
  local out="$1"
  cat > "$out" <<'EOF'
# Everything Codex Toolkit Project Rules

Use this project's own instructions first.

Toolkit material copied into this project:

- `.codex/agents/` for role examples
- `.codex/rules/everything-codex/` for common rules
- `.codex/prompts/everything-codex/` for workflow prompts
- `.codex/skills/everything-codex/` for core skills

Use the TDD skill for feature work and bug fixes.
Use the code review and security review guidance before shipping risky changes.
Run the smallest relevant verification command before broader checks.
EOF
}

install_global() {
  local dest="$CODEX_HOME/everything-codex"
  local block
  block="$(mktemp)"

  log "Installing shared toolkit to $dest"
  run mkdir -p "$CODEX_HOME"
  copy_dir "$REPO_ROOT/skills" "$dest/skills"
  copy_dir "$REPO_ROOT/agents" "$dest/agents"
  copy_dir "$REPO_ROOT/prompts" "$dest/prompts"
  copy_dir "$REPO_ROOT/rules" "$dest/rules"
  copy_dir "$REPO_ROOT/contexts" "$dest/contexts"
  copy_dir "$REPO_ROOT/mcp-configs" "$dest/mcp-configs"
  copy_dir "$REPO_ROOT/.codex/agents" "$dest/.codex/agents"
  copy_file "$REPO_ROOT/.codex/config.toml" "$CODEX_HOME/config.everything-codex.example.toml"

  if [[ "$DRY_RUN" -eq 1 ]]; then
    log "Would create temporary global instruction block"
  else
    create_global_block "$block"
  fi
  merge_marked_block "$CODEX_HOME/AGENTS.md" "$block"
  rm -f "$block"

  log "Global install complete"
  log "Review $CODEX_HOME/AGENTS.md and $CODEX_HOME/config.everything-codex.example.toml"
}

install_project() {
  local project
  project="$(cd "$PROJECT_PATH" 2>/dev/null && pwd || true)"
  if [[ -z "$project" ]]; then
    echo "Project path does not exist: $PROJECT_PATH" >&2
    exit 1
  fi

  local block
  block="$(mktemp)"

  log "Installing project starter files into $project"
  run mkdir -p "$project/.codex"

  if [[ -f "$project/.codex/config.toml" ]]; then
    copy_file "$REPO_ROOT/.codex/config.toml" "$project/.codex/config.everything-codex.example.toml"
    log "Existing .codex/config.toml found; wrote example config instead of overwriting"
  else
    copy_file "$REPO_ROOT/.codex/config.toml" "$project/.codex/config.toml"
  fi

  copy_dir "$REPO_ROOT/.codex/agents" "$project/.codex/agents"
  copy_dir "$REPO_ROOT/rules/common" "$project/.codex/rules/everything-codex/common"
  copy_dir "$REPO_ROOT/prompts" "$project/.codex/prompts/everything-codex"

  run mkdir -p "$project/.codex/skills/everything-codex"
  for skill in tdd-workflow security-review verification-loop coding-standards documentation-lookup codebase-onboarding; do
    copy_dir "$REPO_ROOT/skills/$skill" "$project/.codex/skills/everything-codex/$skill"
  done

  if [[ "$DRY_RUN" -eq 1 ]]; then
    log "Would create temporary project instruction block"
  else
    create_project_block "$block"
  fi
  merge_marked_block "$project/AGENTS.md" "$block"
  rm -f "$block"

  log "Project install complete"
  log "Review changes with: cd $project && git diff"
}

case "$MODE" in
  global)
    install_global
    ;;
  project)
    install_project
    ;;
esac
