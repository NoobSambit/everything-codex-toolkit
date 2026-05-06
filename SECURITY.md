# Security Policy

Everything Codex Toolkit is a local instruction and workflow toolkit.

It includes Markdown skills, prompts, rules, config examples, and setup scripts. Treat those files like code: review changes before installing them globally or copying them into a project.

## Reporting A Vulnerability

Do not open a public issue for a real security vulnerability.

Report privately to the repository maintainer with:

- a clear description
- steps to reproduce
- affected files
- impact
- suggested fix, if known

## Security Scope

In scope:

- setup scripts under `scripts/`
- active Codex config examples
- active skills, prompts, rules, and agent role prompts
- documentation that could cause unsafe installation or credential handling

Out of active Codex scope:

- files under `legacy/`
- unsupported Claude hook runtime
- unsupported plugin manifests from other tools

Legacy files are preserved for migration context. Do not install them for Codex unless you intentionally adapt and review them first.

## Safe Use

- Never commit API keys or tokens.
- Keep credentials in environment variables or secret managers.
- Review `.codex/config.toml` before enabling MCP servers.
- Do not paste private repository data into public prompts or issues.
- Run `git diff` before committing project setup changes.
