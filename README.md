# Everything Codex Toolkit

Everything Codex Toolkit is a Codex-only version of the original Everything Claude Code repository.

It keeps the useful working material from the original project and makes the active path fit OpenAI Codex workflows:

- reusable skills
- specialist agent-role instructions
- workflow prompts
- language and project rules
- Codex config examples
- setup guidance for using the toolkit in real projects

This is not a new framework. It is a practical toolkit you can copy into your own projects or install into your Codex home directory.

## Attribution

This project is adapted from the original [Everything Claude Code](https://github.com/affaan-m/everything-claude-code) repository by [Affaan Mustafa](https://github.com/affaan-m).

Credit for the original toolkit, skill catalog, agent-role content, rules, workflows, and much of the source material belongs to Affaan Mustafa and the original contributors. This repository converts that material into a Codex-only toolkit maintained by [NoobSambit](https://github.com/NoobSambit).

## What Changed

The original repository was built around Claude Code plugins, slash commands, hooks, and `~/.claude` folders. Codex does not use those same surfaces.

This conversion changes the active path:

- `AGENTS.md` is now the main instruction file for Codex.
- `.codex/config.toml` is the Codex reference config.
- `.codex/agents/` contains Codex agent-role config examples.
- `skills/` remains the main reusable knowledge catalog.
- `agents/` remains a source library of specialist role prompts.
- `commands/` was renamed to `prompts/` because Codex does not auto-load Claude slash commands.
- Claude plugin folders, hook runtime folders, and other tool-specific folders were moved to `legacy/`.

Useful content was preserved. Unsupported runtime behavior was moved out of the main workflow.

## What Stayed The Same

The substance of the toolkit is mostly unchanged:

- Skills still describe repeatable workflows such as TDD, code review, security review, repo analysis, frontend work, and documentation lookup.
- Agent files still describe specialist roles such as planner, reviewer, security reviewer, language reviewers, build resolvers, and docs lookup.
- Rules still provide reusable coding guidance by language and domain.
- Prompt files still preserve the old workflow intent, but they are now plain prompts instead of slash commands.

Some files still mention Claude inside examples or historical notes. That does not mean Claude is part of the active install path. See [Codex limitations](docs/CODEX-LIMITATIONS.md).

## Repository Layout

```text
everything-codex-toolkit/
|-- AGENTS.md                 # Main Codex instructions for this toolkit
|-- .codex/
|   |-- AGENTS.md             # Codex-specific supplement
|   |-- config.toml           # Codex reference config
|   `-- agents/               # Codex multi-agent role examples
|-- .codex-plugin/            # Preview Codex plugin manifest
|-- .agents/skills/           # Small curated skill set for agent-style clients
|-- agents/                   # Specialist role prompt library
|-- skills/                   # Main reusable skill catalog
|-- prompts/                  # Workflow prompts adapted from old slash commands
|-- rules/                    # Common and language-specific rules
|-- contexts/                 # Context presets for dev, review, and research
|-- mcp-configs/              # MCP server examples
|-- scripts/
|   `-- install-codex.sh      # Practical Codex setup helper
|-- docs/                     # Plain-English Codex usage docs
`-- legacy/                   # Preserved unsupported Claude/other-tool surfaces
```

## Quick Start

Install Codex first. OpenAI's current help docs describe the Codex CLI as a local coding agent that can read, edit, and run code in your terminal. Install and authenticate Codex using the current OpenAI instructions for your account.

Then clone this toolkit and run the Codex setup helper:

```bash
git clone https://github.com/NoobSambit/everything-codex-toolkit.git
cd everything-codex-toolkit

bash scripts/install-codex.sh --global
```

That installs reusable toolkit files under `~/.codex/everything-codex/` and merges a marked instruction block into `~/.codex/AGENTS.md`.

To preview without writing:

```bash
bash scripts/install-codex.sh --global --dry-run
```

## Use In A New Project

From this toolkit repo:

```bash
bash scripts/install-codex.sh --project /path/to/new-project
```

This copies a small project-level Codex starter set:

- `AGENTS.md`
- `.codex/config.toml`
- `.codex/agents/`
- selected `rules/`

Then open Codex from the project:

```bash
cd /path/to/new-project
codex
```

When Codex starts in that project, it reads the project `AGENTS.md` and uses those instructions as the local working rules.

## Use In An Existing Project

Do not blindly copy everything into an existing project. Start small:

```bash
bash scripts/install-codex.sh --project /path/to/existing-project
```

Then review the copied files:

```bash
cd /path/to/existing-project
git diff
```

Keep the project `AGENTS.md` short enough that Codex can apply it every session. Link to deeper rules instead of pasting every skill into the instruction file.

## What To Copy Where

Use this rule of thumb:

| File or folder | Copy to project? | Install globally? | Purpose |
|---|---:|---:|---|
| `AGENTS.md` | Yes | Yes | Main behavior instructions |
| `.codex/config.toml` | Optional | Optional | Codex runtime defaults |
| `.codex/agents/` | Optional | Optional | Multi-agent role examples |
| `rules/common/` | Yes | Optional | Baseline coding rules |
| `rules/<language>/` | Yes, only for your stack | Optional | Language guidance |
| `skills/` | Usually no | Yes or reference from docs | Large reusable skill catalog |
| `agents/` | Usually no | Yes or reference from docs | Role prompt library |
| `prompts/` | Optional | Yes | Reusable workflow prompts |
| `legacy/` | No | No | Preserved unsupported source material |

## Example Workflows

Planning a feature:

```text
Use the planning workflow from prompts/plan.md.
First restate the requirements, identify affected files, list risks, and wait for confirmation before editing.
```

Code review:

```text
Review my current git diff using the code-reviewer role.
Focus on correctness, security, behavior changes, and missing tests.
Return findings first with file and line references.
```

Bug fixing:

```text
Use the tdd-workflow skill.
Write or identify a failing test that reproduces the bug, make the smallest fix, then rerun the same test.
```

TDD:

```text
Use skills/tdd-workflow/SKILL.md.
Follow RED, GREEN, REFACTOR. Do not edit production code until the failing test is confirmed.
```

Repo analysis:

```text
Use the explorer role from .codex/agents/explorer.toml.
Map the relevant code path, cite files and symbols, and do not propose changes until asked.
```

## Unsupported In Codex

These original Claude features do not have exact Codex equivalents:

- Claude Code plugin marketplace installation
- Claude slash-command auto-loading
- Claude hook lifecycle events such as `PreToolUse`, `PostToolUse`, and `Stop`
- automatic loading from `~/.claude`
- Claude-specific MCP toggles and plugin cache behavior

The original files are preserved under `legacy/`, but they are not part of the Codex install path.

## More Docs

- [Full toolkit manual](docs/TOOLKIT-MANUAL.md)
- [Feature catalog: every skill, agent, prompt, and active surface](docs/FEATURE-CATALOG.md)
- [Workflow playbook: what to use for common jobs](docs/WORKFLOW-PLAYBOOK.md)
- [Use this toolkit in other projects](docs/USING-IN-PROJECTS.md)
- [Migration from the Claude version](docs/MIGRATION-FROM-CLAUDE.md)
- [Codex limitations and differences](docs/CODEX-LIMITATIONS.md)
- [Conversion summary](docs/CONVERSION-SUMMARY.md)

## Sources

Codex behavior changes over time. For current Codex installation and account details, use the official OpenAI Codex docs and Help Center:

- https://developers.openai.com/codex/cli
- https://help.openai.com/en/articles/11369540-using-codex-with-your-chatgpt-plan
- https://developers.openai.com/codex/
