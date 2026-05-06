# Feature Catalog

This catalog lists the active toolkit features.

Use it to answer:

- Which skill should I use?
- Which agent role should I ask Codex to follow?
- Which prompt file should I start from?
- What does each folder contain?

This page is intentionally long. It is meant to be searched.

## How To Use This Catalog

Use a feature by naming its path in your Codex prompt.

Skill example:

```text
Use skills/tdd-workflow/SKILL.md.
Add tests for this bug, make them fail, then fix the bug.
```

Agent example:

```text
Use agents/security-reviewer.md.
Review the current diff for exploitable security issues.
```

Prompt example:

```text
Use prompts/quality-gate.md.
Run a final quality gate for this change.
```

You do not need to load everything. Pick the smallest set that fits the task.

## Fast Choice Guide

| If you need to... | Start with... |
|---|---|
| Understand a repo | `skills/codebase-onboarding/SKILL.md`, `skills/repo-scan/SKILL.md`, `agents/code-explorer.md` |
| Plan a feature | `prompts/plan.md`, `agents/planner.md` |
| Build a feature | `prompts/feature-dev.md`, `skills/verification-loop/SKILL.md` |
| Fix a bug | `skills/tdd-workflow/SKILL.md`, `skills/verification-loop/SKILL.md` |
| Review code | `prompts/code-review.md`, `agents/code-reviewer.md` |
| Review security | `skills/security-review/SKILL.md`, `agents/security-reviewer.md` |
| Fix build errors | `prompts/build-fix.md`, `agents/build-error-resolver.md` |
| Update docs | `prompts/update-docs.md`, `agents/doc-updater.md` |
| Improve tests | `prompts/test-coverage.md`, language testing skill |
| Work on UI | `skills/frontend-patterns/SKILL.md`, `skills/design-system/SKILL.md`, `skills/accessibility/SKILL.md` |
| Work on APIs | `skills/api-design/SKILL.md`, `skills/backend-patterns/SKILL.md` |
| Work on databases | `skills/database-migrations/SKILL.md`, `agents/database-reviewer.md` |
| Work on LLM agents | `skills/agentic-engineering/SKILL.md`, `skills/eval-harness/SKILL.md` |
| Prepare open source release | `skills/opensource-pipeline/SKILL.md`, `agents/opensource-sanitizer.md` |

## Active Skills

Skills live in `skills/<name>/SKILL.md`.

Use a skill when you want Codex to follow a reusable method for a task.

| Skill | Use when |
|---|---|
| `accessibility` | You need accessible UI, keyboard support, semantic HTML, ARIA review, or inclusive design checks. |
| `agent-eval` | You need to evaluate an AI agent with clear tasks, scoring, and regression checks. |
| `agent-harness-construction` | You need to build a harness around an agent so it can be tested and repeated. |
| `agent-introspection-debugging` | You need to debug why an agent made a bad decision or failed silently. |
| `agent-payment-x402` | You need agent payment or x402-style payment flow guidance. |
| `agentic-engineering` | You are designing or improving agentic software, not just a single prompt. |
| `ai-first-engineering` | You want engineering workflows designed around AI assistance and verification. |
| `ai-regression-testing` | You need tests that catch prompt, model, or agent behavior regressions. |
| `android-clean-architecture` | You are building Android code with clean architecture boundaries. |
| `api-connector-builder` | You need to build a connector for an external API with auth, pagination, errors, and tests. |
| `api-design` | You are designing or changing an API contract, endpoint, validation model, or error shape. |
| `architecture-decision-records` | You need to write or update an ADR for an important technical decision. |
| `article-writing` | You need structured long-form writing, technical articles, or polished explanatory docs. |
| `automation-audit-ops` | You need to audit automation workflows, operational scripts, or scheduled jobs. |
| `autonomous-agent-harness` | You need a safe loop, runner, or harness for autonomous agent behavior. |
| `autonomous-loops` | You need to design or control repeated autonomous work loops. |
| `backend-patterns` | You are changing backend services, handlers, validation, domain logic, or service boundaries. |
| `benchmark` | You need benchmark design, measurement discipline, or performance comparison. |
| `blueprint` | You need a reusable project blueprint or structured build plan. |
| `brand-voice` | You need writing to match a brand voice or communication style. |
| `browser-qa` | You need browser-based QA, click-path testing, visual checks, or user-flow verification. |
| `bun-runtime` | You are using Bun and need runtime, tooling, package, or test guidance. |
| `canary-watch` | You need canary release monitoring, early warning checks, or rollout watch guidance. |
| `carrier-relationship-management` | You need logistics carrier relationship, routing, service, or operations guidance. |
| `ck` | You need the toolkit's CK-specific workflow or convention. Inspect the skill before use. |
| `click-path-audit` | You need to audit user click paths, funnels, forms, or navigation flows. |
| `clickhouse-io` | You are working with ClickHouse ingestion, queries, storage, or analytics patterns. |
| `code-tour` | You need a guided explanation of how a code area works. |
| `codebase-onboarding` | You are entering a new repo and need structure, commands, architecture, and risk mapping. |
| `coding-standards` | You need broad coding quality standards across a project. |
| `compose-multiplatform-patterns` | You are building Kotlin Compose Multiplatform UI or architecture. |
| `connections-optimizer` | You need to optimize relationship graphs, outreach connections, or network paths. |
| `content-engine` | You need a repeatable system for producing, editing, or distributing content. |
| `content-hash-cache-pattern` | You need cache keys, content hashing, invalidation, or deterministic artifact caching. |
| `context-budget` | You need to manage limited context and decide what Codex should load. |
| `continuous-agent-loop` | You need an agent loop that keeps working with checkpoints and guardrails. |
| `cost-aware-llm-pipeline` | You need LLM workflow design that controls latency, token use, and cost. |
| `council` | You need multiple perspectives or a council-style decision process. |
| `cpp-coding-standards` | You are writing or reviewing C++ and need style, safety, and maintainability rules. |
| `cpp-testing` | You need C++ test design, build/test commands, or failure analysis. |
| `crosspost` | You need to adapt content for multiple platforms without losing meaning. |
| `csharp-testing` | You need C# or .NET test guidance. |
| `customer-billing-ops` | You need billing workflow, customer invoicing, payment, or ops process guidance. |
| `customs-trade-compliance` | You need customs, trade, import/export, or compliance workflow guidance. |
| `dart-flutter-patterns` | You are building Dart or Flutter code and need architecture and UI patterns. |
| `dashboard-builder` | You need to design or implement dashboards, metrics views, or operational panels. |
| `data-scraper-agent` | You need an agent or workflow for scraping, extraction, normalization, and validation. |
| `database-migrations` | You need schema migration planning, rollback thinking, indexes, and data safety. |
| `deep-research` | You need careful research with sources, assumptions, and synthesis. |
| `defi-amm-security` | You need DeFi AMM security analysis, exploit review, or smart contract risk checks. |
| `deployment-patterns` | You need deployment, rollout, rollback, environment, or release guidance. |
| `design-system` | You are working inside or creating a design system with tokens, components, and consistency. |
| `django-patterns` | You are building Django views, models, services, forms, or project structure. |
| `django-security` | You need Django-specific security review. |
| `django-tdd` | You want Django development driven by tests. |
| `django-verification` | You need Django-specific verification, test, and behavior checks. |
| `docker-patterns` | You are writing Dockerfiles, Compose files, container setup, or image workflows. |
| `documentation-lookup` | You need Codex to find and use relevant documentation instead of guessing. |
| `dotnet-patterns` | You are working in .NET architecture, services, dependency injection, or project structure. |
| `e2e-testing` | You need end-to-end tests, flows, fixtures, or browser/app test strategy. |
| `email-ops` | You need email workflow, deliverability, templates, or operational email guidance. |
| `energy-procurement` | You need energy buying, contract, rate, or procurement workflow guidance. |
| `enterprise-agent-ops` | You need agent operations for an enterprise environment with controls and governance. |
| `eval-harness` | You need an evaluation harness for prompts, agents, or model outputs. |
| `evm-token-decimals` | You need EVM token decimal handling, display, parsing, or precision review. |
| `exa-search` | You need Exa-style search or research workflow guidance. |
| `fal-ai-media` | You need fal.ai media generation or API workflow guidance. |
| `finance-billing-ops` | You need finance, billing, reconciliation, or operational workflow guidance. |
| `flutter-dart-code-review` | You need Flutter or Dart-specific code review. |
| `foundation-models-on-device` | You need on-device model deployment or mobile/edge model guidance. |
| `frontend-patterns` | You are building frontend UI, components, state, layout, or client-side architecture. |
| `frontend-slides` | You need slides or presentation UI built with frontend tools. |
| `gan-style-harness` | You need generation/evaluation harnesses for GAN-style or adversarial generation workflows. |
| `gateguard` | You need guardrails, gates, approval checks, or safety constraints around automated work. |
| `git-workflow` | You need branch, commit, diff, rebase, merge, or PR workflow guidance. |
| `github-ops` | You need GitHub issue, PR, release, actions, labels, or repo operations guidance. |
| `golang-patterns` | You are building Go services, packages, errors, interfaces, or concurrency. |
| `golang-testing` | You need Go test structure, table tests, mocks, or failure analysis. |
| `google-workspace-ops` | You need Google Workspace automation or operational guidance. |
| `healthcare-cdss-patterns` | You are working on clinical decision support systems. |
| `healthcare-emr-patterns` | You are working on EMR/EHR workflows, records, clinical data, or healthcare integrations. |
| `healthcare-eval-harness` | You need healthcare-specific evaluation, safety, and validation harnesses. |
| `healthcare-phi-compliance` | You need PHI handling, privacy, de-identification, or healthcare data compliance checks. |
| `hermes-imports` | You need Hermes/import workflow guidance specific to this toolkit content. |
| `hexagonal-architecture` | You need ports/adapters architecture, boundary design, or dependency direction guidance. |
| `hipaa-compliance` | You need HIPAA-oriented privacy, security, and process checks. |
| `inventory-demand-planning` | You need inventory planning, demand forecasting, or operations guidance. |
| `investor-materials` | You need pitch decks, investor updates, metrics narrative, or fundraising materials. |
| `investor-outreach` | You need investor targeting, outreach copy, or pipeline workflow guidance. |
| `iterative-retrieval` | You need repeated search, retrieval, refinement, and source validation. |
| `java-coding-standards` | You are writing or reviewing Java and need maintainability standards. |
| `jira-integration` | You need Jira issue, ticket, workflow, or integration guidance. |
| `jpa-patterns` | You are working with JPA entities, repositories, transactions, or query behavior. |
| `knowledge-ops` | You need knowledge base, notes, documentation, or internal knowledge operations. |
| `kotlin-coroutines-flows` | You need Kotlin coroutine, Flow, cancellation, or concurrency guidance. |
| `kotlin-exposed-patterns` | You are using Kotlin Exposed for database access. |
| `kotlin-ktor-patterns` | You are building Ktor services or Kotlin backend APIs. |
| `kotlin-patterns` | You are writing Kotlin and need architecture, idioms, or maintainability guidance. |
| `kotlin-testing` | You need Kotlin test strategy, coroutine testing, or framework guidance. |
| `laravel-patterns` | You are building Laravel apps, controllers, services, jobs, or models. |
| `laravel-plugin-discovery` | You need Laravel package/plugin discovery or integration guidance. |
| `laravel-security` | You need Laravel-specific security review. |
| `laravel-tdd` | You want Laravel development driven by tests. |
| `laravel-verification` | You need Laravel-specific verification and test checks. |
| `lead-intelligence` | You need lead research, qualification, enrichment, or sales intelligence workflow. |
| `liquid-glass-design` | You need liquid-glass visual design patterns. |
| `llm-trading-agent-security` | You need security review for LLM trading agents or automated financial decision systems. |
| `logistics-exception-management` | You need logistics exception handling, escalation, or operations workflow guidance. |
| `manim-video` | You need animated educational videos with Manim. |
| `market-research` | You need market research, competitor analysis, or customer/problem research. |
| `mcp-server-patterns` | You need to design, review, or implement MCP servers. |
| `messages-ops` | You need messaging, notification, inbox, or communication operations guidance. |
| `nestjs-patterns` | You are building NestJS modules, providers, controllers, or services. |
| `nextjs-turbopack` | You are working with Next.js and Turbopack build/runtime behavior. |
| `nodejs-keccak256` | You need Node.js Keccak-256 hashing or Ethereum-compatible hashing behavior. |
| `nutrient-document-processing` | You need Nutrient/PDF/document processing workflow guidance. |
| `nuxt4-patterns` | You are building Nuxt 4 apps, routing, data loading, or Vue architecture. |
| `openclaw-persona-forge` | You need persona construction or OpenClaw-style persona workflows. |
| `opensource-pipeline` | You need to prepare, sanitize, package, or release open source work. |
| `perl-patterns` | You are writing Perl and need maintainable structure and idioms. |
| `perl-security` | You need Perl-specific security review. |
| `perl-testing` | You need Perl testing guidance. |
| `plankton-code-quality` | You need Plankton-specific code quality guidance from the toolkit. |
| `postgres-patterns` | You are working with PostgreSQL schema, queries, indexes, or transactions. |
| `product-capability` | You need to map or explain product capabilities. |
| `product-lens` | You need product thinking, tradeoff analysis, or user impact review. |
| `production-scheduling` | You need production scheduling, capacity, or operations planning guidance. |
| `project-flow-ops` | You need project flow, delivery process, handoff, or operational coordination guidance. |
| `prompt-optimizer` | You need to improve prompts using examples, constraints, and measurable outcomes. |
| `python-patterns` | You are writing Python and need architecture, typing, errors, or maintainability guidance. |
| `python-testing` | You need Python tests, pytest patterns, fixtures, mocks, or coverage strategy. |
| `pytorch-patterns` | You are building PyTorch models, training code, datasets, or experiment pipelines. |
| `quality-nonconformance` | You need quality issue, corrective action, or nonconformance workflow guidance. |
| `ralphinho-rfc-pipeline` | You need RFC drafting or pipeline guidance specific to this toolkit content. |
| `regex-vs-llm-structured-text` | You need to decide between regex, parser logic, and LLM extraction. |
| `remotion-video-creation` | You need programmatic video creation with Remotion. |
| `repo-scan` | You need a quick repo inventory, structure scan, and risk map. |
| `research-ops` | You need organized research operations, source handling, and synthesis. |
| `returns-reverse-logistics` | You need returns, reverse logistics, or post-sale operations guidance. |
| `rules-distill` | You need to turn messy notes or repo conventions into clean rules. |
| `rust-patterns` | You are writing Rust and need ownership, error handling, modules, or idioms. |
| `rust-testing` | You need Rust tests, cargo workflows, fixtures, or integration testing. |
| `safety-guard` | You need guardrails for risky actions, automation, agents, or user safety. |
| `santa-method` | You need the Santa Method workflow from the original toolkit. Inspect before use. |
| `search-first` | You need Codex to search or inspect before answering or changing code. |
| `security-bounty-hunter` | You need adversarial security review with bug bounty-style thinking. |
| `security-review` | You need general security review across code, config, data, and workflows. |
| `seo` | You need search engine optimization, metadata, content, or technical SEO guidance. |
| `skill-comply` | You need to check whether a skill follows expected skill structure or rules. |
| `skill-stocktake` | You need to inventory, review, or clean up a skill catalog. |
| `social-graph-ranker` | You need social graph ranking, relationship scoring, or network prioritization guidance. |
| `springboot-patterns` | You are building Spring Boot services, controllers, config, or layers. |
| `springboot-security` | You need Spring Boot-specific security review. |
| `springboot-tdd` | You want Spring Boot development driven by tests. |
| `springboot-verification` | You need Spring Boot-specific verification and test checks. |
| `swift-actor-persistence` | You need Swift actor persistence or concurrency-safe state guidance. |
| `swift-concurrency-6-2` | You need Swift 6.2 concurrency, isolation, sendability, or async guidance. |
| `swift-protocol-di-testing` | You need Swift dependency injection and protocol-based testing guidance. |
| `swiftui-patterns` | You are building SwiftUI views, state, navigation, or app structure. |
| `tdd-workflow` | You want RED, GREEN, REFACTOR development. |
| `team-builder` | You need to design team roles, workflows, or operating structure. |
| `terminal-ops` | You need safe terminal command planning, shell workflows, or command verification. |
| `token-budget-advisor` | You need to reduce token/context usage and choose what context to load. |
| `ui-demo` | You need a polished UI demo or prototype. |
| `unified-notifications-ops` | You need notification routing, preferences, channels, or operations guidance. |
| `verification-loop` | You need a disciplined edit-test-fix verification cycle. |
| `video-editing` | You need video editing workflow guidance. |
| `videodb` | You need VideoDB workflow, media indexing, or video search guidance. |
| `visa-doc-translate` | You need visa document translation or structured document handling guidance. |
| `workspace-surface-audit` | You need to audit what files, configs, tools, or surfaces exist in a workspace. |
| `x-api` | You need X/Twitter API workflow guidance. |

## Active Agent Roles

Agent roles live in `agents/*.md`.

Use an agent when you want Codex to take a specialist viewpoint. You can combine one role with a skill.

| Agent | Use when |
|---|---|
| `a11y-architect` | You need accessibility architecture, keyboard flows, semantic UI, or WCAG-minded design review. |
| `architect` | You need broad system architecture, boundaries, tradeoffs, and long-term design review. |
| `build-error-resolver` | You need to diagnose and fix build, compile, lint, or test command failures. |
| `chief-of-staff` | You need coordination, prioritization, planning, or execution tracking across tasks. |
| `code-architect` | You need code-level architecture, module boundaries, interfaces, and implementation structure. |
| `code-explorer` | You need repo exploration and explanation without editing. |
| `code-reviewer` | You need a serious review focused on bugs, regressions, security, and missing tests. |
| `code-simplifier` | You need to reduce complexity while preserving behavior. |
| `comment-analyzer` | You need to analyze comments, feedback threads, or review discussion. |
| `conversation-analyzer` | You need to extract decisions, tasks, or context from a conversation. |
| `cpp-build-resolver` | You need C++ build or toolchain failure diagnosis. |
| `cpp-reviewer` | You need C++ code review. |
| `csharp-reviewer` | You need C# or .NET code review. |
| `dart-build-resolver` | You need Dart or Flutter build failure diagnosis. |
| `database-reviewer` | You need schema, query, migration, transaction, or data integrity review. |
| `doc-updater` | You need docs updated accurately after code or workflow changes. |
| `docs-lookup` | You need documentation lookup and source-grounded answers. |
| `e2e-runner` | You need end-to-end test execution or flow verification. |
| `flutter-reviewer` | You need Flutter code review. |
| `gan-evaluator` | You need generated output or GAN-style result evaluation. |
| `gan-generator` | You need GAN-style generation workflow guidance. |
| `gan-planner` | You need planning for a generation/evaluation workflow. |
| `go-build-resolver` | You need Go build or test failure diagnosis. |
| `go-reviewer` | You need Go code review. |
| `harness-optimizer` | You need to improve an eval, benchmark, or agent harness. |
| `healthcare-reviewer` | You need healthcare software, PHI, clinical safety, or compliance review. |
| `java-build-resolver` | You need Java or JVM build failure diagnosis. |
| `java-reviewer` | You need Java code review. |
| `kotlin-build-resolver` | You need Kotlin or Gradle build failure diagnosis. |
| `kotlin-reviewer` | You need Kotlin code review. |
| `loop-operator` | You need controlled repeated execution with checkpoints. |
| `opensource-forker` | You need to fork, adapt, and preserve attribution from an upstream project. |
| `opensource-packager` | You need to package a repo for public use. |
| `opensource-sanitizer` | You need to remove private or tool-specific surfaces while preserving value. |
| `performance-optimizer` | You need performance analysis, profiling, or optimization review. |
| `planner` | You need a clear implementation plan before editing. |
| `pr-test-analyzer` | You need to understand PR test failures or CI signals. |
| `python-reviewer` | You need Python code review. |
| `pytorch-build-resolver` | You need PyTorch or ML stack build/runtime failure diagnosis. |
| `refactor-cleaner` | You need behavior-preserving refactoring. |
| `rust-build-resolver` | You need Rust build, cargo, or compiler error diagnosis. |
| `rust-reviewer` | You need Rust code review. |
| `security-reviewer` | You need security review with concrete exploit-oriented findings. |
| `seo-specialist` | You need SEO content, metadata, discoverability, or technical SEO review. |
| `silent-failure-hunter` | You need to find failure paths that do not crash loudly. |
| `tdd-guide` | You need RED/GREEN/REFACTOR guidance. |
| `type-design-analyzer` | You need type model, API type, schema, or interface design review. |
| `typescript-reviewer` | You need TypeScript code review. |

## Active Workflow Prompts

Prompts live in `prompts/*.md`.

They are plain prompts, not Claude slash commands. Ask Codex to use the prompt file.

| Prompt | Use when |
|---|---|
| `aside` | You need a short side analysis without derailing the main task. |
| `build-fix` | You need to fix build, compile, lint, or test failures. |
| `code-review` | You need a structured local code review. |
| `cpp-build` | You need a C++ build workflow. |
| `cpp-review` | You need a C++ review workflow. |
| `cpp-test` | You need a C++ test workflow. |
| `feature-dev` | You need to implement a feature with repo-aware steps. |
| `flutter-build` | You need a Flutter build workflow. |
| `flutter-review` | You need a Flutter review workflow. |
| `flutter-test` | You need a Flutter test workflow. |
| `gan-build` | You need a generation/harness build workflow. |
| `gan-design` | You need a generation/harness design workflow. |
| `go-build` | You need a Go build workflow. |
| `go-review` | You need a Go review workflow. |
| `go-test` | You need a Go test workflow. |
| `gradle-build` | You need a Gradle/JVM build workflow. |
| `jira` | You need Jira ticket or issue workflow support. |
| `kotlin-build` | You need a Kotlin build workflow. |
| `kotlin-review` | You need a Kotlin review workflow. |
| `kotlin-test` | You need a Kotlin test workflow. |
| `plan` | You need a plan before editing. |
| `python-review` | You need a Python review workflow. |
| `quality-gate` | You need a final readiness check before merge or release. |
| `refactor-clean` | You need behavior-preserving refactoring. |
| `review-pr` | You need a pull request review workflow. |
| `rust-build` | You need a Rust build workflow. |
| `rust-review` | You need a Rust review workflow. |
| `rust-test` | You need a Rust test workflow. |
| `skill-create` | You need to create or adapt a Codex skill. |
| `test-coverage` | You need to improve test coverage or find missing cases. |
| `update-codemaps` | You need to update code maps or repository navigation docs. |
| `update-docs` | You need docs updated after code or workflow changes. |

## Other Active Surfaces

| Surface | Use when |
|---|---|
| `AGENTS.md` | You want project or toolkit-level instructions Codex should always follow. |
| `.codex/AGENTS.md` | You want Codex-specific supplemental instructions. |
| `.codex/config.toml` | You want a reference Codex config for this toolkit or another project. |
| `.codex/agents/` | You want Codex multi-agent role examples where supported. |
| `.codex-plugin/plugin.json` | You want to package or inspect this as a Codex plugin where supported. |
| `.agents/skills/` | You want the small curated skill surface used by some agent-style clients. |
| `rules/` | You want stable coding standards and reusable project rules. |
| `contexts/dev.md` | You want implementation mode guidance. |
| `contexts/research.md` | You want investigation mode guidance. |
| `contexts/review.md` | You want review mode guidance. |
| `mcp-configs/mcp-servers.json` | You want optional MCP server examples. |
| `.mcp.json` | You want a root MCP config example. |
| `scripts/install-codex.sh` | You want to install toolkit files globally or into a project. |
| `scripts/check-codex-layout.sh` | You want to verify the Codex-oriented layout exists. |
| `legacy/` | You want to inspect preserved unsupported Claude or old-tool surfaces. Do not use as the active path. |
| `ATTRIBUTION.md` | You want credit and upstream origin details. |
| `PROMPTS-QUICK-REF.md` | You want a quick prompt reference from the toolkit. |
| `RULES.md` | You want a top-level explanation of rules. |

## Common Pairings

| Task | Good pairing |
|---|---|
| New backend feature | `prompts/feature-dev.md` plus `skills/backend-patterns/SKILL.md` plus `skills/api-design/SKILL.md` |
| New frontend feature | `prompts/feature-dev.md` plus `skills/frontend-patterns/SKILL.md` plus `skills/accessibility/SKILL.md` |
| Auth or permission change | `agents/security-reviewer.md` plus `skills/security-review/SKILL.md` |
| Database migration | `skills/database-migrations/SKILL.md` plus `agents/database-reviewer.md` |
| Test improvement | `prompts/test-coverage.md` plus the matching language testing skill |
| Large refactor | `prompts/refactor-clean.md` plus `agents/refactor-cleaner.md` plus `skills/verification-loop/SKILL.md` |
| Release check | `prompts/quality-gate.md` plus `skills/verification-loop/SKILL.md` |
| Documentation update | `prompts/update-docs.md` plus `agents/doc-updater.md` |
| Repo conversion | `skills/opensource-pipeline/SKILL.md` plus `agents/opensource-sanitizer.md` |

## How Not To Use This Catalog

Do not ask Codex to use every skill at once.

Bad:

```text
Use all skills and fix my repo.
```

Better:

```text
Use skills/codebase-onboarding/SKILL.md and agents/code-explorer.md.
First map the repo. Then recommend the smallest next step.
```

The catalog is a menu. Pick the useful items for the current job.

