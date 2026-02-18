defmodule Graphene.CodeGen.Component.Story do
  defmacro __using__(opts) do
    func = Keyword.fetch!(opts, :func)
    extra_variations = Keyword.get(opts, :extra_variations, [])
    component_module = Keyword.get(opts, :component_module)
    component_name = Keyword.get(opts, :component_name)

    quote do
      if Code.ensure_loaded?(PhoenixStorybook.Story) do
        use PhoenixStorybook.Story, :component
      else
        raise "PhoenixStorybook is required to use Graphene.CodeGen.Component.Story"
      end

      @component_func unquote(func)
      @component_info (
        if unquote(component_module) && unquote(component_name) do
          [module: unquote(component_module), name: unquote(component_name)]
        else
          Keyword.take(Function.info(@component_func), [:module, :name])
        end
      )
      @render_func @component_func

      def function, do: @render_func

      def variations do
        component_module = @component_info[:module]
        component = component_module.__components__()[@component_info[:name]]

        base_variations =
          Graphene.CodeGen.Component.Story.variations(
            @component_info[:name],
            component_module,
            component
          )

        Enum.concat(base_variations, unquote(extra_variations))
      end

      def container do
        Graphene.CodeGen.Component.Story.container(@component_info[:name])
      end

      def template do
        Graphene.CodeGen.Component.Story.template(@component_info[:name])
      end
    end
  end

  def variations(component_name, component_module, component) do
    base_slots = default_slots(component_name, component_module, component)
    base_attrs = default_attributes(component_name)

    [variation(%{id: :default, slots: base_slots, attributes: base_attrs})] ++
      attr_variations(component_name, component, base_slots, base_attrs) ++
      slot_variations(component_name, component_module, component)
  end

  defp default_attributes(:menu) do
    %{open: true, x: 240, y: 120}
  end

  defp default_attributes(:overflow_menu) do
    %{open: true}
  end

  defp default_attributes(_component_name) do
    %{}
  end

  def container(component_name) when component_name in [:menu, :overflow_menu] do
    {:iframe, style: iframe_container_style()}
  end
  def container(_component_name), do: :div

  defp iframe_container_style do
    "display: flex; flex-direction: column; justify-content: center; align-items: center; " <>
      "margin: 0; gap: 5px; padding: 5px; min-height: 240px;"
  end

  def template(:overflow_menu) do
    """
    <div data-floating-menu-container class="psb" style="position: relative; min-height: 240px;">
      <.psb-variation/>
    </div>
    """
  end

  def template(:menu) do
    """
    <div class="psb" style="position: relative; min-height: 240px;">
      <.psb-variation/>
    </div>
    """
  end

  def template(_component_name), do: "<.psb-variation/>"

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

    if component_name == :overflow_menu do
      base_slots = []

      base_slots =
        if Enum.any?(slots, &(&1.name == :icon)) do
          base_slots ++ [slot_content(component_name, component_module, :icon)]
        else
          base_slots
        end

      base_slots =
        if Enum.any?(slots, &(&1.name == :tooltip_content)) do
          base_slots ++ [slot_content(component_name, component_module, :tooltip_content)]
        else
          base_slots
        end

      if Enum.any?(slots, &(&1.name == :inner_block)) do
        base_slots ++ [inner_block_content(component_name, component_module)]
      else
        base_slots
      end
    else
      if Enum.any?(slots, &(&1.name == :inner_block)) do
        [inner_block_content(component_name, component_module)]
      else
        []
      end
    end
  end

  defp inner_block_content(component_name, component_module) do
    composed_inner_block(component_name, component_module) || "Inner"
  end

  defp composed_inner_block(:accordion, component_module) do
    join_components([
      component_tag(
        component_module,
        :accordion_item,
        %{title: "Section 1", open: true},
        "Accordion content"
      ),
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
        component_tag(
          component_module,
          :breadcrumb_link,
          %{href: "#", is_currentpage: true},
          "Current"
        )
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
      component_tag(
        component_module,
        :header_menu_item,
        %{href: "#", title: "Overview"},
        "Overview"
      ),
      component_tag(
        component_module,
        :header_menu_item,
        %{href: "#", title: "Settings"},
        "Settings"
      )
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

  defp composed_inner_block(:menu, component_module) do
    join_components([
      component_tag(component_module, :menu_item, %{label: "Action 1"}),
      component_tag(component_module, :menu_item, %{label: "Action 2"})
    ])
  end

  defp composed_inner_block(:overflow_menu, component_module) do
    items =
      join_components([
        component_tag(component_module, :overflow_menu_item, %{}, "Action 1"),
        component_tag(component_module, :overflow_menu_item, %{}, "Action 2")
      ])

    component_tag(component_module, :overflow_menu_body, %{}, items)
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
        component_tag(
          component_module,
          :side_nav_link,
          %{href: "#"},
          "<:title>Dashboard</:title>"
        ),
        component_tag(
          component_module,
          :side_nav_link,
          %{href: "#"},
          "<:title>Settings</:title>"
        )
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

  defp slot_content(:overflow_menu, _component_module, :icon) do
    ~S|<:icon><Graphene.Icons.icon fit="width" name="overflow-menu--horizontal"/></:icon>|
  end

  defp slot_content(_component_name, _component_module, :icon) do
    ~S|<:icon><Graphene.Icons.icon fit="width" name="analytics"/></:icon>|
  end

  defp slot_content(component_name, component_module, :inner_block) do
    inner_block_content(component_name, component_module)
  end

  defp slot_content(_component_name, _component_module, slot) do
    content =
      slot
      |> to_string()
      |> String.replace("_", " ")
      |> String.capitalize()

    "<:#{slot}>#{content}</:#{slot}>"
  end

  defp attr_variation_groups(attr, base_slots, base_attrs) do
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
                attributes: Map.merge(base_attrs, %{attr.name => item}),
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
              attributes: Map.merge(base_attrs, %{attr.name => true}),
              slots: base_slots
            }),
            variation(%{
              id: String.to_atom("#{attr.name}-false"),
              attributes: Map.merge(base_attrs, %{attr.name => false}),
              slots: base_slots
            })
          ]
        })

      _ ->
        nil
    end
  end

  defp attr_variations(component_name, _component, _base_slots, _base_attrs)
       when component_name in [:menu, :overflow_menu] do
    []
  end

  defp attr_variations(_component_name, component, base_slots, base_attrs) do
    Map.get(component, :attrs, [])
    |> Stream.map(&attr_variation_groups(&1, base_slots, base_attrs))
    |> Enum.reject(&is_nil/1)
    |> List.flatten()
  end

  defp slot_variations(component_name, component_module, component) do
    if component_name in [:menu, :overflow_menu] do
      []
    else
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
end
