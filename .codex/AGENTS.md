# Codex Supplement

This file supplements the root `AGENTS.md` with Codex-specific guidance.

## Codex Entry Points

- Project instructions: `AGENTS.md`
- Project config example: `.codex/config.toml`
- Role examples: `.codex/agents/*.toml`
- Reusable skills: `skills/*/SKILL.md`
- Workflow prompts: `prompts/*.md`

## Recommended Defaults

Use the current Codex default model unless a project has a clear reason to pin one.

Use these runtime defaults for normal project work:

- approval policy: ask before risky actions
- sandbox: workspace write
- network: disabled or approval-gated unless the task needs current information
- verification: run the smallest relevant command first, then broader checks when needed

## MCP Guidance

MCP servers are optional. Enable only the servers a project actually needs.

Good default candidates:

- GitHub for issue and PR work
- Context7 or official docs lookup for current framework/API docs
- Playwright for browser and E2E workflows
- Exa or web search for source-attributed research
- Memory only when the user wants persistent cross-session notes

Do not assume credentials exist. If a server requires an API key or login, document the needed environment variable instead of embedding credentials.

## Multi-Agent Guidance

Codex can use role-based parallel work in supported clients. This repository provides examples only:

- `.codex/agents/explorer.toml`
- `.codex/agents/reviewer.toml`
- `.codex/agents/docs-researcher.toml`

Use parallel agents only when the subtasks are independent. Do not use multi-agent work as a substitute for reading the repo.

## Differences From Claude Code

| Original Claude surface | Codex replacement |
|---|---|
| `CLAUDE.md` | `AGENTS.md` |
| Claude plugin manifest | `.codex-plugin/plugin.json` preview manifest |
| Slash commands | `prompts/*.md` workflow prompts |
| Claude hooks | manual verification, git hooks, CI, and instructions |
| `~/.claude` install | `~/.codex` global files or project-local files |
| Claude subagent definitions | role prompt library plus `.codex/agents/*.toml` examples |

Do not claim exact parity where Codex has no equivalent feature.
