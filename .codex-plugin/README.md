# Codex Plugin Manifest

This directory contains a preview Codex plugin manifest for Everything Codex Toolkit.

The main supported setup path is still manual:

```bash
bash scripts/install-codex.sh --global
bash scripts/install-codex.sh --project /path/to/project
```

Use this manifest only if your Codex client supports local plugin installation.

## What It Points To

- skills: `./skills/`
- MCP examples: `./.mcp.json`
- default prompts: TDD, security review, and verification loop guidance

## Important

This is not a Claude plugin. It does not load Claude hooks, Claude slash commands, or `~/.claude` files.
