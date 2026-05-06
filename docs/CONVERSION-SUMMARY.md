# Conversion Summary

This document records what changed when the repository was converted into Everything Codex Toolkit.

## Goal

Convert the original Everything Claude Code repository into a Codex-only toolkit while preserving useful content.

The conversion did not redesign the toolkit. It changed the active surfaces so Codex users can understand and apply the material.

## Changed

- Rewrote `README.md` for Codex-only usage.
- Rewrote root `AGENTS.md` as the main Codex instruction file.
- Rewrote `.codex/AGENTS.md` as a Codex-specific supplement.
- Simplified `.codex/config.toml` into a small reference config.
- Updated `.codex-plugin/` to identify as Everything Codex Toolkit.
- Replaced package metadata with Codex-only package metadata.
- Renamed `commands/` to `prompts/`.
- Added `scripts/install-codex.sh`.
- Added `scripts/check-codex-layout.sh`.
- Replaced old CI workflows with a small Codex layout check.
- Added plain-English docs:
  - `docs/USING-IN-PROJECTS.md`
  - `docs/MIGRATION-FROM-CLAUDE.md`
  - `docs/CODEX-LIMITATIONS.md`
  - `docs/CONVERSION-SUMMARY.md`

## Moved Out Of The Active Path

The following were preserved under `legacy/` instead of being deleted:

- `.claude/`
- `.claude-plugin/`
- `CLAUDE.md`
- old Claude install scripts
- Claude hook runtime
- old command shims
- old installer, release, session, hook, and harness scripts
- old tests tied to unsupported runtime surfaces
- old install manifests and schemas
- old ECC2 control-plane prototype
- other harness folders such as Cursor, Gemini, Kiro, OpenCode, Trae, and CodeBuddy
- original docs
- original examples

These files are source material only. They are not part of the Codex install path.

## Left Unchanged On Purpose

These remain mostly unchanged because they are the highest-value reusable content:

- `skills/`
- `agents/`
- `rules/`
- `contexts/`
- `mcp-configs/`

Some files inside these folders may still mention Claude in examples or historical wording. That was left in place where the useful workflow still applies and a full rewrite would change more substance than needed.

## Cannot Be Replicated Exactly In Codex

The following Claude behaviors do not have exact equivalents in this toolkit:

- Claude Code marketplace plugin install
- Claude slash-command auto-loading
- Claude hook lifecycle automation
- automatic loading from `~/.claude`
- Claude plugin cache behavior
- Claude-specific session and stop hooks

Closest Codex replacements:

- `AGENTS.md` for persistent instructions
- `.codex/config.toml` for project config
- `prompts/` for workflow prompt text
- `skills/` for reusable workflow guidance
- normal tests, lint, typecheck, build, git hooks, and CI for enforcement

## Result

The repository now presents itself as a Codex-only toolkit.

A Codex user can:

1. clone the repo,
2. read the README,
3. run global or project setup,
4. understand what files to copy,
5. use skills, prompts, agents, and rules in real projects,
6. see what is unsupported instead of relying on false parity.
