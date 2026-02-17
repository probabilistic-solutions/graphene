# Demo

Phoenix app used to exercise Graphene components, including the Storybook examples.

## Setup

```sh
mix setup
```

## Storybook

Run the demo app and visit the storybook:

```sh
mix phx.server
```

Storybook is served at `http://localhost:4000/`.

## E2E / Storybook tests (Wallaby)

Storybook feature tests live in `demo/test/storybook_rendering_test.exs`. Table
interactivity tests live in `demo/test/table_interactivity_feature_test.exs` and
exercise selection, select-all, and sort wiring in the `/basic_components/table/interactivity`
story.

Wallaby tests are enabled when Chrome and Chromedriver are available. You can
provide explicit binaries via:

```sh
export CHROME_BIN=/path/to/chrome
export CHROMEDRIVER_BIN=/path/to/chromedriver
```

Build Storybook assets for the browser tests:

```sh
mix assets.build
```

Run only the browser tests:

```sh
mix test --only wallaby
```

Run the full demo test suite (browser tests are skipped if Chrome is missing):

```sh
mix test
```
