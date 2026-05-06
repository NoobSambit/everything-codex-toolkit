# Contributing

This repository is Codex-only.

Contributions should improve Codex usage while preserving useful toolkit content from the original source.

## Good Contributions

- new or improved Codex skills
- clearer agent role prompts
- practical workflow prompts
- better project setup docs
- language or framework rule packs
- safer Codex config examples
- migration notes for unsupported Claude behavior

## Out Of Scope

Do not add active support for:

- Claude plugin installation
- Claude slash-command loading
- Claude hook lifecycle automation
- Cursor, Gemini, OpenCode, Kiro, Trae, or multi-harness abstractions

Unsupported source material belongs under `legacy/`, not in the active install path.

## Local Checks

Run:

```bash
bash scripts/check-codex-layout.sh
```

For docs changes, also read the changed docs as a normal user would:

- Can they tell what this repo is?
- Can they tell what to copy?
- Can they tell what is global vs project-level?
- Are unsupported Claude features clearly marked?

## Style

- Use simple English.
- Be explicit.
- Prefer examples over vague advice.
- Keep setup instructions safe and reversible.
- Do not include secrets, personal paths, or private account data.

## Commit Style

Use Conventional Commits:

```text
docs: explain existing project setup
fix: avoid overwriting project Codex config
chore: move unsupported source files to legacy
```
