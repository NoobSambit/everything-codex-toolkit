# Codex Limitations And Differences

This repo is Codex-only, but it comes from a Claude Code toolkit. Some original behavior cannot be copied exactly.

This guide explains the differences plainly.

## Codex Does Not Use `CLAUDE.md`

Codex project instructions live in `AGENTS.md`.

Use:

```text
AGENTS.md
```

Do not use this for Codex:

```text
CLAUDE.md
```

The original `CLAUDE.md` file was moved to `legacy/unsupported-claude/`.

## Codex Does Not Auto-Load Claude Slash Commands

The old `commands/` folder was renamed to `prompts/`.

That means this is no longer an active command:

```text
/plan
```

Use the prompt file directly:

```text
Use prompts/plan.md to plan this work.
```

## Codex Does Not Run Claude Hooks

The original hook runtime depended on Claude Code lifecycle events.

Codex does not use those event files from this toolkit.

Use normal verification instead:

- run tests
- run typecheck
- run lint
- run build
- use pre-commit hooks if your repo needs hard local enforcement
- use CI for merge gates

The old hook files are preserved in:

```text
legacy/unsupported-hooks/
```

## Codex Plugin Support May Differ By Client

This repo includes:

```text
.codex-plugin/plugin.json
```

Treat it as a preview manifest. The reliable path is still:

```bash
bash scripts/install-codex.sh --global
bash scripts/install-codex.sh --project /path/to/project
```

If your Codex client supports local plugin installation, you can experiment with the manifest. If it does not, use the manual setup.

## Skills Are Markdown Workflows

Skills in this repo are plain files.

Codex will not magically know every skill in a large catalog unless the client supports that loading behavior or your instructions point to the skill.

Be explicit:

```text
Use skills/tdd-workflow/SKILL.md for this change.
```

or after project setup:

```text
Use .codex/skills/everything-codex/tdd-workflow/SKILL.md.
```

## Agents Are Role Prompts Unless Your Client Supports Role Config

The `agents/` folder is a library of specialist role prompts.

The `.codex/agents/` folder has Codex role config examples.

Do not assume every Codex client will auto-register every file in `agents/`.

Practical usage:

```text
Use the reviewer behavior from agents/code-reviewer.md.
Review my git diff and report findings first.
```

## MCP Servers Need Manual Credentials

MCP examples are included, but credentials are not.

If you enable MCP servers, you may need:

- GitHub login or token
- Exa API key
- browser dependencies for Playwright
- other provider-specific environment variables

Never commit credentials into `.codex/config.toml`.

## Some Skills Still Mention Claude

Some preserved skills mention Claude, Anthropic, or old hook behavior inside examples.

Interpret those references carefully:

- If the skill describes a general workflow, the workflow can still be useful.
- If the skill depends on Claude plugin or hook behavior, it is not active in Codex.
- If a path says `~/.claude`, translate it to a Codex or project-local path only when the behavior makes sense.

Do not claim these files have been fully rewritten for native Codex behavior unless they were explicitly adapted.

## Manual Steps Remain

You may need to do these yourself:

- install and authenticate Codex
- merge config files
- choose which rules belong in a project
- enable MCP servers
- set environment variables
- run verification commands
- add CI checks

This is intentional. Codex-compatible setup should be honest and inspectable.
