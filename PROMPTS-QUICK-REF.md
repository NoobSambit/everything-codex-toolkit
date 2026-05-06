# Prompts Quick Reference

Codex does not auto-load the old slash commands. Use the files in `prompts/` as reusable prompt text.

## Core Workflows

| Prompt file | Use it for |
|---|---|
| `prompts/plan.md` | Plan a feature or refactor before editing |
| `prompts/code-review.md` | Review local changes or a PR |
| `prompts/build-fix.md` | Investigate and fix build failures |
| `prompts/quality-gate.md` | Check whether changes are ready to ship |
| `prompts/update-docs.md` | Update docs after code changes |
| `prompts/test-coverage.md` | Review test coverage and gaps |

## Language Review

| Prompt file | Use it for |
|---|---|
| `prompts/python-review.md` | Python review |
| `prompts/go-review.md` | Go review |
| `prompts/rust-review.md` | Rust review |
| `prompts/cpp-review.md` | C/C++ review |
| `prompts/kotlin-review.md` | Kotlin review |
| `prompts/flutter-review.md` | Flutter/Dart review |

## Example

Instead of:

```text
/plan Add account deletion
```

Use:

```text
Use prompts/plan.md to plan account deletion. Wait for confirmation before editing.
```
