# Migration From The Original Claude Repo

This guide is for users coming from Everything Claude Code.

The goal is not exact feature parity. Codex and Claude Code do not expose the same runtime surfaces. The goal is to keep the useful content and use it in the way Codex actually supports.

## Mental Model

Original Claude setup:

```text
Claude Code plugin
|-- slash commands
|-- hooks
|-- agents
|-- skills
|-- rules under ~/.claude
`-- plugin marketplace behavior
```

Codex setup:

```text
Codex project or global files
|-- AGENTS.md instructions
|-- .codex/config.toml
|-- skills as referenced workflow docs
|-- prompts as copied workflow text
|-- role examples
`-- normal tests, git hooks, CI, and manual verification
```

## Mapping Table

| Claude version | Codex version |
|---|---|
| `CLAUDE.md` | `AGENTS.md` |
| `.claude/` | not active; preserved in `legacy/unsupported-claude/` |
| `.claude-plugin/` | not active; Codex preview manifest is `.codex-plugin/` |
| `commands/` slash commands | `prompts/` workflow prompts |
| `hooks/` lifecycle automation | manual verification, optional git hooks, CI |
| `~/.claude/rules/ecc/` | project `.codex/rules/everything-codex/` or shared `~/.codex/everything-codex/rules/` |
| `~/.claude/skills/` | shared `~/.codex/everything-codex/skills/` or project `.codex/skills/` |
| Claude subagents | role prompt files plus `.codex/agents/*.toml` examples |
| Claude plugin install | `bash scripts/install-codex.sh --global` |

## What Was Preserved

Preserved active content:

- `skills/`
- `agents/`
- `rules/`
- `contexts/`
- workflow prompt content now under `prompts/`
- MCP examples
- Codex config examples

Preserved but inactive content:

- Claude plugin files
- Claude config files
- Claude hook runtime
- other harness folders
- original docs and examples

Inactive content lives under `legacy/`.

## What You Should Stop Doing

Do not use these commands for Codex:

```bash
./install.sh --target claude
./install.ps1 --target claude
```

Do not copy files into:

```text
~/.claude/
.claude/
```

Do not expect prompts like this to auto-load:

```text
/everything-claude-code:plan
```

Use plain Codex prompts instead:

```text
Use prompts/plan.md to plan this feature. Wait for confirmation before editing.
```

## Migrating A Personal Setup

1. Leave your old Claude setup alone unless you no longer use it.
2. Clone or update this Codex toolkit.
3. Run global setup:

```bash
bash scripts/install-codex.sh --global
```

4. Open `~/.codex/AGENTS.md`.
5. Confirm the marked Everything Codex Toolkit block was added.
6. Review `~/.codex/config.everything-codex.example.toml`.
7. Merge only the config values you actually want into `~/.codex/config.toml`.

## Migrating A Project

From the toolkit repo:

```bash
bash scripts/install-codex.sh --project /path/to/project
```

Then:

```bash
cd /path/to/project
git diff
```

Review the diff before committing.

If your project had `CLAUDE.md`, do not copy it blindly into `AGENTS.md`. Translate only the project rules that still matter for Codex:

- build commands
- test commands
- architecture notes
- security constraints
- files Codex should not edit
- verification requirements

Remove Claude-only lines about hooks, slash commands, plugin loading, and `~/.claude`.

## Migrating Slash Commands

Old:

```text
/plan Add OAuth login
/code-review
/build-fix
```

New:

```text
Use prompts/plan.md to plan OAuth login. Wait before editing.
```

```text
Use prompts/code-review.md to review the current git diff.
```

```text
Use the build-error-resolver role from agents/build-error-resolver.md to fix the failing build.
```

Codex does not need slash command wrappers. The prompt text is the reusable part.

## Migrating Hooks

Claude hooks were event-based. Codex does not currently provide the same hook lifecycle in this toolkit.

Use these replacements:

| Old hook use | Codex replacement |
|---|---|
| block bad command before tool use | write explicit project rules and use sandbox approvals |
| format after edit | run formatter manually or through CI |
| typecheck after edit | run project typecheck before final response |
| session summary on stop | ask Codex to summarize work at the end |
| security scan hook | use security-review skill and normal scanners |

If you need hard enforcement, use normal repository tools:

- pre-commit hooks
- CI checks
- branch protection
- package scripts
- test commands

## Migrating Skills

Most skills are plain Markdown and remain useful.

Use them like this:

```text
Use skills/security-review/SKILL.md for this API endpoint.
```

If a skill contains Claude-specific text but the main workflow still applies, follow the workflow and ignore the unsupported runtime detail.

If a skill depends entirely on Claude hooks or Claude plugin behavior, treat it as unsupported until adapted.

## Migration Checklist

- [ ] Root README says Codex, not Claude.
- [ ] Project uses `AGENTS.md`.
- [ ] Old Claude plugin install path is not in active docs.
- [ ] Old slash commands are treated as prompts.
- [ ] Hooks are not advertised as active Codex behavior.
- [ ] Useful skills and agents are preserved.
- [ ] Project docs explain what to copy.
- [ ] Limitations are documented.
