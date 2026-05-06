# Toolkit Rules

These rules apply to this repository.

## Must Always

- Keep the active path Codex-only.
- Preserve useful skills, agents, prompts, rules, and docs when possible.
- Use `AGENTS.md` as the primary instruction surface.
- Use `prompts/` for reusable workflow prompts.
- Document unsupported behavior plainly.
- Run `bash scripts/check-codex-layout.sh` after structural changes.

## Must Never

- Add active `~/.claude` install instructions.
- Add active Claude plugin marketplace instructions.
- Present Claude hooks as Codex behavior.
- Recreate slash-command assumptions in the main path.
- Delete valuable source material when moving it to `legacy/` would preserve it.
- Add unrelated framework or product abstractions.

## Skill Format

Skills live in:

```text
skills/<name>/SKILL.md
```

Each skill should explain:

- when to use it
- what workflow to follow
- examples or checklists
- verification steps when relevant

## Agent Role Format

Role prompts live in:

```text
agents/*.md
```

Codex role examples live in:

```text
.codex/agents/*.toml
```

Treat `agents/*.md` as reusable role text unless a Codex client explicitly supports importing them.

## Prompt Format

Workflow prompts live in:

```text
prompts/*.md
```

They are copied from the old slash-command content and adapted by usage, not by command loading.

Use them like:

```text
Use prompts/plan.md to plan this feature.
```
