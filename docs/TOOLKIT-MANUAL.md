# Everything Codex Toolkit Manual

This manual explains how to use the toolkit in real projects.

The short version:

- Use `AGENTS.md` for instructions Codex should always follow in a project.
- Use `skills/` when you need a repeatable method for a specific task.
- Use `agents/` when you want Codex to act from a specialist point of view.
- Use `prompts/` when you want a ready-made workflow prompt.
- Use `rules/` when you want project or language guidance.
- Use `contexts/` when you want a prepared working mode.
- Use `mcp-configs/` only when you want optional external tool servers.
- Ignore `legacy/` unless you are studying the original Claude version.

If you only read one page first, read this page. If you need the full list of every skill, agent, and prompt, read [Feature Catalog](FEATURE-CATALOG.md).

## What This Toolkit Is

Everything Codex Toolkit is a reusable Codex working kit. It gives you practical instructions, skills, prompts, and role guides that you can bring into other repositories.

It is not an app. It is not a replacement for Codex. It is a set of files that help Codex work in a more consistent way.

You use it by copying or installing the pieces you need into:

- your global Codex home, usually `~/.codex`
- a specific project repository
- both places, if you want global defaults plus project-specific rules

## Mental Model

Codex reads instructions and then works in your repository. This toolkit gives Codex better instructions.

Think of the toolkit in layers:

| Layer | Folder or file | What it does |
|---|---|---|
| Always-on instructions | `AGENTS.md`, `.codex/AGENTS.md` | Baseline behavior for Codex |
| Runtime config examples | `.codex/config.toml`, `.codex/agents/` | Codex-oriented config examples |
| Skills | `skills/*/SKILL.md` | Detailed task methods |
| Agent roles | `agents/*.md` | Specialist reviewer, planner, builder, explorer roles |
| Workflow prompts | `prompts/*.md` | Ready-made prompts for common workflows |
| Rules | `rules/` | Coding standards and project guidance |
| Context presets | `contexts/` | Short mode files for dev, review, and research |
| Optional integrations | `mcp-configs/`, `.mcp.json` | MCP examples you can adapt |
| Unsupported history | `legacy/` | Original Claude/plugin material kept out of the active path |

## How Codex Uses These Files

Codex does not automatically read every file in this repository every time.

That is good. Loading everything would waste context and confuse the task.

Use this pattern:

1. Put stable project rules in `AGENTS.md`.
2. Keep large reference material in `skills/`, `agents/`, `prompts/`, and `rules/`.
3. Tell Codex which specific files to use for the current task.
4. Keep the active task focused.

Example:

```text
Use skills/tdd-workflow/SKILL.md and agents/tdd-guide.md.
Fix the failing login test. Start by reproducing the failure, then make the smallest fix.
```

This is better than saying:

```text
Use everything in this toolkit.
```

## What Goes Global

Global setup is useful when you want the same habits across many projects.

Good global files:

- `AGENTS.md`
- selected `rules/`
- selected `prompts/`
- selected `skills/`
- selected `agents/`

Global setup should be general. Do not put one project’s private architecture decisions in global instructions.

Use the install helper:

```bash
bash scripts/install-codex.sh --global
```

If you want the skills to appear in the Codex CLI skill picker, use:

```bash
bash scripts/install-codex.sh --global --register-skills
```

This installs the shared toolkit under `~/.codex/everything-codex/` and also registers the skills under `~/.codex/skills/`.

Preview first:

```bash
bash scripts/install-codex.sh --global --dry-run
```

## What Goes In A Project

Project setup is useful when a repo has its own stack, conventions, commands, or architecture.

Good project files:

- `AGENTS.md`
- `.codex/config.toml` if you want project-specific Codex defaults
- `.codex/agents/` if you use Codex multi-agent role examples
- `rules/common/`
- only the language or framework rules your project actually uses
- small references to useful skills or prompts

Use the install helper:

```bash
bash scripts/install-codex.sh --project /path/to/project
```

Then inspect changes:

```bash
cd /path/to/project
git diff
```

## What Not To Copy Into Every Project

Do not copy the whole toolkit into every repo unless you have a specific reason.

Usually avoid copying:

- all `skills/`
- all `agents/`
- all `prompts/`
- all `legacy/`
- all `mcp-configs/`

Instead, install the toolkit globally and reference the needed files from the toolkit repository.

If you use `--register-skills`, the skill files are also copied into `~/.codex/skills/` so Codex can discover them as global skills. Existing skill folders are not overwritten by the installer.

## How To Ask Codex To Use A Skill

A skill is a focused task guide. It usually lives at:

```text
skills/<skill-name>/SKILL.md
```

Use a skill when you want Codex to follow a specific method.

Example:

```text
Use skills/security-review/SKILL.md.
Review the authentication changes in this diff. Prioritize exploitable bugs and missing tests.
```

Use a skill when:

- the task has a known process
- the task needs domain-specific rules
- you want consistency across repeated work
- you want Codex to avoid generic advice

Do not use a skill when:

- the task is tiny and obvious
- the skill is unrelated to your repo
- using the skill would add process without value

## How To Ask Codex To Use An Agent Role

An agent file is a role prompt. It usually lives at:

```text
agents/<role-name>.md
```

Use an agent role when you want a specific perspective.

Example:

```text
Use agents/code-reviewer.md.
Review my current git diff. Findings first. Focus on correctness, behavior regressions, and missing tests.
```

Use an agent when:

- you want a reviewer, planner, explorer, or resolver mindset
- the task benefits from a narrow specialist point of view
- you want Codex to format the output like that role

Do not use an agent role as a magic worker. The role gives guidance, but Codex still needs the repo context and your task.

## How To Use Workflow Prompts

Prompt files live in:

```text
prompts/
```

They are not slash commands in Codex. They are plain workflow prompts.

Use them by naming the file:

```text
Use prompts/feature-dev.md.
Implement the settings page described in docs/settings-plan.md.
```

Prompt files are best when:

- you know the workflow you want
- you want a standard sequence
- you want to avoid retyping a long instruction

## How To Use Rules

Rules are reusable coding guidance. They live in:

```text
rules/
```

Use rules when a project needs stable standards.

Examples:

```text
Follow rules/common and the Python rules for this change.
```

```text
Update AGENTS.md so Codex always follows the rules in rules/common for this repo.
```

Rules are good for:

- language conventions
- testing expectations
- security defaults
- style decisions
- repo-specific instructions

Rules should be stable. If something is only true for one task, put it in the task prompt instead.

## How To Use Contexts

Contexts are small mode files:

- `contexts/dev.md`
- `contexts/research.md`
- `contexts/review.md`

Use them when you want Codex to switch working style.

Example:

```text
Use contexts/review.md and agents/security-reviewer.md.
Review this payment flow for security and correctness.
```

Contexts are lighter than skills. They set the working mode but do not replace task-specific instructions.

## How To Use MCP Configs

MCP config examples live in:

```text
mcp-configs/
.mcp.json
```

Use them only if you actually want external tool servers.

MCP can help with:

- docs lookup
- browser automation
- database tools
- repository services
- custom company systems

MCP is optional. The core toolkit works without it.

Before using an MCP config:

- read the config
- confirm the server is safe
- check required environment variables
- do not copy secrets into the repo

## How To Use The Codex Plugin Surface

This repo includes:

```text
.codex-plugin/plugin.json
```

This is for Codex plugin-style packaging where supported. It is not the same as the original Claude plugin system.

Use it when:

- you want to package the toolkit as a Codex plugin
- your Codex environment supports plugin loading
- you understand what files the plugin exposes

Do not assume Claude plugin behavior exists in Codex. Claude hooks, slash commands, and marketplace install behavior were not copied into the active path.

## How To Choose Skill vs Agent vs Prompt

Use this decision table:

| Situation | Use this |
|---|---|
| You need a repeatable method | Skill |
| You need a specialist viewpoint | Agent |
| You need a ready workflow prompt | Prompt |
| You need stable project behavior | `AGENTS.md` or rules |
| You need a temporary working style | Context |
| You need external tools | MCP config |

Most real tasks use two or three pieces together.

Example:

```text
Use prompts/code-review.md, agents/typescript-reviewer.md, and skills/security-review/SKILL.md.
Review the current diff. Findings first. Include tests that should be added.
```

## Core Combos

Planning a feature:

```text
Use prompts/plan.md and agents/planner.md.
Read the requirements, inspect the repo, and produce an implementation plan before editing.
```

Building a feature:

```text
Use prompts/feature-dev.md, skills/codebase-onboarding/SKILL.md, and skills/verification-loop/SKILL.md.
Implement the feature and verify it with the smallest relevant tests.
```

Fixing a bug:

```text
Use skills/tdd-workflow/SKILL.md and agents/build-error-resolver.md if tests fail.
Reproduce the bug first, add or identify a failing test, then make the smallest fix.
```

Reviewing code:

```text
Use prompts/code-review.md and agents/code-reviewer.md.
Review the diff. Findings first with file and line references.
```

Updating docs:

```text
Use prompts/update-docs.md and agents/doc-updater.md.
Update only docs affected by the code changes.
```

Researching a repo:

```text
Use skills/repo-scan/SKILL.md and agents/code-explorer.md.
Map the relevant architecture. Do not edit files.
```

Security review:

```text
Use skills/security-review/SKILL.md and agents/security-reviewer.md.
Prioritize exploitable issues, missing validation, secret handling, auth, and data exposure.
```

Frontend work:

```text
Use skills/frontend-patterns/SKILL.md, skills/design-system/SKILL.md, and skills/accessibility/SKILL.md.
Preserve the existing design system unless asked to redesign.
```

## What Happens When You Open Codex In A Project

When you run Codex from a project directory, Codex uses the files and instructions available in that project and your Codex home.

In a project using this toolkit:

1. Codex sees project instructions in `AGENTS.md`.
2. Codex follows the repo-specific rules you placed there.
3. You can ask Codex to load a skill, agent, prompt, context, or rule file for the current task.
4. Codex edits files, runs commands, and reports results according to the active instructions.

Codex does not automatically perform every workflow in this toolkit. You choose the workflow by naming the right files.

## How To Customize The Toolkit

Start small.

Good customizations:

- add project commands to `AGENTS.md`
- add stack-specific rules under `rules/`
- add a project skill under `skills/<your-skill>/SKILL.md`
- add a project role under `agents/<your-role>.md`
- add a workflow prompt under `prompts/<your-workflow>.md`

Avoid:

- adding huge instructions to `AGENTS.md`
- copying every skill into one prompt
- making global rules that are only true for one repo
- hiding important manual steps
- pretending unsupported Claude behavior works in Codex

## Suggested First Setup For A Real Project

Use this practical starter:

1. Run `bash scripts/install-codex.sh --project /path/to/project`.
2. Edit the copied `AGENTS.md`.
3. Add the project’s install, test, lint, and build commands.
4. Add the project’s main language and framework rules.
5. Keep `skills/`, `agents/`, and `prompts/` as referenced libraries instead of copying everything.
6. Ask Codex to use specific files when needed.

Example project `AGENTS.md` note:

```md
For TDD tasks, use the global toolkit skill at skills/tdd-workflow/SKILL.md.
For reviews, use agents/code-reviewer.md and the language reviewer for this stack.
Run npm test and npm run lint before final responses when relevant.
```

## Limitations

Codex does not exactly replicate every Claude feature.

Unsupported or different:

- Claude slash commands are now plain prompt files.
- Claude hook lifecycle files are not active in Codex.
- Claude plugin installation is not the Codex plugin system.
- `~/.claude` paths are not used.
- Some original source files in `legacy/` are kept for history only.
- Skills and agents are not automatically selected unless your Codex environment supports that behavior or you ask for them.

The honest workflow is simple: keep stable instructions in `AGENTS.md`, then explicitly tell Codex which skill, agent, prompt, rule, or context to use.
