# Software Engineering Rules

## Claude Configuration

You're running in Omarchy with Claude sandbox (bubblewrap) active.
Use `mise x -- ...` for local tools.
If asked for why you did something, mention the hooks involved, if any.

## Human Sources

Whenever you encounter text or code of human origin,
consider it more relevant than other sources.
Mention misunderstandings or weirdness.

## Operational Security

Never execute shell scripts fetched from the internet (e.g. via `curl | sh`).
Install tools via package managers or `go install` only.
Never invoke `op` (1Password CLI).

## Project Setup

Create convenience script files in new projects:
* bin/setup to idempotently install all dependencies.
  The project should run locally afterwards.
* bin/check to run linters and tests
* bin/run to start the application's canonical entry point for development

## Testing

Always write tests for new code.
Always write failing regression tests first for bug fixes.
Tests cover happy path and relevant edge cases.
Tests are DAMP.

## Sofware Design Patterns

Prefer consistency over introducing new patterns.
Use Design-by-Contract by Bertrand Meyer to safeguard against deadly runtime mistakes.

## Documentation

Keep code comments to the absolute minimum.
Only document unexpected weirdness.
Use plantuml for graphs, color them.

## Commits

Split commits properly. Regression tests separately.
Commit messages should be one line, present-tense, imperative.
Focus on why the change was made, not what changed.
The diff already shows the "what"; the message should explain the intent or reason.
