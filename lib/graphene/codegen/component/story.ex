defmodule Graphene.CodeGen.Component.Story do
  defmacro __using__(opts) do
    func = Keyword.fetch!(opts, :func)
    extra_variations = Keyword.get(opts, :extra_variations, [])

    quote do
      if Code.ensure_loaded?(PhoenixStorybook.Story) do
        use PhoenixStorybook.Story, :component
      else
        raise "PhoenixStorybook is required to use Graphene.CodeGen.Component.Story"
      end

      @func unquote(func)

      @info Keyword.take(Function.info(@func), [:module, :name])

      def function, do: @func

      def variations do
        component_module = @info[:module]
        component = component_module.__components__()[@info[:name]]
        base_variations = Graphene.CodeGen.Component.Story.variations(@info[:name], component_module, component)
        Enum.concat(base_variations, unquote(extra_variations))
      end
    end
  end

  def variations(component_name, component_module, component) do
    base_slots = default_slots(component_name, component_module, component)

    [variation(%{id: :default, slots: base_slots})] ++
      attr_variations(component, base_slots) ++
      slot_variations(component_name, component_module, component)
  end

  defp variation(attrs) do
    struct!(PhoenixStorybook.Stories.Variation, attrs)
  end

  defp variation_group(attrs) do
    struct!(PhoenixStorybook.Stories.VariationGroup, attrs)
  end

  defp attrs_markup(attrs) do
    attrs
    |> Enum.reject(fn {_key, value} -> is_nil(value) end)
    |> Enum.map_join(" ", &attr_markup/1)
    |> case do
      "" -> ""
      markup -> " " <> markup
    end
  end

  defp attr_markup({key, value}) when is_binary(value) do
    ~s|#{key}="#{value}"|
  end

  defp attr_markup({key, value}) do
    ~s|#{key}={#{inspect(value, structs: false, limit: :infinity, printable_limit: :infinity)}}|
  end

  defp component_tag(component_module, name, attrs) do
    component_tag(component_module, name, attrs, nil)
  end

  defp component_tag(component_module, name, attrs, inner) do
    tag = "#{inspect(component_module)}.#{name}"
    attrs = attrs_markup(attrs)

    if is_nil(inner) do
      "<#{tag}#{attrs}/>"
    else
      "<#{tag}#{attrs}>#{inner}</#{tag}>"
    end
  end

  defp join_components(components) do
    Enum.join(components, "\n")
  end

  defp component_exists?(component_module, name) do
    function_exported?(component_module, :__components__, 0) and
      Map.has_key?(component_module.__components__(), name)
  end

  defp default_slots(component_name, component_module, component) do
    slots = Map.get(component, :slots, [])

    if Enum.any?(slots, &(&1.name == :inner_block)) do
      [inner_block_content(component_name, component_module)]
    else
      []
    end
  end

  defp inner_block_content(component_name, component_module) do
    composed_inner_block(component_name, component_module) || "Inner"
  end

  defp composed_inner_block(:accordion, component_module) do
    join_components([
      component_tag(component_module, :accordion_item, %{title: "Section 1", open: true}, "Accordion content"),
      component_tag(component_module, :accordion_item, %{title: "Section 2"}, "More content")
    ])
  end

  defp composed_inner_block(:breadcrumb, component_module) do
    item_one =
      component_tag(
        component_module,
        :breadcrumb_item,
        %{},
        component_tag(component_module, :breadcrumb_link, %{href: "#"}, "Home")
      )

    item_two =
      component_tag(
        component_module,
        :breadcrumb_item,
        %{},
        component_tag(component_module, :breadcrumb_link, %{href: "#", is_currentpage: true}, "Current")
      )

    join_components([item_one, item_two])
  end

  defp composed_inner_block(component_name, component_module)
       when component_name in [:button_set, :button_set_base] do
    join_components([
      component_tag(component_module, :button, %{kind: "primary"}, "Primary"),
      component_tag(component_module, :button, %{kind: "secondary"}, "Secondary")
    ])
  end

  defp composed_inner_block(:checkbox_group, component_module) do
    join_components([
      component_tag(component_module, :checkbox, %{label_text: "Option 1", id: "checkbox-1"}),
      component_tag(component_module, :checkbox, %{label_text: "Option 2", id: "checkbox-2"})
    ])
  end

  defp composed_inner_block(:combo_box, component_module) do
    join_components([
      component_tag(component_module, :combo_box_item, %{value: "one"}, "Option 1"),
      component_tag(component_module, :combo_box_item, %{value: "two"}, "Option 2")
    ])
  end

  defp composed_inner_block(:content_switcher, component_module) do
    join_components([
      component_tag(component_module, :content_switcher_item, %{value: "one"}, "First"),
      component_tag(component_module, :content_switcher_item, %{value: "two"}, "Second")
    ])
  end

  defp composed_inner_block(:contained_list, component_module) do
    join_components([
      component_tag(component_module, :contained_list_item, %{}, "List item 1"),
      component_tag(component_module, :contained_list_item, %{}, "List item 2")
    ])
  end

  defp composed_inner_block(:dropdown, component_module) do
    join_components([
      component_tag(component_module, :dropdown_item, %{value: "one"}, "Option 1"),
      component_tag(component_module, :dropdown_item, %{value: "two"}, "Option 2")
    ])
  end

  defp composed_inner_block(:header_menu, component_module) do
    join_components([
      component_tag(component_module, :header_menu_item, %{href: "#", title: "Overview"}, "Overview"),
      component_tag(component_module, :header_menu_item, %{href: "#", title: "Settings"}, "Settings")
    ])
  end

  defp composed_inner_block(:header_nav, component_module) do
    join_components([
      component_tag(component_module, :header_nav_item, %{href: "#", title: "Docs"}, "Docs"),
      component_tag(component_module, :header_nav_item, %{href: "#", title: "Support"}, "Support")
    ])
  end

  defp composed_inner_block(:multi_select, component_module) do
    join_components([
      component_tag(component_module, :multi_select_item, %{value: "one"}, "Option 1"),
      component_tag(component_module, :multi_select_item, %{value: "two"}, "Option 2")
    ])
  end

  defp composed_inner_block(:overflow_menu, component_module) do
    join_components([
      component_tag(component_module, :overflow_menu_item, %{}, "Action 1"),
      component_tag(component_module, :overflow_menu_item, %{}, "Action 2")
    ])
  end

  defp composed_inner_block(component_name, component_module)
       when component_name in [:ordered_list, :unordered_list] do
    join_components([
      component_tag(component_module, :list_item, %{}, "First"),
      component_tag(component_module, :list_item, %{}, "Second")
    ])
  end

  defp composed_inner_block(:radio_button_group, component_module) do
    join_components([
      component_tag(
        component_module,
        :radio_button,
        %{label_text: "Choice 1", name: "choices", value: "one"}
      ),
      component_tag(
        component_module,
        :radio_button,
        %{label_text: "Choice 2", name: "choices", value: "two"}
      )
    ])
  end

  defp composed_inner_block(:select, component_module) do
    join_components([
      component_tag(component_module, :select_item, %{value: "one"}, "Option 1"),
      component_tag(component_module, :select_item, %{value: "two"}, "Option 2")
    ])
  end

  defp composed_inner_block(:side_nav, component_module) do
    items =
      join_components([
        component_tag(component_module, :side_nav_link, %{href: "#", title: "Dashboard"}, "Dashboard"),
        component_tag(component_module, :side_nav_link, %{href: "#", title: "Settings"}, "Settings")
      ])

    component_tag(component_module, :side_nav_items, %{}, items)
  end

  defp composed_inner_block(:side_nav_menu, component_module) do
    join_components([
      component_tag(component_module, :side_nav_menu_item, %{}, "Item 1"),
      component_tag(component_module, :side_nav_menu_item, %{}, "Item 2")
    ])
  end

  defp composed_inner_block(:structured_list, component_module) do
    head =
      component_tag(
        component_module,
        :structured_list_head,
        %{},
        component_tag(
          component_module,
          :structured_list_header_row,
          %{},
          join_components([
            component_tag(component_module, :structured_list_header_cell, %{}, "Column 1"),
            component_tag(component_module, :structured_list_header_cell, %{}, "Column 2")
          ])
        )
      )

    body =
      component_tag(
        component_module,
        :structured_list_body,
        %{},
        component_tag(
          component_module,
          :structured_list_row,
          %{},
          join_components([
            component_tag(component_module, :structured_list_cell, %{}, "Row 1"),
            component_tag(component_module, :structured_list_cell, %{}, "Row 2")
          ])
        )
      )

    join_components([head, body])
  end

  defp composed_inner_block(:table, component_module) do
    head =
      component_tag(
        component_module,
        :table_head,
        %{},
        component_tag(
          component_module,
          :table_header_row,
          %{},
          join_components([
            component_tag(component_module, :table_header_cell, %{}, "Header 1"),
            component_tag(component_module, :table_header_cell, %{}, "Header 2")
          ])
        )
      )

    body =
      component_tag(
        component_module,
        :table_body,
        %{},
        component_tag(
          component_module,
          :table_row,
          %{},
          join_components([
            component_tag(component_module, :table_cell, %{}, "Row 1"),
            component_tag(component_module, :table_cell, %{}, "Row 2")
          ])
        )
      )

    join_components([head, body])
  end

  defp composed_inner_block(:tabs, component_module) do
    join_components([
      component_tag(component_module, :tab, %{tab_title: "Tab 1"}, "Tab content 1"),
      component_tag(component_module, :tab, %{tab_title: "Tab 2"}, "Tab content 2")
    ])
  end

  defp composed_inner_block(:tile_group, component_module) do
    join_components([
      component_tag(
        component_module,
        :radio_tile,
        %{name: "tile-group", value: "one", selected: true},
        "Tile 1"
      ),
      component_tag(component_module, :radio_tile, %{name: "tile-group", value: "two"}, "Tile 2")
    ])
  end

  defp composed_inner_block(component_name, component_module) do
    item_name = String.to_atom("#{component_name}_item")

    if component_exists?(component_module, item_name) do
      join_components([
        component_tag(component_module, item_name, %{}, "Item 1"),
        component_tag(component_module, item_name, %{}, "Item 2")
      ])
    else
      nil
    end
  end

  defp attr_value_key(value) do
    if is_nil(value), do: "nil", else: to_string(value)
  end

  defp slot_content(_component_name, _component_module, :"s-") do
    ~S|<:s->Item</:s->|
  end

  defp slot_content(_component_name, _component_module, :"s-icon") do
    ~S|<:s-icon><Graphene.Icons.icon fit="width" name="analytics"/></:s-icon>|
  end

  defp slot_content(component_name, component_module, :inner_block) do
    inner_block_content(component_name, component_module)
  end

  defp slot_content(_component_name, _component_module, slot) do
    content =
      slot
      |> to_string()
      |> String.replace_prefix("s-", "")
      |> String.capitalize()

    "<:#{slot}>#{content}</:#{slot}>"
  end

  defp attr_variation_groups(attr, base_slots) do
    case {attr.type, Keyword.get(Map.get(attr, :opts, []), :values)} do
      {_, values} when not is_nil(values) ->
        values = Enum.uniq_by(values, &attr_value_key/1)

        variation_group(%{
          id: attr.name,
          description: Map.get(attr, :doc, to_string(attr.name)),
          variations:
            for item <- values do
              # those ids are not garbage collected, but they
              # are trusted to not have infinite combinations
              variation(%{
                id: String.to_atom("#{attr.name}-#{attr_value_key(item)}"),
                attributes: %{attr.name => item},
                slots: base_slots
              })
            end
        })

      {:boolean, _} ->
        variation_group(%{
          id: attr.name,
          description: Map.get(attr, :doc, to_string(attr.name)),
          variations: [
            variation(%{
              id: String.to_atom("#{attr.name}-true"),
              attributes: %{attr.name => true},
              slots: base_slots
            }),
            variation(%{
              id: String.to_atom("#{attr.name}-false"),
              attributes: %{attr.name => false},
              slots: base_slots
            })
          ]
        })

      _ ->
        nil
    end
  end

  defp attr_variations(component, base_slots) do
    Map.get(component, :attrs, [])
    |> Stream.map(&attr_variation_groups(&1, base_slots))
    |> Enum.reject(&is_nil/1)
    |> List.flatten()
  end

  defp slot_variations(component_name, component_module, component) do
    slots = Map.get(component, :slots, [])

    for {comb, i} <- Enum.with_index(:lib_combin.cnr_all(slots)) do
      variation(%{
        id: String.to_atom("slots-#{i}"),
        slots:
          for s <- comb do
            slot_content(component_name, component_module, s.name)
          end
      })
    end
  end
end
