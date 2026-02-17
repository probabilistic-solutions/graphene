if Mix.env() == :dev do
  defmodule Mix.Tasks.Graphene.CarbonComponents.Generate do
    use Mix.Task
    require Logger

    defp template(:src) do
      Path.join(["assets", "eex", "graphene_carbon_components.ex"])
    end

    defp template(:dst) do
      Path.join(["lib", "graphene", "carbon_components.ex"])
    end

    defp custom_template(:src) do
      Path.join(["assets", "eex", "graphene_carbon_components_custom.ex"])
    end

    defp module_name do
      "Graphene.CarbonComponents"
    end

    defp components do
      Graphene.CoreComponents.__components__()
    end

    defp docs_map do
      case Code.fetch_docs(Graphene.CoreComponents) do
        {:docs_v1, _, _, _, _, _, docs} ->
          for {{:function, name, 1}, _, _, doc, _} <- docs, into: %{} do
            doc_text =
              case doc do
                %{"en" => text} when is_binary(text) -> text
                :hidden -> nil
                :none -> nil
                _ -> nil
              end

            {name, doc_text}
          end

        _ ->
          %{}
      end
    end

    defp render_template(path, assigns) do
      EEx.eval_file(path, assigns: assigns)
    end

    defp compile_generated!(path, mod) do
      content = File.read!(path)
      module_decl = "defmodule #{mod} do"
      check_module = "#{mod}.GeneratedCheck"

      content =
        if String.contains?(content, module_decl) do
          String.replace(content, module_decl, "defmodule #{check_module} do", global: false)
        else
          raise "Expected #{module_decl} in generated output"
        end

      Code.compile_string(content, path)
      :ok
    end

    defp opt_string([]), do: nil

    defp opt_string(opts) do
      opts
      |> Enum.map(fn {k, v} ->
        value = inspect(v, pretty: true, limit: :infinity)
        "#{k}: #{value}"
      end)
      |> Enum.join(", ")
    end

    defp atom_name(atom) do
      name = Atom.to_string(atom)

      if Regex.match?(~r/^[a-z_][a-zA-Z0-9_]*$/, name) do
        ":#{name}"
      else
        ":\"#{name}\""
      end
    end

    defp build_attr(attr) do
      opts =
        []
        |> maybe_add_opt(:default, Keyword.get(attr.opts, :default))
        |> maybe_add_opt(:values, Keyword.get(attr.opts, :values))
        |> maybe_add_opt(:required, attr.required)
        |> maybe_add_opt(:doc, attr.doc)

      opt_str = opt_string(opts)
      name = atom_name(attr.name)

      if opt_str do
        "  attr #{name}, :#{attr.type}, #{opt_str}\n"
      else
        "  attr #{name}, :#{attr.type}\n"
      end
    end

    defp build_slot(slot) do
      slot_opts =
        []
        |> maybe_add_opt(:required, slot.required)
        |> maybe_add_opt(:doc, slot.doc)

      slot_opt_str = opt_string(slot_opts)
      name = atom_name(slot.name)

      header =
        if slot_opt_str do
          "  slot #{name}, #{slot_opt_str}"
        else
          "  slot #{name}"
        end

      if slot.attrs == [] do
        header <> "\n"
      else
        attrs =
          slot.attrs
          |> Enum.map(fn attr ->
            opts =
              []
              |> maybe_add_opt(:values, Keyword.get(attr.opts, :values))
              |> maybe_add_opt(:required, attr.required)
              |> maybe_add_opt(:doc, attr.doc)

            opt_str = opt_string(opts)
            attr_name = atom_name(attr.name)

            if opt_str do
              "    attr #{attr_name}, :#{attr.type}, #{opt_str}\n"
            else
              "    attr #{attr_name}, :#{attr.type}\n"
            end
          end)
          |> Enum.join("")

        header <> " do\n" <> attrs <> "  end\n"
      end
    end

    defp maybe_add_opt(opts, _key, nil), do: opts
    defp maybe_add_opt(opts, _key, false), do: opts
    defp maybe_add_opt(opts, _key, []), do: opts
    defp maybe_add_opt(opts, key, value), do: Keyword.put(opts, key, value)

    defp indent_doc(doc) do
      doc
      |> String.split("\n")
      |> Enum.map(&"  #{&1}")
      |> Enum.join("\n")
    end

    defp render_component(name, component, doc) do
      doc_str =
        if is_binary(doc) do
          "  @doc \"\"\"\n" <> indent_doc(doc) <> "\n  \"\"\"\n"
        else
          "  @doc \"See Graphene.CoreComponents.#{name}/1.\"\n"
        end

      attrs = component.attrs |> Enum.map(&build_attr/1) |> Enum.join("")
      slots = component.slots |> Enum.map(&build_slot/1) |> Enum.join("")

      doc_str <> attrs <> slots <>
        "  def #{name}(assigns) do\n" <>
        "    CoreComponents.#{name}(assigns)\n" <>
        "  end\n\n"
    end

    defp render_wrappers do
      docs = docs_map()

      components()
      |> Map.keys()
      |> Enum.sort()
      |> Enum.map(fn name ->
        component = Map.fetch!(components(), name)
        doc = Map.get(docs, name)
        render_component(name, component, doc)
      end)
      |> Enum.join("\n")
    end

    @impl true
    def run(_args \\ []) do
      Logger.debug("Running #{__MODULE__}")

      wrappers = render_wrappers()
      custom_components = File.read!(custom_template(:src))

      assigns = [module: module_name(), wrappers: wrappers, custom_components: custom_components]
      tmp_dir = Path.join(System.tmp_dir!(), "graphene-carbon-#{System.unique_integer([:positive])}")
      File.mkdir_p!(tmp_dir)
      tmp_out = Path.join(tmp_dir, "carbon_components.ex")

      File.write!(tmp_out, render_template(template(:src), assigns))

      Mix.Task.reenable("format")
      Mix.Task.run("format", [tmp_out])

      compile_generated!(tmp_out, module_name())

      File.mkdir_p!(Path.dirname(template(:dst)))
      File.cp!(tmp_out, template(:dst))

      Logger.debug("Added #{map_size(components())} components")
    end
  end
end
