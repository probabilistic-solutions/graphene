if Mix.env() == :dev do
  defmodule Mix.Tasks.Graphene.Docs.Generate do
    use Mix.Task
    require Logger

    @moduledoc false

    @marker_start "  <!-- STORYBOOK_DOCS:START -->"
    @marker_end "  <!-- STORYBOOK_DOCS:END -->"

    @impl true
    def run(_args \\ []) do
      Logger.debug("Running #{__MODULE__}")

      markdown = Graphene.Docs.StorybookCarbon.generate_markdown(indent: 2)
      update_graphene_moduledoc!(markdown)
    end

    defp update_graphene_moduledoc!(markdown) do
      path = Path.join(["lib", "graphene.ex"])
      content = File.read!(path)

      {before, rest} = split!(content, @marker_start)
      {_old, tail} = split!(rest, @marker_end)

      updated =
        before <>
          @marker_start <>
          "\n\n" <>
          markdown <>
          "\n" <>
          @marker_end <>
          tail

      File.write!(path, updated)
    end

    defp split!(content, marker) do
      case String.split(content, marker, parts: 2) do
        [before, tail] -> {before, tail}
        _ -> raise "Expected marker #{marker} in lib/graphene.ex"
      end
    end
  end
end
