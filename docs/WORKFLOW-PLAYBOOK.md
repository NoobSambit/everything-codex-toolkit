# Workflow Playbook

This guide shows which toolkit pieces to use for common jobs.

Use it when you know what you want to do, but you do not know which skill, agent, or prompt to choose.

## How To Read This Page

Each workflow has:

- Use when: the situation where it fits.
- Toolkit pieces: the files to ask Codex to use.
- Prompt: a practical prompt you can paste into Codex.
- Notes: what to watch for.

## 1. Understand A New Repository

Use when: you cloned a repo and do not know where things are.

Toolkit pieces:

- `skills/codebase-onboarding/SKILL.md`
- `skills/repo-scan/SKILL.md`
- `agents/code-explorer.md`
- `contexts/research.md`

Prompt:

```text
Use skills/codebase-onboarding/SKILL.md, skills/repo-scan/SKILL.md, agents/code-explorer.md, and contexts/research.md.
Map this repository. Explain the main folders, entry points, test commands, build commands, and risky areas. Do not edit files.
```

Notes:

- Ask for a map before asking for changes.
- If the repo is large, ask Codex to focus on one feature area.
- Good follow-up: "Now trace the request path for login" or "Now explain the payment module."

## 2. Plan A Feature

Use when: you have requirements but want a plan before edits.

Toolkit pieces:

- `prompts/plan.md`
- `agents/planner.md`
- `agents/code-architect.md`
- `skills/architecture-decision-records/SKILL.md` if the decision is important

Prompt:

```text
Use prompts/plan.md, agents/planner.md, and agents/code-architect.md.
Plan the feature described below. Inspect the repo first. Identify files to change, tests to add, risks, and open questions. Do not edit until I approve the plan.
```

Notes:

- Use `agents/architect.md` when the feature changes system structure.
- Use `skills/api-design/SKILL.md` if the feature adds or changes an API.
- Use `skills/database-migrations/SKILL.md` if schema changes are needed.

## 3. Build A Feature

Use when: the plan is clear and you want Codex to implement.

Toolkit pieces:

- `prompts/feature-dev.md`
- `skills/codebase-onboarding/SKILL.md`
- `skills/verification-loop/SKILL.md`
- stack-specific skill such as `skills/python-patterns/SKILL.md`, `skills/frontend-patterns/SKILL.md`, or `skills/golang-patterns/SKILL.md`

Prompt:

```text
Use prompts/feature-dev.md and skills/verification-loop/SKILL.md.
Implement the approved plan. Keep changes tightly scoped. Run the smallest relevant tests first, then broader checks if they are available.
```

Notes:

- Add the language skill that matches the repo.
- If UI is involved, add `skills/accessibility/SKILL.md` and `skills/browser-qa/SKILL.md`.
- If data model changes are involved, add `skills/database-migrations/SKILL.md`.

## 4. Fix A Bug

Use when: something is broken and you need a careful fix.

Toolkit pieces:

- `skills/tdd-workflow/SKILL.md`
- `skills/verification-loop/SKILL.md`
- `prompts/build-fix.md` if a build or test fails
- `agents/silent-failure-hunter.md` if the bug fails quietly

Prompt:

```text
Use skills/tdd-workflow/SKILL.md and skills/verification-loop/SKILL.md.
Reproduce the bug first. Add or identify a failing test. Make the smallest fix. Rerun the same test and report exactly what changed.
```

Notes:

- Do not start by rewriting surrounding code.
- If there is no test framework, ask Codex for the safest manual reproduction steps.
- Use language-specific testing skills when available.

## 5. TDD From Scratch

Use when: you want tests to drive implementation.

Toolkit pieces:

- `skills/tdd-workflow/SKILL.md`
- `agents/tdd-guide.md`
- language testing skill such as `skills/python-testing/SKILL.md`, `skills/rust-testing/SKILL.md`, or `skills/kotlin-testing/SKILL.md`

Prompt:

```text
Use skills/tdd-workflow/SKILL.md, agents/tdd-guide.md, and the matching language testing skill.
Follow RED, GREEN, REFACTOR. Show the failing test before editing production code.
```

Notes:

- TDD works best for contained behavior.
- For UI-only visual work, combine with `skills/browser-qa/SKILL.md`.

## 6. Code Review

Use when: you want Codex to review local changes.

Toolkit pieces:

- `prompts/code-review.md`
- `agents/code-reviewer.md`
- language reviewer such as `agents/typescript-reviewer.md`, `agents/python-reviewer.md`, or `agents/rust-reviewer.md`
- `skills/security-review/SKILL.md` for security-sensitive changes

Prompt:

```text
Use prompts/code-review.md and agents/code-reviewer.md.
Review my current git diff. Findings first, ordered by severity. Include file and line references. Focus on bugs, regressions, security, and missing tests.
```

Notes:

- A review is not a summary. Ask for findings first.
- Add a language reviewer when the stack matters.
- Add `agents/database-reviewer.md` for migrations or query changes.

## 7. Review A Pull Request

Use when: you want Codex to inspect a PR.

Toolkit pieces:

- `prompts/review-pr.md`
- `agents/pr-test-analyzer.md`
- `agents/code-reviewer.md`
- stack-specific reviewer

Prompt:

```text
Use prompts/review-pr.md, agents/code-reviewer.md, and agents/pr-test-analyzer.md.
Review this PR. Check the diff, tests, CI failures if available, and likely behavior regressions. Findings first.
```

Notes:

- If the PR is too large, ask Codex to review by area.
- If CI failed, start with `agents/pr-test-analyzer.md`.

## 8. Fix Build Errors

Use when: compile, typecheck, or test setup fails.

Toolkit pieces:

- `prompts/build-fix.md`
- `agents/build-error-resolver.md`
- language build resolver such as `agents/go-build-resolver.md`, `agents/rust-build-resolver.md`, or `agents/java-build-resolver.md`

Prompt:

```text
Use prompts/build-fix.md and agents/build-error-resolver.md.
Run the failing command, identify the first real error, fix the root cause, and rerun the same command.
```

Notes:

- Fix the first real error, not every downstream error.
- Do not silence errors unless the project explicitly expects that.

## 9. Refactor Safely

Use when: code works but needs cleanup.

Toolkit pieces:

- `prompts/refactor-clean.md`
- `agents/refactor-cleaner.md`
- `agents/code-simplifier.md`
- `skills/verification-loop/SKILL.md`

Prompt:

```text
Use prompts/refactor-clean.md, agents/refactor-cleaner.md, agents/code-simplifier.md, and skills/verification-loop/SKILL.md.
Refactor this area without changing behavior. Preserve public interfaces unless I approve a change. Run relevant tests before and after.
```

Notes:

- Ask Codex to explain expected behavior before editing.
- Keep refactors separate from feature work when possible.

## 10. Update Documentation

Use when: code changed and docs need to stay accurate.

Toolkit pieces:

- `prompts/update-docs.md`
- `agents/doc-updater.md`
- `skills/documentation-lookup/SKILL.md`
- `skills/article-writing/SKILL.md` if writing longer docs

Prompt:

```text
Use prompts/update-docs.md and agents/doc-updater.md.
Update docs affected by the current changes. Keep language simple. Do not invent behavior that is not in the code.
```

Notes:

- Docs should say what users need to do.
- Avoid marketing language in technical docs.

## 11. Security Review

Use when: auth, permissions, payments, secrets, files, network calls, user input, or data exposure are involved.

Toolkit pieces:

- `skills/security-review/SKILL.md`
- `agents/security-reviewer.md`
- `skills/django-security/SKILL.md`, `skills/laravel-security/SKILL.md`, `skills/springboot-security/SKILL.md`, or `skills/perl-security/SKILL.md` when relevant
- `skills/security-bounty-hunter/SKILL.md` for adversarial review

Prompt:

```text
Use skills/security-review/SKILL.md and agents/security-reviewer.md.
Review this change for exploitable issues. Focus on auth, authorization, injection, secrets, unsafe file access, data leakage, and missing tests.
```

Notes:

- Ask for concrete exploit paths, not vague risks.
- For healthcare data, add `skills/healthcare-phi-compliance/SKILL.md` or `skills/hipaa-compliance/SKILL.md`.

## 12. Frontend UI Work

Use when: you are building or changing a web UI.

Toolkit pieces:

- `skills/frontend-patterns/SKILL.md`
- `skills/design-system/SKILL.md`
- `skills/accessibility/SKILL.md`
- `skills/browser-qa/SKILL.md`
- `agents/a11y-architect.md`

Prompt:

```text
Use skills/frontend-patterns/SKILL.md, skills/design-system/SKILL.md, skills/accessibility/SKILL.md, and skills/browser-qa/SKILL.md.
Implement this UI change. Preserve existing design patterns unless I ask for a redesign. Verify keyboard, responsive, and basic accessibility behavior.
```

Notes:

- For Next.js performance or build issues, add `skills/nextjs-turbopack/SKILL.md`.
- For demos, add `skills/ui-demo/SKILL.md`.

## 13. Backend API Work

Use when: endpoints, services, validation, or backend behavior changes.

Toolkit pieces:

- `skills/api-design/SKILL.md`
- `skills/backend-patterns/SKILL.md`
- `skills/security-review/SKILL.md`
- framework skill such as `skills/django-patterns/SKILL.md`, `skills/nestjs-patterns/SKILL.md`, or `skills/springboot-patterns/SKILL.md`

Prompt:

```text
Use skills/api-design/SKILL.md, skills/backend-patterns/SKILL.md, and the matching framework skill.
Design and implement this API change. Include validation, error behavior, tests, and compatibility notes.
```

Notes:

- For database changes, add `skills/database-migrations/SKILL.md`.
- For auth-sensitive endpoints, add `agents/security-reviewer.md`.

## 14. Database And Migration Work

Use when: schemas, migrations, queries, indexes, or data integrity change.

Toolkit pieces:

- `skills/database-migrations/SKILL.md`
- `skills/postgres-patterns/SKILL.md` or `skills/clickhouse-io/SKILL.md`
- `agents/database-reviewer.md`

Prompt:

```text
Use skills/database-migrations/SKILL.md and agents/database-reviewer.md.
Review and implement this database change. Check rollback risk, data safety, indexes, query behavior, and tests.
```

Notes:

- Ask about production data volume before risky migrations.
- Never assume destructive migrations are safe.

## 15. Language-Specific Review

Use when: the stack has language-specific traps.

Toolkit pieces:

- `agents/python-reviewer.md`
- `agents/typescript-reviewer.md`
- `agents/rust-reviewer.md`
- `agents/go-reviewer.md`
- `agents/java-reviewer.md`
- `agents/kotlin-reviewer.md`
- `agents/cpp-reviewer.md`
- matching language skill under `skills/`

Prompt:

```text
Use agents/code-reviewer.md plus the matching language reviewer.
Review this diff for language-specific bugs, bad idioms, missing tests, and behavior regressions.
```

Notes:

- Pair reviewers with testing skills for better feedback.
- Example: Rust review should usually include ownership, errors, lifetimes, unsafe code, and tests.

## 16. AI Agent Or LLM System Work

Use when: you are building agents, evals, prompt systems, harnesses, or LLM workflows.

Toolkit pieces:

- `skills/agentic-engineering/SKILL.md`
- `skills/autonomous-agent-harness/SKILL.md`
- `skills/eval-harness/SKILL.md`
- `skills/agent-eval/SKILL.md`
- `skills/prompt-optimizer/SKILL.md`
- `agents/harness-optimizer.md`

Prompt:

```text
Use skills/agentic-engineering/SKILL.md, skills/eval-harness/SKILL.md, and agents/harness-optimizer.md.
Improve this LLM workflow. Define success criteria, failure modes, eval cases, and a verification loop before changing prompts.
```

Notes:

- Do not optimize prompts without test cases.
- Use `skills/ai-regression-testing/SKILL.md` to prevent prompt regressions.

## 17. Research Task

Use when: you need investigation before implementation.

Toolkit pieces:

- `skills/deep-research/SKILL.md`
- `skills/search-first/SKILL.md`
- `skills/iterative-retrieval/SKILL.md`
- `skills/research-ops/SKILL.md`
- `agents/docs-lookup.md`

Prompt:

```text
Use skills/search-first/SKILL.md, skills/deep-research/SKILL.md, and agents/docs-lookup.md.
Research this topic using primary sources where possible. Separate confirmed facts from assumptions. Give links or file references.
```

Notes:

- For current technical docs, prefer official docs.
- For repo-local facts, inspect files instead of guessing.

## 18. Open Source Release Or Fork Work

Use when: preparing a repo for public release, fork cleanup, packaging, or attribution.

Toolkit pieces:

- `skills/opensource-pipeline/SKILL.md`
- `agents/opensource-sanitizer.md`
- `agents/opensource-packager.md`
- `agents/opensource-forker.md`
- `skills/github-ops/SKILL.md`

Prompt:

```text
Use skills/opensource-pipeline/SKILL.md, agents/opensource-sanitizer.md, and agents/opensource-packager.md.
Prepare this repo for public GitHub use. Check attribution, secrets, docs, install path, license files, and obvious private references.
```

Notes:

- Do not remove attribution.
- Check `.env`, examples, history-sensitive docs, and config files.

## 19. Quality Gate Before Shipping

Use when: you want a final pass before merge or release.

Toolkit pieces:

- `prompts/quality-gate.md`
- `skills/verification-loop/SKILL.md`
- `agents/code-reviewer.md`
- `agents/security-reviewer.md`
- `agents/performance-optimizer.md` if performance matters

Prompt:

```text
Use prompts/quality-gate.md and skills/verification-loop/SKILL.md.
Run a final quality gate for this change. Check tests, lint, docs, security, migration risk, and unresolved TODOs.
```

Notes:

- Ask Codex to state what it could not verify.
- Do not accept "looks good" without command results or concrete review scope.

## 20. Choosing The Smallest Useful Set

If you are unsure, start with one prompt and one role.

Good defaults:

- Planning: `prompts/plan.md` plus `agents/planner.md`
- Implementation: `prompts/feature-dev.md` plus `skills/verification-loop/SKILL.md`
- Review: `prompts/code-review.md` plus `agents/code-reviewer.md`
- Bug fix: `skills/tdd-workflow/SKILL.md` plus `skills/verification-loop/SKILL.md`
- Repo analysis: `skills/repo-scan/SKILL.md` plus `agents/code-explorer.md`
- Docs: `prompts/update-docs.md` plus `agents/doc-updater.md`

Add more only when the task needs it.

