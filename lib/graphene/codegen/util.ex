defmodule Graphene.CodeGen.Util do
  @camel_to_snake ~r/(?<=[a-z0-9])(?=[A-Z])/
  @snake_or_kebab_to_camel ~r/(?:_|-)(.)/
  @camel_to_kebab ~r/(?<=[a-z0-9])(?=[A-Z])/

  def snake2kebab(name) do
    String.replace(name, "_", "-") |> String.downcase()
  end

  def kebab2camel(name) do
    name
    |> String.replace(@snake_or_kebab_to_camel, fn
      "-" <> c -> String.upcase(c)
    end)
  end

  def camel2snake(name) do
    name
    |> String.replace(@camel_to_snake, "_\\0")
    |> String.downcase()
  end

  def camel2kebab(name) do
    Regex.replace(@camel_to_kebab, name, "\\0-") |> String.downcase() |> String.trim_trailing("-")
  end

  def kebab2snake(name) do
    String.replace(name, "-", "_")
  end

  def snake2camel(name) do
    name
    |> String.replace("_", "-")
    |> kebab2camel
  end

  def snake2pascal(name) do
    name
    |> snake2camel
    |> String.capitalize()
  end

  def atom_repr(name) when is_binary(name) do
    if String.contains?(name, "-") do
      ":\"#{name}\""
    else
      ":#{name}"
    end
  end
end
