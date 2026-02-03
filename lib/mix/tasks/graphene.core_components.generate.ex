if Mix.env() == :dev do
  defmodule Mix.Tasks.Graphene.CoreComponents.Generate do
    use Mix.Task
    require Logger
    alias Jason

    defp template_core_components(:src) do
      Path.join(["assets", "eex", "graphene_core_components.ex"])
    end

    defp template_core_components(:dst) do
      Path.join(["lib", "graphene", "core_components.ex"])
    end

    defp template_js_mapping(:src) do
      Path.join(["assets", "eex", "dynamic_loader_mapping.ts"])
    end

    defp template_js_mapping(:dst) do
      Path.join(["assets", "src", "lib", "_dynamic_loader_mapping.ts"])
    end

    defp module() do
      "Graphene.CoreComponents"
    end

    def components_json_path() do
      Path.join(["assets", "node_modules", "@carbon", "web-components", "custom-elements.json"])
    end

    def get_components_json() do
      components_json_path() |> File.read!() |> Jason.decode!() |> Map.fetch!("tags")
    end

    def get_version() do
      Path.join(["assets", "node_modules", "@carbon", "web-components", "package.json"])
      |> File.read!()
      |> Jason.decode!()
      |> Map.fetch!("version")
    end

    def get_components() do
      get_components_json()
      |> Stream.map(&Graphene.CodeGen.Component.parse(&1, "cds-"))
      |> Stream.map(&Graphene.CodeGen.ComponentPatches.patch/1)
      |> Enum.sort(fn a, b -> a.componentname < b.componentname end)
    end

    @impl true
    def run(_args \\ []) do
      Logger.debug("Running #{__MODULE__}")
      components = get_components()

      Mix.Generator.copy_template(
        template_core_components(:src),
        template_core_components(:dst),
        [
          version: get_version(),
          module: module(),
          components: components,
          source: components_json_path()
        ],
        force: true
      )

      Mix.Generator.copy_template(
        template_js_mapping(:src),
        template_js_mapping(:dst),
        [
          version: get_version(),
          module: module(),
          components: components,
          source: components_json_path()
        ],
        force: true
      )

      Mix.Task.run("format", [template_core_components(:dst)])
      Logger.debug("Added #{length(components)} components")
    end
  end
end
