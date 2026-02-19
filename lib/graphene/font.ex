defmodule Graphene.Font do
  @moduledoc """
  Helpers for referencing vendored IBM Plex font assets.

  The Graphene asset bundle ships IBM Plex fonts inside
  `priv/static/assets`. This module lets you look up the hashed font file
  names without hardcoding them.
  """

  @type style :: String.t() | atom
  @type variant :: String.t() | atom | nil

  @cache_key {__MODULE__, :font_files}

  @doc """
  Returns the public path for a font file.

  The `style` is a font style like `"Italic"`, `"Regular"`, `"SemiBold"`,
  or `"SemiBoldItalic"`. If the style does not specify a family, IBM Plex
  Sans is assumed.

  Optionally pass a `variant` (e.g. `"Latin1"`, `"Cyrillic"`, `"Greek"`).
  If omitted, the default (non-variant) file is selected when available.

  ## Examples

      Graphene.Font.path("Italic")
      Graphene.Font.path("Italic", "Latin1")
      Graphene.Font.path("Mono Italic")
  """
  @spec path(style, variant) :: String.t() | nil
  def path(style, variant \\ nil) do
    with {:ok, files} <- font_files() do
      {family, style_key} = parse_family_style(style, files)
      variant_key = normalize_variant(variant)
      prefix = "ibmplex#{family}-#{style_key}"

      candidates =
        files
        |> Enum.map(fn file -> {String.downcase(file), file} end)
        |> Enum.filter(fn {downcase, _file} -> String.starts_with?(downcase, prefix <> "-") end)
        |> Enum.map(fn {_downcase, file} -> file end)

      choose_candidate(candidates, prefix, variant_key)
    else
      _ -> nil
    end
  end

  defp font_files do
    case :persistent_term.get(@cache_key, nil) do
      nil ->
        case :code.priv_dir(:graphene) do
          {:error, _reason} ->
            {:error, :missing_priv}

          priv_dir ->
            assets_dir = Path.join([priv_dir, "static", "assets"])

            files =
              assets_dir
              |> File.ls!()
              |> Enum.filter(&String.starts_with?(&1, "IBMPlex"))
              |> Enum.filter(&String.ends_with?(&1, ".woff2"))

            :persistent_term.put(@cache_key, files)
            {:ok, files}
        end

      files ->
        {:ok, files}
    end
  rescue
    _error -> {:error, :missing_assets}
  end

  defp parse_family_style(style, files) do
    style_string = normalize_string(style)
    families = font_families(files)

    {family, remainder} =
      Enum.find_value(families, {default_family(), style_string}, fn family_name ->
        family_key = normalize_key(family_name)

        if String.starts_with?(normalize_key(style_string), family_key) do
          remainder =
            style_string
            |> String.replace(~r/^#{Regex.escape(family_name)}/i, "")
            |> String.trim()

          {family_key, remainder}
        else
          nil
        end
      end)

    style_key =
      case normalize_key(remainder) do
        "" -> "regular"
        value -> value
      end

    {family, style_key}
  end

  defp default_family, do: "sans"

  defp font_families(files) do
    families =
      files
      |> Enum.map(fn file ->
        case String.split(file, "-", parts: 2) do
          ["IBMPlex" <> family, _rest] -> family
          _ -> nil
        end
      end)
      |> Enum.reject(&is_nil/1)
      |> Enum.uniq()

    families
    |> Enum.sort_by(&String.length/1, :desc)
  end

  defp normalize_string(value) when is_atom(value), do: Atom.to_string(value)
  defp normalize_string(value) when is_binary(value), do: value
  defp normalize_string(value), do: to_string(value)

  defp normalize_key(value) do
    value
    |> normalize_string()
    |> String.replace(~r/[\s_-]+/u, "")
    |> String.downcase()
  end

  defp normalize_variant(nil), do: nil
  defp normalize_variant(value), do: normalize_key(value)

  defp choose_candidate([], _prefix, _variant), do: nil

  defp choose_candidate(candidates, prefix, variant_key) do
    parsed =
      candidates
      |> Enum.map(&parse_candidate(&1, prefix))
      |> Enum.reject(&is_nil/1)

    selected =
      case variant_key do
        nil ->
          Enum.find(parsed, fn %{variant: variant} -> variant == nil end) ||
            List.first(parsed)

        _ ->
          Enum.find(parsed, fn %{variant: variant} -> variant == variant_key end) ||
            Enum.find(parsed, fn %{variant: variant} -> variant == nil end) ||
            List.first(parsed)
      end

    case selected do
      nil -> nil
      %{file: file} -> "/graphene/assets/#{file}"
    end
  end

  defp parse_candidate(file, prefix) do
    downcase = String.downcase(file)

    with true <- String.starts_with?(downcase, prefix <> "-") do
      remainder =
        downcase
        |> String.replace_prefix(prefix <> "-", "")
        |> String.replace_suffix(".woff2", "")

      segments = String.split(remainder, "-", trim: true)

      variant =
        case segments do
          [hash] when byte_size(hash) > 0 -> nil
          [variant, _hash | _rest] -> variant
          _ -> nil
        end

      %{file: file, variant: variant}
    else
      _ -> nil
    end
  end
end
