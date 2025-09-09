if Mix.env() == :dev do
  defmodule Mix.Tasks.Graphene.Stories.Generate do
    use Mix.Task
    require Logger

    defp template_story(:src) do
      Path.join(["assets", "eex", "graphene_component_story.exs"])
    end

    defp template_story(:dst, base, name) do
      Path.join([base, "#{name}.story.exs"])
    end

    defp storybook_location(folder) do
      Path.join(["priv", "storybook", "generated", folder])
    end

    @impl true
    def run(_args \\ []) do
      Logger.debug("Running #{__MODULE__}")

      Tmp.dir(fn path ->
        for name <- Map.keys(Graphene.CoreComponents.__components__()) do
          Mix.Generator.copy_template(
            template_story(:src),
            template_story(:dst, path, name),
            component: to_string(name),
            module: "CoreComponents"
          )
        end

        Logger.debug("Generation complete, finishing transaction")
        File.rm_rf!(storybook_location("core"))
        File.mkdir_p!(storybook_location("core"))
        File.cp_r(path, storybook_location("core"))
      end)
    end
  end
end
