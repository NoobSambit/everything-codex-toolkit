# Everything Codex Toolkit Instructions

This repository is a Codex-only toolkit. Use it to provide reusable instructions, skills, role prompts, rules, and workflow prompts for OpenAI Codex.

Do not optimize this repo for Claude, Cursor, Gemini, OpenCode, Kiro, Trae, or multi-tool support. Unsupported source material may remain under `legacy/`, but the active path is Codex only.

## Core Principles

1. Preserve useful content unless Codex compatibility requires a change.
2. Prefer skills and instructions over runtime magic.
3. Keep project instructions explicit and short enough for Codex to apply.
4. Use tests and verification before claiming work is complete.
5. Document limitations honestly instead of pretending Codex has Claude-only features.

## Active Surfaces

Use these folders as the active toolkit:

| Path | Purpose |
|---|---|
| `.codex/` | Codex config and role examples |
| `.codex-plugin/` | Preview Codex plugin manifest |
| `.agents/skills/` | Curated skill set for agent-style clients |
| `skills/` | Main reusable skill catalog |
| `agents/` | Specialist role prompt library |
| `prompts/` | Workflow prompts adapted from old slash commands |
| `rules/` | Common and language-specific project rules |
| `contexts/` | Context presets for development, review, and research |
| `mcp-configs/` | MCP server examples |
| `docs/` | Codex usage and migration documentation |

Do not add new active Claude plugin, hook, slash-command, or `~/.claude` assumptions.

## Legacy Surfaces

`legacy/` preserves original source material that is not active in Codex:

- `legacy/unsupported-claude/`
- `legacy/unsupported-hooks/`
- `legacy/unsupported-other-harnesses/`
- `legacy/original-docs/`
- `legacy/original-examples/`

You may read these files for migration context. Do not tell users to install from them for Codex.

## How Agents Work Here

The `agents/` directory contains role prompts from the original toolkit. Treat them as reusable role text, not as automatically registered Codex subagents.

Codex role examples live in `.codex/agents/` and are referenced by `.codex/config.toml`.

Use agent roles pragmatically:

- `planner` for feature plans and risky refactors
- `code-reviewer` for correctness, security, regressions, and missing tests
- `security-reviewer` for auth, secrets, user input, payments, and sensitive data
- language reviewers for stack-specific review
- build resolvers when build, typecheck, or test commands fail
- `docs-lookup` or docs researcher behavior when current API behavior matters

## How Skills Work Here

Skills are reusable workflow documents. They are not magic. Codex uses them when the user or project instructions point to them.

Prefer these skills for common work:

- `skills/tdd-workflow/SKILL.md`
- `skills/security-review/SKILL.md`
- `skills/verification-loop/SKILL.md`
- `skills/coding-standards/SKILL.md`
- `skills/codebase-onboarding/SKILL.md`
- `skills/documentation-lookup/SKILL.md`
- `skills/frontend-patterns/SKILL.md`
- `skills/backend-patterns/SKILL.md`

When applying a skill, follow the substance of the file. Do not rewrite the skill unless it contains an active Claude-only instruction that would mislead Codex.

## Development Workflow

For feature work:

1. Inspect the repo before proposing changes.
2. Build a short plan for complex work.
3. Use TDD when practical.
4. Make focused edits.
5. Run the relevant verification commands.
6. Review the final diff before reporting completion.

For reviews:

1. Findings come first.
2. Sort by severity.
3. Cite files and line numbers.
4. Focus on bugs, security, behavior changes, and missing tests.
5. Avoid style-only comments unless they hide a real risk.

For docs:

1. Use simple English.
2. Explain what to copy where.
3. Separate global setup from project setup.
4. Call out Codex limitations clearly.

## Security Baseline

- Never hardcode secrets.
- Validate all external input at system boundaries.
- Use parameterized database queries.
- Avoid leaking sensitive data in logs or error messages.
- Review auth and authorization paths carefully.
- Run dependency and test checks when relevant.

Codex does not use the original Claude hook runtime. Treat security enforcement as instructions plus normal repository verification.

## Editing Policy

- Keep changes scoped to Codex compatibility unless the user asks otherwise.
- Preserve skill, agent, rule, and prompt meaning wherever possible.
- If a Claude-only behavior cannot be translated cleanly, move it to `legacy/` or document it as unsupported.
- Do not create a multi-harness abstraction layer.
