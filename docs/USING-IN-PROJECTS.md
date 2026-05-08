# Use This Toolkit In Other Projects

This guide explains how to use Everything Codex Toolkit in real projects.

If you are trying to decide which skill, agent, or prompt to use, read these next:

- [Toolkit Manual](TOOLKIT-MANUAL.md) explains the mental model and how the parts fit together.
- [Feature Catalog](FEATURE-CATALOG.md) lists every active skill, agent, prompt, and surface.
- [Workflow Playbook](WORKFLOW-PLAYBOOK.md) gives copy-paste workflows for common jobs.

The short version:

- Install shared material globally if you want Codex to know this toolkit across many repos.
- Copy a small starter set into a project if you want that project to carry its own Codex rules.
- Do not copy the whole repo into every project.

## Global Setup

Global setup is for shared material you want available across projects.

Run this from the toolkit repo:

```bash
bash scripts/install-codex.sh --global
```

If you want the skills to appear in the Codex CLI skill picker, use:

```bash
bash scripts/install-codex.sh --global --register-skills
```

This keeps the shared toolkit folder and also copies every toolkit skill into `~/.codex/skills/`. That is the folder Codex normally scans for globally installed skills.

This creates:

```text
~/.codex/
|-- AGENTS.md
|-- config.everything-codex.example.toml
|-- skills/                         # created or extended when --register-skills is used
`-- everything-codex/
    |-- skills/
    |-- agents/
    |-- prompts/
    |-- rules/
    |-- contexts/
    |-- mcp-configs/
    `-- .codex/agents/
```

What happens after global setup:

- Codex can read the marked toolkit block in `~/.codex/AGENTS.md`.
- Your project instructions still come first when a project has its own `AGENTS.md`.
- The full skills, agents, rules, and prompts are available as shared reference files.
- If you used `--register-skills`, the skills also appear in Codex's global skill discovery folder.

Global setup is useful when you work across many repos and want one common toolkit library.

## Project Setup

Project setup copies only a small Codex starter set into one project.

Run this from the toolkit repo:

```bash
bash scripts/install-codex.sh --project /path/to/project
```

This creates or updates:

```text
/path/to/project/
|-- AGENTS.md
`-- .codex/
    |-- config.toml
    |-- agents/
    |-- rules/everything-codex/common/
    |-- prompts/everything-codex/
    `-- skills/everything-codex/
```

If the project already has `.codex/config.toml`, the script does not overwrite it. It writes:

```text
.codex/config.everything-codex.example.toml
```

Review it and merge only the parts you want.

## Use In A New Project

Example:

```bash
mkdir my-new-app
cd my-new-app
git init

cd /path/to/everything-codex-toolkit
bash scripts/install-codex.sh --project /path/to/my-new-app

cd /path/to/my-new-app
codex
```

When you open Codex in `my-new-app`, Codex reads `AGENTS.md`. The copied block points Codex to the local toolkit files under `.codex/`.

Good first prompt:

```text
Analyze this repo structure and suggest the smallest useful project-specific additions to AGENTS.md.
Do not edit files yet.
```

## Use In An Existing Project

Existing projects often already have rules and conventions. Do not replace them.

Use this workflow:

```bash
cd /path/to/everything-codex-toolkit
bash scripts/install-codex.sh --project /path/to/existing-project

cd /path/to/existing-project
git diff
```

Then decide what to keep.

Recommended approach:

- Keep the toolkit block in `AGENTS.md` if it does not conflict with project rules.
- Keep `.codex/agents/` if you want role examples.
- Keep `.codex/skills/everything-codex/` if you want local copies of the core skills.
- Delete `.codex/prompts/everything-codex/` if you only want instructions and not workflow prompt files.
- Add only the language rule packs you actually use.

## What To Copy

Copy these into a project:

| Copy | Why |
|---|---|
| `AGENTS.md` toolkit block | Tells Codex how to use local toolkit files |
| `.codex/config.toml` | Optional runtime defaults |
| `.codex/agents/` | Optional role examples |
| `.codex/rules/everything-codex/common/` | Baseline rules |
| `.codex/skills/everything-codex/tdd-workflow/` | Local TDD workflow |
| `.codex/skills/everything-codex/security-review/` | Local security review workflow |
| `.codex/skills/everything-codex/verification-loop/` | Local verification workflow |

Usually do not copy these into every project:

| Do not usually copy | Why |
|---|---|
| full `skills/` | Large catalog; better as global reference |
| full `agents/` | Large role library; use only when needed |
| full `rules/` | Too much context if you do not use every language |
| `legacy/` | Preserved source material, not active Codex setup |

## What Happens When Codex Opens A Project

In normal use:

1. You run `codex` from the project root.
2. Codex reads project instructions such as `AGENTS.md`.
3. Codex applies those instructions while reading, editing, and running commands.
4. If your `AGENTS.md` points to toolkit skills or prompts, Codex can use those files as task guidance.
5. Codex does not automatically run hooks from this repo.
6. Codex does not automatically load old Claude slash commands.

That means the toolkit should be explicit. If you want Codex to use a skill, say so:

```text
Use .codex/skills/everything-codex/tdd-workflow/SKILL.md for this bug fix.
```

## Common Workflows

Planning a feature:

```text
Use .codex/prompts/everything-codex/plan.md.
Restate requirements, inspect the repo, list risks, and wait for confirmation before editing.
```

Code review:

```text
Review the current git diff.
Use the reviewer role style from .codex/agents/reviewer.toml.
Findings first. Focus on correctness, security, regressions, and missing tests.
```

Bug fixing:

```text
Use .codex/skills/everything-codex/tdd-workflow/SKILL.md.
Find or write a failing test for the bug before editing production code.
```

TDD:

```text
Follow RED, GREEN, REFACTOR.
Run the relevant test after each phase and report the exact command.
```

Repo analysis:

```text
Use explorer behavior.
Map the execution path for this feature and cite files and symbols.
Do not propose changes until the analysis is complete.
```

## Customizing For Your Project

After copying the starter set, edit your project `AGENTS.md`.

Add project-specific facts:

- build commands
- test commands
- lint/typecheck commands
- architecture notes
- important directories
- deployment rules
- security requirements

Example:

```markdown
## Project Commands

- Install: `npm install`
- Typecheck: `npm run typecheck`
- Test: `npm test`
- Build: `npm run build`

## Project Rules

- Do not edit generated files under `src/generated/`.
- Use Zod schemas for API input validation.
- Prefer server components unless a component needs browser state.
```

Keep this short. Put long background material in docs and link to it.

## Manual Steps

You may still need to:

- install Codex itself
- authenticate Codex with your OpenAI account
- merge `.codex/config.toml` if the project already has one
- install MCP server dependencies if you enable MCP servers
- add API keys as environment variables
- add stack-specific rule packs manually

Do not put secrets in toolkit files.
