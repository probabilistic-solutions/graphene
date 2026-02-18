defmodule Graphene.CodeGen.Metadata do
  @moduledoc false

  alias Jason

  @metadata_path Path.join(["assets", "codegen", "carbon_metadata.json"])
  @custom_elements_path Path.join([
                          "assets",
                          "node_modules",
                          "@carbon",
                          "web-components",
                          "custom-elements.json"
                        ])
  @package_json_path Path.join([
                       "assets",
                       "node_modules",
                       "@carbon",
                       "web-components",
                       "package.json"
                     ])
  @defs_glob Path.join([
               "assets",
               "node_modules",
               "@carbon",
               "web-components",
               "es",
               "**",
               "defs.d.ts"
             ])

  @enum_regex ~r/export\s+(?:declare\s+)?enum\s+(\w+)\s*{([^}]*)}/ms
  @type_regex ~r/export\s+(?:declare\s+)?type\s+(\w+)\s*=\s*([^;]+);/m
  @string_literal_regex ~r/["']([^"']*)["']/

  @cache_key {__MODULE__, :metadata}

  def metadata_path, do: @metadata_path

  def source_custom_elements_path, do: @custom_elements_path
  def source_package_json_path, do: @package_json_path
  def source_defs_glob, do: @defs_glob

  def load! do
    case load_optional() do
      {:ok, metadata} -> metadata
      :error -> raise "Missing #{metadata_path()}; run `mix graphene.codegen.extract` first."
    end
  end

  def load_or_extract! do
    case load_optional() do
      {:ok, metadata} -> metadata
      :error -> extract!()
    end
  end

  def load_cached do
    case :persistent_term.get(@cache_key, :missing) do
      :missing ->
        metadata = load_or_extract!()
        :persistent_term.put(@cache_key, metadata)
        metadata

      metadata ->
        metadata
    end
  end

  def extract! do
    tags = read_custom_elements()
    version = read_version()
    types = extract_types()

    metadata = %{
      "version" => version,
      "source" => source_custom_elements_path(),
      "tags" => tags,
      "types" => types,
      "generated_at" => DateTime.utc_now() |> DateTime.to_iso8601()
    }

    File.mkdir_p!(Path.dirname(metadata_path()))
    File.write!(metadata_path(), Jason.encode!(metadata, pretty: true))
    :persistent_term.put(@cache_key, metadata)

    metadata
  end

  def version do
    load_cached() |> Map.fetch!("version")
  end

  def source do
    load_cached() |> Map.fetch!("source")
  end

  def tags do
    load_cached() |> Map.fetch!("tags")
  end

  def type_values do
    load_cached() |> Map.get("types", %{})
  end

  def components do
    tags()
    |> Stream.map(&Graphene.CodeGen.Component.parse(&1, "cds-"))
    |> Stream.map(&Graphene.CodeGen.ComponentPatches.patch/1)
    |> Enum.to_list()
    |> Graphene.CodeGen.ComponentPatches.append_missing_components()
    |> Enum.sort(fn a, b -> a.componentname < b.componentname end)
  end

  def components_map(components) do
    components
    |> Map.new(fn component ->
      {String.to_atom(component.componentname), %{attrs: component.attrs, slots: component.slots}}
    end)
  end

  defp load_optional do
    path = metadata_path()

    if File.exists?(path) do
      {:ok, Jason.decode!(File.read!(path))}
    else
      :error
    end
  end

  defp read_custom_elements do
    @custom_elements_path
    |> File.read!()
    |> Jason.decode!()
    |> Map.fetch!("tags")
  end

  defp read_version do
    @package_json_path
    |> File.read!()
    |> Jason.decode!()
    |> Map.fetch!("version")
  end

  defp extract_types do
    @defs_glob
    |> Path.wildcard()
    |> Enum.reduce(%{}, fn path, acc ->
      content = File.read!(path)

      acc
      |> merge_type_blocks(parse_enum_blocks(content))
      |> merge_type_blocks(parse_type_blocks(content))
    end)
    |> Enum.into(%{}, fn {name, values} -> {name, Enum.uniq(values)} end)
  end

  defp parse_enum_blocks(content) do
    Regex.scan(@enum_regex, content)
    |> Enum.map(fn [_, name, body] -> {name, extract_string_literals(body)} end)
    |> Enum.reject(fn {_name, values} -> values == [] end)
  end

  defp parse_type_blocks(content) do
    Regex.scan(@type_regex, content)
    |> Enum.map(fn [_, name, body] -> {name, extract_string_literals(body)} end)
    |> Enum.reject(fn {_name, values} -> values == [] end)
  end

  defp extract_string_literals(content) do
    Regex.scan(@string_literal_regex, content)
    |> Enum.map(fn [_, value] -> value end)
  end

  defp merge_type_blocks(acc, blocks) do
    Enum.reduce(blocks, acc, fn {name, values}, acc ->
      Map.update(acc, name, values, fn existing -> existing ++ values end)
    end)
  end
end
