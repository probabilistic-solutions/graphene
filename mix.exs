defmodule Graphene.MixProject do
  use Mix.Project

  def project do
    [
      app: :graphene,
      version: "0.1.0",
      elixir: "~> 1.14",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:phoenix, "~> 1.7.12"},
      {:phoenix_html, "~> 4.0"},
      {:phoenix_live_view, "~> 0.20.2"},
      {:gettext, "~> 0.20"},
      {:lib_combin, "~> 0.1.5"},
      # dev deps (e.g. for code gen)
      {:jason, "~> 1.2", only: :dev},
      # testing
      {:floki, ">= 0.30.0", only: :test},
      # stories
      {:tmp, "~> 0.2.0", only: :dev},
      {:phoenix_storybook, "~> 0.6.0", optional: true}
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to install project dependencies and perform other setup tasks, run:
  #
  #     $ mix setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      setup: ["deps.get", "assets.setup", "assets.build"],
      # building assets requires npm available in shell
      "assets.setup": [
        # download files to node_modules
        "cmd --cd assets yarn install --cache-folder .yarn/cache"
      ],
      "assets.clean": ["cmd rm -rf priv/static/assets"],
      "assets.build": [
        "assets.clean",
        # our build requires build.js where esbuild is limited in CLI
        "cmd --cd assets yarn build --outdir ../priv/static/assets"
      ],
      "assets.deploy": [
        "assets.clean",
        # same as build but digests the output
        "cmd --cd assets yarn build --outdir ../priv/static/assets --deploy"
      ]
    ]
  end
end
