import Config

config :esbuild,
  version: "0.20.2",
  graphene: [
    args: ~w(
      src/index.ts
      src/graphene.css
      --bundle
      --target=es2017
      --format=esm
      --outdir=../priv/static/assets
      --loader:.woff=file
      --loader:.woff2=file
    ),
    cd: Path.expand("../assets", __DIR__)
  ],
  graphene_prod: [
    args: ~w(
      src/index.ts
      src/graphene.css
      --bundle
      --target=es2017
      --format=esm
      --outdir=../priv/static/assets
      --loader:.woff=file
      --loader:.woff2=file
      --splitting
    ),
    cd: Path.expand("../assets", __DIR__)
  ]
