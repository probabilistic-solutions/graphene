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

    defp carbon_component_overrides do
      Graphene.CodeGen.ComponentPatches.carbon_component_overrides()
    end

    defp carbon_component_recipes do
      Graphene.CodeGen.ComponentPatches.carbon_component_recipes()
    end

    defp form_delegate_names do
      if Code.ensure_loaded?(Graphene.FormComponents) do
        core_names = components() |> Map.keys() |> MapSet.new()

        Graphene.FormComponents.__info__(:functions)
        |> Enum.filter(fn {_name, arity} -> arity == 1 end)
        |> Enum.map(&elem(&1, 0))
        |> MapSet.new()
        |> MapSet.intersection(core_names)
      else
        MapSet.new()
      end
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

    defp render_component(name, component, doc, recipe, form_delegates) do
      if recipe do
        render_recipe_component(name, component, doc, recipe)
      else
        delegate =
          if MapSet.member?(form_delegates, name) do
            :form
          else
            :core
          end

        render_simple_component(name, component, doc, delegate)
      end
    end

    defp render_simple_component(name, component, doc, delegate) do
      doc_str =
        if is_binary(doc) do
          "  @doc \"\"\"\n" <> indent_doc(doc) <> "\n  \"\"\"\n"
        else
          "  @doc \"See Graphene.CoreComponents.#{name}/1.\"\n"
        end

      attrs =
        component.attrs
        |> Enum.map(&build_attr/1)
        |> Enum.join("")
        |> Kernel.<>(form_delegate_attrs(component, delegate))

      slots = component.slots |> Enum.map(&build_slot/1) |> Enum.join("")

      delegate_call =
        case delegate do
          :form -> "    FormComponents.#{name}(assigns)\n"
          _ -> "    CoreComponents.#{name}(assigns)\n"
        end

      doc_str <>
        attrs <>
        slots <>
        "  def #{name}(assigns) do\n" <>
        delegate_call <>
        "  end\n\n"
    end

    defp render_recipe_component(name, component, doc, recipe) do
      doc_str =
        if is_binary(doc) do
          "  @doc \"\"\"\n" <> indent_doc(doc) <> "\n  \"\"\"\n"
        else
          "  @doc \"See Graphene.CoreComponents.#{name}/1.\"\n"
        end

      delegate = Map.get(recipe, :delegate, :core)

      attrs =
        component.attrs
        |> Enum.map(&build_attr/1)
        |> Enum.join("")
        |> Kernel.<>(form_delegate_attrs(component, delegate))
        |> Kernel.<>(Map.get(recipe, :extra_attrs, ""))

      slots =
        component.slots
        |> Enum.map(&build_slot/1)
        |> Enum.join("")
        |> Kernel.<>(Map.get(recipe, :extra_slots, ""))

      patterns = Map.get(recipe, :patterns, [])
      prelude = merge_prelude(assign_defaults_prelude(component.attrs), Map.get(recipe, :prelude))
      body = Map.get(recipe, :body, "")

      clauses =
        patterns
        |> Enum.map(fn pattern -> render_recipe_clause(name, pattern, prelude, body) end)
        |> Enum.join("\n")

      fallback = render_recipe_fallback(name, delegate)

      doc_str <> attrs <> slots <> clauses <> fallback
    end

    defp assign_defaults_prelude(attrs) do
      attrs =
        Enum.filter(attrs, fn attr ->
          default = Keyword.get(attr.opts, :default, :__missing__)
          not attr.required and default in [nil, false]
        end)

      case attrs do
        [] ->
          nil

        _ ->
          assigns =
            attrs
            |> Enum.map(fn attr ->
              default =
                cond do
                  attr.name == :rest -> "%{}"
                  Keyword.get(attr.opts, :default, :__missing__) == false -> "false"
                  true -> "nil"
                end

              "      |> assign_new(#{atom_name(attr.name)}, fn -> #{default} end)\n"
            end)
            |> Enum.join("")

          "    assigns =\n      assigns\n" <> assigns <> "\n"
      end
    end

    defp merge_prelude(nil, nil), do: nil
    defp merge_prelude(prelude, nil), do: prelude
    defp merge_prelude(nil, prelude), do: prelude
    defp merge_prelude(prelude, extra), do: prelude <> "\n" <> extra

    defp render_recipe_clause(name, pattern, prelude, body) do
      {pattern, guard} = split_pattern(pattern)

      head =
        if guard do
          "  def #{name}(#{pattern} = assigns) when #{guard} do\n"
        else
          "  def #{name}(#{pattern} = assigns) do\n"
        end

      prelude = ensure_trailing_newline(prelude)

      head <>
        prelude <>
        "    ~H\"\"\"\n" <>
        body <>
        "    \"\"\"\n" <>
        "  end\n"
    end

    defp render_recipe_fallback(name, delegate) do
      call =
        case delegate do
          :form -> "    FormComponents.#{name}(assigns)\n"
          _ -> "    CoreComponents.#{name}(assigns)\n"
        end

      "  def #{name}(assigns) do\n" <> call <> "  end\n\n"
    end

    defp split_pattern(pattern) do
      case String.split(pattern, " when ", parts: 2) do
        [head, guard] -> {head, guard}
        [head] -> {head, nil}
      end
    end

    defp form_delegate_attrs(component, :form) do
      existing = MapSet.new(Enum.map(component.attrs, & &1.name))

      [
        {:field, "Phoenix.HTML.FormField",
         [doc: "a form field struct, for example: @form[:email]"]},
        {:form, :string, [default: nil, doc: "the form attribute for the hidden input"]},
        {:form_event, :string,
         [default: nil, doc: "override the custom event used to sync form values"]}
      ]
      |> Enum.reject(fn {name, _type, _opts} -> MapSet.member?(existing, name) end)
      |> Enum.map(fn {name, type, opts} -> build_manual_attr(name, type, opts) end)
      |> Enum.join("")
    end

    defp form_delegate_attrs(_component, _delegate), do: ""

    defp build_manual_attr(name, type, opts) do
      opt_str = opt_string(opts)
      name = atom_name(name)
      type =
        case type do
          atom when is_atom(atom) -> ":#{atom}"
          other -> to_string(other)
        end

      if opt_str do
        "  attr #{name}, #{type}, #{opt_str}\n"
      else
        "  attr #{name}, #{type}\n"
      end
    end

    defp ensure_trailing_newline(nil), do: ""

    defp ensure_trailing_newline(content) when is_binary(content) do
      if String.ends_with?(content, "\n"), do: content, else: content <> "\n"
    end

    defp render_wrappers do
      docs = docs_map()
      recipes = carbon_component_recipes() |> Map.new(&{&1.name, &1})
      overrides = carbon_component_overrides()
      form_delegates = form_delegate_names()

      components()
      |> Map.keys()
      |> Enum.sort()
      |> Enum.reject(&MapSet.member?(overrides, &1))
      |> Enum.map(fn name ->
        component = Map.fetch!(components(), name)
        doc = Map.get(docs, name)
        recipe = Map.get(recipes, name)
        render_component(name, component, doc, recipe, form_delegates)
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
