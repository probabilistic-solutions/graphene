defmodule Graphene.Docs.StorybookCarbon do
  @moduledoc false

  @story_globs [
    Path.join(["priv", "storybook", "carbon_components", "*.story.exs"]),
    Path.join(["priv", "storybook", "carbon_components", "**", "*.story.exs"])
  ]

  @function_regex ~r/def\s+function,\s+do:\s*&Graphene\.CarbonComponents\.([a-zA-Z0-9_]+)\/1/
  @module_regex ~r/defmodule\s+([A-Za-z0-9_.]+)\s+do/
  @variation_regex ~r/%Variation\{[^}]*?\bid:\s*(:[a-zA-Z0-9_!?-]+|"[^"]+")/s
  @variation_group_regex ~r/%VariationGroup\{[^}]*?\bid:\s*(:[a-zA-Z0-9_!?-]+|"[^"]+")/s

  def generate_markdown do
    entries =
      story_files()
      |> Enum.map(&parse_story_file/1)
      |> Enum.reject(&is_nil/1)
      |> Enum.group_by(& &1.component)
      |> Enum.sort_by(fn {component, _} -> component end)

    lines =
      [
        "## Carbon Components Storybook Reference",
        "",
        "_Generated from `priv/storybook/carbon_components`._",
        ""
      ] ++
        Enum.flat_map(entries, fn {component, stories} ->
          [
            "### `#{component}`",
            ""
          ] ++
            Enum.flat_map(Enum.sort_by(stories, & &1.module), fn story ->
              variation_lines = format_variations(story.variations)
              group_lines = format_variations(story.variation_groups, "Variation groups")

              [
                "- `#{story.module}` (#{story.path})"
              ] ++
                variation_lines ++
                group_lines ++
                [""]
            end)
        end)

    (Enum.join(lines, "\n") |> String.trim_trailing()) <> "\n"
  end

  defp story_files do
    @story_globs
    |> Enum.flat_map(&Path.wildcard/1)
    |> Enum.uniq()
    |> Enum.sort()
  end

  defp parse_story_file(path) do
    content = File.read!(path)

    component =
      case Regex.run(@function_regex, content) do
        [_, name] -> name
        _ -> component_from_path(path)
      end

    module =
      case Regex.run(@module_regex, content) do
        [_, name] -> name
        _ -> Path.basename(path, ".story.exs")
      end

    %{
      component: component,
      module: module,
      path: path,
      variations: extract_ids(@variation_regex, content),
      variation_groups: extract_ids(@variation_group_regex, content)
    }
  end

  defp component_from_path(path) do
    parts = Path.split(path)

    case Enum.drop_while(parts, &(&1 != "carbon_components")) do
      ["carbon_components", file] ->
        Path.basename(file, ".story.exs")

      ["carbon_components", component_dir | _] ->
        component_dir

      _ ->
        Path.basename(path, ".story.exs")
    end
  end

  defp extract_ids(regex, content) do
    Regex.scan(regex, content, capture: :all_but_first)
    |> List.flatten()
    |> Enum.map(&normalize_id/1)
    |> Enum.reject(&(&1 == ""))
    |> Enum.uniq()
  end

  defp normalize_id(id) do
    id
    |> String.trim()
    |> String.trim_trailing(",")
    |> String.trim_trailing(")")
    |> String.trim_leading(":")
    |> String.trim(~s("))
  end

  defp format_variations(variations, label \\ "Variations")
  defp format_variations([], _label), do: []

  defp format_variations(variations, label) do
    [
      "  - #{label}: #{Enum.join(variations, ", ")}"
    ]
  end
end
