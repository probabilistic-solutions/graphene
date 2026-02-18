# Graphene

Graphene is a Phoenix component library built on Carbon Web Components. It ships
Elixir components plus a small JS package that wires up hooks and lazy-loads web
components on demand.

## Install in a Phoenix app

1) Add the Elixir dependency:

```elixir
defp deps do
  [
    {:graphene, "~> 2.47.0"}
  ]
end
```

2) Add the JS dependency (and explicit style/font deps) in `assets/package.json`:

```json
{
  "dependencies": {
    "@carbon/styles": "^1.100.0",
    "@ibm/plex": "^6.4.1",
    "graphene": "file:../deps/graphene/assets"
  }
}
```

3) Install JS deps:

```sh
npm install --prefix assets
```

4) Wire Graphene into your LiveView entrypoint (`assets/js/app.js` or `assets/js/app.ts`):

```ts
import { WebComponentManager, Hooks, mergeWebComponentsAttrs } from "graphene";
import { LiveSocket } from "phoenix_live_view";
import { Socket } from "phoenix";

const componentManager = new WebComponentManager();
componentManager.connect();

const liveSocket = new LiveSocket("/live", Socket, {
  hooks: Hooks,
  dom: { onBeforeElUpdated: mergeWebComponentsAttrs }
});

liveSocket.connect();
```

5) Expose Graphene components in your app:

```elixir
defmodule MyAppWeb.Components do
  use Phoenix.Component
  use Graphene.Components
end
```

Notes:
- Add Carbon + IBM Plex to your stylesheet (for example in `assets/css/app.scss`), as above.
- Import Carbon + IBM Plex explicitly in your app stylesheet:
  - CSS: `@import "@ibm/plex/css/ibm-plex.css";`
  - Sass: `@use "@carbon/styles/scss/theme";` / `@use "@carbon/styles/scss/themes";` and `@import "@carbon/styles/scss/reset";`
- When developing this repo locally (the `demo` app), use `graphene: "file:../../assets"` in `demo/assets/package.json`.

## Development (this repo)

- `mix setup`
- `mix assets.build`
- `cd demo && mix setup`
