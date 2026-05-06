---
name: everything-codex-toolkit
description: Development conventions and migration rules for this Codex-only toolkit.
---

# Everything Codex Toolkit Conventions

Use this skill when changing this repository.

## Purpose

This repo is a Codex-only adaptation of the useful content from the original Everything Claude Code project.

Keep the conversion focused:

- preserve useful skills, agents, prompts, workflows, rules, and docs
- keep active setup paths Codex-only
- move unsupported runtime surfaces into `legacy/`
- document limitations instead of claiming exact parity

## Active Paths

- `AGENTS.md`
- `.codex/`
- `.codex-plugin/`
- `.agents/skills/`
- `skills/`
- `agents/`
- `prompts/`
- `rules/`
- `contexts/`
- `mcp-configs/`
- `docs/`
- `scripts/install-codex.sh`

## Legacy Paths

Do not use these as active Codex install paths:

- `legacy/unsupported-claude/`
- `legacy/unsupported-hooks/`
- `legacy/unsupported-other-harnesses/`
- `legacy/original-docs/`
- `legacy/original-examples/`

## Commit Style

Use Conventional Commits:

```text
docs: clarify project setup guide
fix: correct Codex install script path
chore: move unsupported hook runtime to legacy
```

## Editing Rules

- Do not add new Claude installation instructions to active docs.
- Do not recreate slash-command loading for Codex.
- Do not advertise hooks as active Codex behavior.
- Do not delete useful source material if it can be preserved under `legacy/`.
- Prefer small, explicit docs over hidden automation.
