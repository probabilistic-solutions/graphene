# Repository Guidelines

## Project Structure & Module Organization
- `lib/graphene/` holds the core library (components, SVG helpers, codegen). Mix tasks live in `lib/mix/tasks/`.
- `assets/` contains TypeScript sources, build scripts, and EEx templates used for generation.
- `priv/static/` stores built assets; `priv/storybook/` contains story definitions, with `priv/storybook/generated/` produced by codegen.
- `demo/` is a Phoenix app showcasing Graphene (`demo/lib/`, `demo/assets/`, `demo/config/`).
- Tests live in `test/` for the library and `demo/test/` for the demo app.

## Build, Test, and Development Commands
- `mix deps.get` installs Elixir dependencies.
- `mix setup` installs deps and builds library assets (root project).
- `mix assets.build` rebuilds assets into `priv/static/assets/`.
- `cd demo && mix setup` prepares the demo app.
- `cd demo && mix phx.server` runs the demo app at `http://localhost:4000`.
- `mix test` (root) and `cd demo && mix test` (demo) run ExUnit tests.
- Optional generation (dev only): `mix graphene.icons.generate`, `mix graphene.core_components.generate`, `mix graphene.stories.generate` to refresh generated outputs.

## Coding Style & Naming Conventions
- Format with `mix format` (configured by `.formatter.exs` and LiveView HTML formatter).
- Follow standard Elixir 2‑space indentation and module naming (`Graphene.*`, `Demo.*`).
- Tests use `*_test.exs` naming.
- TypeScript files in `assets/src/` follow existing snake_case file naming.

## Testing Guidelines
- Framework: ExUnit.
- Keep unit tests focused on codegen outputs and component behavior.
- Run root tests for library changes; include demo tests when touching demo code.

## Commit & Pull Request Guidelines
- Commit subjects in history are short, lowercase, imperative (e.g., `fix deps`, `update to 2.47.0`); keep messages concise.
- PRs should summarize changes, list commands run, and call out regenerated files (for example `priv/storybook/generated/` or `priv/static/assets/`).
- Include screenshots for demo UI changes when applicable.

## Environment & Configuration
- `.envrc` opts into Nix; use `nix-shell` if you want a reproducible toolchain.
- Asset builds require Node + Yarn; demo assets use the `demo/assets` build script.
