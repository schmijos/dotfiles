---
name: rails
description: Conventions for writing and changing code in Ruby on Rails apps (Rails Omakase, generators, no premature abstraction, Hotwire, Minitest). Use whenever working in a Rails project.
---

# Rails

## Follow Rails conventions and idioms

Code should follow the Rails Omakase philosophy.
Use the defaults, conventions, and patterns that Rails provides.
Don't reinvent what Rails already gives you.
Prefer convention over configuration.
If Rails has an opinion about how something should be done, follow it.
Code should be clean, readable, and well-organized.
Use the Rubocop Rails Omakase style guide as the baseline.
Consider all locales.

## Use Rails generators, preferring complete resources

Use `rails generate` rather than hand-writing files.
Prefer `rails g scaffold` or `rails g resource` over generating individual models, controllers, and migrations separately.
Only use more granular generators when it genuinely makes sense, such as adding a migration to an existing table or creating a controller that isn't a standard CRUD resource.

## Avoid abstraction until it's earned

Don't introduce service objects, form objects, decorators, or other abstraction layers by default.
Put logic in models, organized with concerns when sharing is needed.
Extract abstractions only when a concrete, recurring need has emerged — not in anticipation of one. Rule of Three.
Rails already provides the right abstractions; use them.
Keep complexity low by rarely using optional keyword arguments, guard clauses and nil-checks; a raised exception is often better than premature safeguards.

## Use Hotwire; avoid heavy JavaScript

Use Turbo Drive, Turbo Frames, and Turbo Streams for interactivity.
Use Stimulus for small, scoped JavaScript behaviors.
Keep controllers RESTful.
Don't reach for React, Vue, or other JS frameworks unless there is a compelling reason that Hotwire genuinely cannot address.

## Comprehensive testing at all levels

Everything must be tested.
Start with a system test that exercises the feature from a user's perspective.
Then add tests at other levels as appropriate (model, controller, integration).
Use Minitest.
Use Mocha for mocking and stubbing.
All tests must pass before starting a new task.
All tests must pass before a task is considered complete.
