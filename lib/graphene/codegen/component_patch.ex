defmodule Graphene.CodeGen.ComponentPatches do
  @moduledoc """
  Known Patches for components code generation
  """
  alias Graphene.CodeGen.Component
  alias Graphene.CodeGen.Component.{Attr, Slot}
  alias Graphene.CodeGen.Util

  def patch(component) do
    component
    |> do_patch()
    |> add_missing_slots()
    |> resolve_slot_collisions()
  end

  defp do_patch(
         %{
           htmltag: "cds-checkbox",
           componentname: componentname,
           docs: docs,
           source: "./src/components/checkbox/checkbox-group.ts"
         } = component
       ) do
    # in the documentation builder there is a clush with checkbox
    # realname is "cds-checkbox-group"
    # https://github.com/carbon-design-system/carbon-for-ibm-dotcom/issues/11883
    %{
      component
      | htmltag: "cds-checkbox-group",
        componentname: componentname <> "_group",
        docs: String.replace(docs, "<cds-checkbox>", "<cds-checkbox-group>")
    }
  end

  defp do_patch(
         %{
           htmltag: "cds-menu-item",
           componentname: componentname,
           docs: docs,
           source: "./src/components/menu/menu-item-selectable.ts"
         } = component
       ) do
    # in the documentation builder there is a bug with docs
    # realname is "cds-menu-item-selectable"
    # https://github.com/carbon-design-system/carbon/issues/21426
    %{
      component
      | htmltag: "cds-menu-item-selectable",
        componentname: componentname <> "_selectable",
        docs: String.replace(docs, "<cds-menu-item>", "<cds-menu-item-selectable>")
    }
  end

  defp do_patch(
         %{
           htmltag: "cds-fluid-textarea",
           componentname: componentname,
           docs: docs,
           source: "./src/components/fluid-textarea/fluid-textarea-skeleton.ts"
         } = component
       ) do
    # in the documentation builder there is a bug with docs
    # realname is "cds-fluid-textarea-skeleton"
    # https://github.com/carbon-design-system/carbon/issues/21425
    %{
      component
      | htmltag: "cds-fluid-textarea-skeleton",
        componentname: componentname <> "_skeleton",
        docs: String.replace(docs, "<cds-fluid-textarea>", "<cds-fluid-textarea-skeleton>")
    }
  end

  defp do_patch(
         %{
           htmltag: "cds-popover",
           componentname: componentname,
           docs: docs,
           source: "./src/components/popover/popover-content.ts"
         } = component
       ) do
    # in the documentation builder there is a clush with popover
    # realname is "cds-popover-content"
    # https://github.com/carbon-design-system/carbon-for-ibm-dotcom/issues/11884
    %{
      component
      | htmltag: "cds-popover-content",
        componentname: componentname <> "_content",
        docs: String.replace(docs, "<cds-popover>", "<cds-popover-content>")
    }
  end

  defp do_patch(%{htmltag: "cds-copy"} = component) do
    %{component | import: "./src/components/copy/copy.js"}
  end

  defp do_patch(%{htmltag: "cds-number-input"} = component) do
    component
    |> set_step_default()
    |> set_number_input_bounds_default()
  end

  defp do_patch(%{htmltag: "cds-fluid-number-input"} = component) do
    component
    |> set_step_default()
    |> set_number_input_bounds_default()
  end

  defp do_patch(%{htmltag: "cds-slider"} = component) do
    set_attr_default(component, "step-multiplier", "4")
  end

  defp do_patch(%{htmltag: "cds-slider-input"} = component) do
    set_attr_default(component, "step-multiplier", "4")
  end

  defp do_patch(%{htmltag: "cds-button", slots: []} = component) do
    %{component | slots: [Slot.parse(%{"name" => "icon", "description" => "Icon."})]}
  end

  defp do_patch(%{htmltag: "cds-ai-label"} = component) do
    component
    |> ensure_slot(%{"name" => "body-text", "description" => "Content for the AI label body."})
    |> ensure_slot(%{"name" => "actions", "description" => "Action buttons for the AI label."})
  end

  defp do_patch(%{htmltag: "cds-toggletip"} = component) do
    component
    |> ensure_slot(%{
      "name" => "body-text",
      "description" => "Body text content for the toggletip."
    })
    |> ensure_slot(%{"name" => "actions", "description" => "Action buttons for the toggletip."})
  end

  defp do_patch(%{htmltag: "cds-overflow-menu"} = component) do
    ensure_slot(component, %{
      "name" => "tooltip-content",
      "description" => "Tooltip content for the overflow menu trigger."
    })
  end

  defp do_patch(%{htmltag: "cds-table", slots: []} = component) do
    %{
      component
      | slots: [
          Slot.parse(%{"name" => "title", "description" => "Title"}),
          Slot.parse(%{"name" => "description", "description" => "Description"}),
          Slot.parse(%{"name" => "toolbar", "description" => "Toolbar"})
        ]
    }
  end

  defp do_patch(%{htmltag: "cds-table-row"} = component) do
    ensure_attr(
      component,
      %{
        "name" => "radio",
        "type" => "boolean",
        "default" => "false",
        "description" =>
          "Specify whether the control should be a radio button or inline checkbox."
      }
    )
  end

  defp do_patch(component), do: component

  @manual_components [
    %Component{
      htmltag: "cds-accordion-skeleton",
      componentname: "accordion_skeleton",
      source: "./src/components/accordion/accordion-skeleton.ts",
      docs: """
      Component `<cds-accordion-skeleton>` from `./src/components/accordion/accordion-skeleton.ts`

      Accordion skeleton.
      """,
      attrs: [
        Attr.parse(%{
          "name" => "alignment",
          "type" => "ACCORDION_ALIGNMENT",
          "description" => "Specify the alignment of the accordion heading title and chevron."
        }),
        Attr.parse(%{
          "name" => "count",
          "type" => "number",
          "description" => "Set number of items to render."
        }),
        Attr.parse(%{
          "name" => "is-flush",
          "type" => "boolean",
          "description" => "Specify whether Accordion text should be flush."
        }),
        Attr.parse(%{
          "name" => "open",
          "type" => "boolean",
          "description" => "`true` if the first accordion item should be open."
        })
      ],
      slots: []
    },
    %Component{
      htmltag: "cds-breadcrumb-skeleton",
      componentname: "breadcrumb_skeleton",
      source: "./src/components/breadcrumb/breadcrumb-skeleton.ts",
      docs: """
      Component `<cds-breadcrumb-skeleton>` from `./src/components/breadcrumb/breadcrumb-skeleton.ts`

      Breadcrumb skeleton.
      """,
      attrs: [
        Attr.parse(%{
          "name" => "items",
          "type" => "number",
          "description" => "Number of items to render."
        }),
        Attr.parse(%{
          "name" => "no-trailing-slash",
          "type" => "boolean",
          "description" => "`true` to omit the trailing slash."
        }),
        Attr.parse(%{
          "name" => "size",
          "type" => "string",
          "description" => "Breadcrumb size."
        })
      ],
      slots: []
    },
    %Component{
      htmltag: "cds-button-skeleton",
      componentname: "button_skeleton",
      source: "./src/components/button/button-skeleton.ts",
      docs: """
      Component `<cds-button-skeleton>` from `./src/components/button/button-skeleton.ts`

      Button skeleton.
      """,
      attrs: [],
      slots: []
    },
    %Component{
      htmltag: "cds-checkbox-skeleton",
      componentname: "checkbox_skeleton",
      source: "./src/components/checkbox/checkbox-skeleton.ts",
      docs: """
      Component `<cds-checkbox-skeleton>` from `./src/components/checkbox/checkbox-skeleton.ts`

      Checkbox skeleton.
      """,
      attrs: [],
      slots: []
    },
    %Component{
      htmltag: "cds-code-snippet-skeleton",
      componentname: "code_snippet_skeleton",
      source: "./src/components/code-snippet/code-snippet-skeleton.ts",
      docs: """
      Component `<cds-code-snippet-skeleton>` from `./src/components/code-snippet/code-snippet-skeleton.ts`

      Code snippet skeleton.
      """,
      attrs: [
        Attr.parse(%{
          "name" => "type",
          "type" => "CODE_SNIPPET_TYPE",
          "description" => "Code snippet type."
        })
      ],
      slots: []
    },
    %Component{
      htmltag: "cds-date-picker-input-skeleton",
      componentname: "date_picker_input_skeleton",
      source: "./src/components/date-picker/date-picker-input-skeleton.ts",
      docs: """
      Component `<cds-date-picker-input-skeleton>` from `./src/components/date-picker/date-picker-input-skeleton.ts`

      Date picker input skeleton.
      """,
      attrs: [
        Attr.parse(%{
          "name" => "hide-label",
          "type" => "boolean",
          "description" => "Specify whether the label should be hidden."
        }),
        Attr.parse(%{
          "name" => "kind",
          "type" => "DATE_PICKER_INPUT_KIND",
          "description" => "Date picker kind."
        }),
        Attr.parse(%{
          "name" => "range",
          "type" => "boolean",
          "description" => "`true` if the input is a range."
        })
      ],
      slots: []
    },
    %Component{
      htmltag: "cds-dropdown-skeleton",
      componentname: "dropdown_skeleton",
      source: "./src/components/dropdown/dropdown-skeleton.ts",
      docs: """
      Component `<cds-dropdown-skeleton>` from `./src/components/dropdown/dropdown-skeleton.ts`

      Dropdown skeleton.
      """,
      attrs: [
        Attr.parse(%{
          "name" => "hide-label",
          "type" => "boolean",
          "description" => "Specify whether the label should be hidden."
        }),
        Attr.parse(%{
          "name" => "size",
          "type" => "DROPDOWN_SIZE",
          "description" => "Dropdown size."
        })
      ],
      slots: []
    },
    %Component{
      htmltag: "cds-menu",
      componentname: "menu",
      source: "./src/components/menu/menu.ts",
      docs: """
      Component `<cds-menu>` from `./src/components/menu/menu.ts`

      Menu.
      """,
      attrs: [
        Attr.parse(%{
          "name" => "open",
          "type" => "boolean",
          "description" => "Whether the menu is open."
        }),
        Attr.parse(%{
          "name" => "size",
          "type" => "string",
          "description" => "Menu size."
        }),
        Attr.parse(%{
          "name" => "label",
          "type" => "string",
          "description" => "Menu label."
        }),
        Attr.parse(%{
          "name" => "border",
          "type" => "boolean",
          "description" => "Whether the menu has a border."
        }),
        Attr.parse(%{
          "name" => "backgroundToken",
          "attribute" => "background-token",
          "type" => "string",
          "description" => "Background token for the menu."
        }),
        Attr.parse(%{
          "name" => "menuAlignment",
          "attribute" => "menu-alignment",
          "type" => "string",
          "description" => "Alignment of the menu."
        })
      ],
      slots: []
    },
    %Component{
      htmltag: "cds-number-input-skeleton",
      componentname: "number_input_skeleton",
      source: "./src/components/number-input/number-input-skeleton.ts",
      docs: """
      Component `<cds-number-input-skeleton>` from `./src/components/number-input/number-input-skeleton.ts`

      Number input skeleton.
      """,
      attrs: [
        Attr.parse(%{
          "name" => "hide-label",
          "type" => "boolean",
          "description" => "Specify whether the label should be hidden."
        })
      ],
      slots: []
    },
    %Component{
      htmltag: "cds-progress-indicator-skeleton",
      componentname: "progress_indicator_skeleton",
      source: "./src/components/progress-indicator/progress-indicator-skeleton.ts",
      docs: """
      Component `<cds-progress-indicator-skeleton>` from `./src/components/progress-indicator/progress-indicator-skeleton.ts`

      Progress indicator skeleton.
      """,
      attrs: [
        Attr.parse(%{
          "name" => "vertical",
          "type" => "boolean",
          "description" => "`true` to render the vertical variant."
        })
      ],
      slots: []
    },
    %Component{
      htmltag: "cds-progress-step-skeleton",
      componentname: "progress_step_skeleton",
      source: "./src/components/progress-indicator/progress-step-skeleton.ts",
      docs: """
      Component `<cds-progress-step-skeleton>` from `./src/components/progress-indicator/progress-step-skeleton.ts`

      Progress step skeleton.
      """,
      attrs: [
        Attr.parse(%{
          "name" => "vertical",
          "type" => "boolean",
          "description" => "`true` to render the vertical variant."
        })
      ],
      slots: []
    },
    %Component{
      htmltag: "cds-radio-button-skeleton",
      componentname: "radio_button_skeleton",
      source: "./src/components/radio-button/radio-button-skeleton.ts",
      docs: """
      Component `<cds-radio-button-skeleton>` from `./src/components/radio-button/radio-button-skeleton.ts`

      Radio button skeleton.
      """,
      attrs: [],
      slots: []
    },
    %Component{
      htmltag: "cds-select-skeleton",
      componentname: "select_skeleton",
      source: "./src/components/select/select-skeleton.ts",
      docs: """
      Component `<cds-select-skeleton>` from `./src/components/select/select-skeleton.ts`

      Select skeleton.
      """,
      attrs: [
        Attr.parse(%{
          "name" => "hide-label",
          "type" => "boolean",
          "description" => "Specify whether the label should be hidden."
        })
      ],
      slots: []
    },
    %Component{
      htmltag: "cds-slider-skeleton",
      componentname: "slider_skeleton",
      source: "./src/components/slider/slider-skeleton.ts",
      docs: """
      Component `<cds-slider-skeleton>` from `./src/components/slider/slider-skeleton.ts`

      Slider skeleton.
      """,
      attrs: [
        Attr.parse(%{
          "name" => "two-handles",
          "type" => "boolean",
          "description" => "`true` to show two handles."
        })
      ],
      slots: []
    },
    %Component{
      htmltag: "cds-structured-list-header-cell-skeleton",
      componentname: "structured_list_header_cell_skeleton",
      source: "./src/components/structured-list/structured-list-header-cell-skeleton.ts",
      docs: """
      Component `<cds-structured-list-header-cell-skeleton>` from `./src/components/structured-list/structured-list-header-cell-skeleton.ts`

      Structured list header cell skeleton.
      """,
      attrs: [],
      slots: []
    },
    %Component{
      htmltag: "cds-tile-above-the-fold-content",
      componentname: "tile_above_the_fold_content",
      source: "./src/components/tile/tile.ts",
      docs: """
      Component `<cds-tile-above-the-fold-content>` from `./src/components/tile/tile.ts`

      Tile above-the-fold content.
      """,
      attrs: [],
      slots: []
    },
    %Component{
      htmltag: "cds-tile-below-the-fold-content",
      componentname: "tile_below_the_fold_content",
      source: "./src/components/tile/tile.ts",
      docs: """
      Component `<cds-tile-below-the-fold-content>` from `./src/components/tile/tile.ts`

      Tile below-the-fold content.
      """,
      attrs: [],
      slots: []
    }
  ]

  def carbon_component_overrides do
    MapSet.new([:file_uploader])
  end

  @carbon_component_recipes [
    %{
      name: :accordion,
      delegate: :core,
      patterns: ["%{item: [_ | _]}"],
      extra_slots: ~S"""
        slot :item do
          attr :title, :string
          attr :open, :boolean
          attr :disabled, :boolean
        end
      """,
      body: ~S"""
          <CoreComponents.accordion
            alignment={@alignment}
            disabled={@disabled}
            is_flush={@is_flush}
            size={@size}
            {@rest}
          >
            <%= for item <- @item do %>
              <CoreComponents.accordion_item
                title={item[:title]}
                open={item[:open]}
                disabled={item[:disabled]}
              >
                {render_slot(item)}
              </CoreComponents.accordion_item>
            <% end %>
          </CoreComponents.accordion>
      """
    },
    %{
      name: :ai_label,
      delegate: :core,
      patterns: ["%{}"],
      extra_slots: ~S"""
        slot :action_button do
          attr :attrs, :map
        end
      """,
      body: ~S"""
          <CoreComponents.ai_label
            ai_text={assigns[:ai_text]}
            ai_text_label={assigns[:ai_text_label]}
            alignment={assigns[:alignment]}
            alignment_axis_offset={assigns[:alignment_axis_offset]}
            autoalign={assigns[:autoalign]}
            button_label={assigns[:button_label]}
            default_open={assigns[:default_open]}
            kind={assigns[:kind]}
            open={assigns[:open]}
            previous_value={assigns[:previous_value]}
            revert_active={assigns[:revert_active]}
            revert_label={assigns[:revert_label]}
            size={assigns[:size]}
            slot={assigns[:slot]}
            {@rest}
          >
            <.dynamic_tag :for={body <- @body_text} tag_name={Map.get(body, :tag, "div")} slot="body-text">
              {render_slot(body)}
            </.dynamic_tag>
            <.dynamic_tag :for={action <- @actions} tag_name={Map.get(action, :tag, "div")} slot="actions">
              {render_slot(action)}
            </.dynamic_tag>
            <%= for action_button <- @action_button do %>
              <CoreComponents.ai_label_action_button {action_button[:attrs] || %{}}>
                {render_slot(action_button)}
              </CoreComponents.ai_label_action_button>
            <% end %>
            {render_slot(@inner_block)}
          </CoreComponents.ai_label>
      """
    },
    %{
      name: :breadcrumb,
      delegate: :core,
      patterns: ["%{item: [_ | _]}"],
      extra_slots: ~S"""
        slot :item do
          attr :href, :string
          attr :disabled, :boolean
          attr :current, :boolean
          attr :text, :string
        end
      """,
      body: ~S"""
          <CoreComponents.breadcrumb no_trailing_slash={@no_trailing_slash} size={@size} {@rest}>
            <%= for item <- @item do %>
              <CoreComponents.breadcrumb_item>
                <%= if item[:href] do %>
                  <CoreComponents.breadcrumb_link
                    href={item[:href]}
                    disabled={item[:disabled]}
                    is_currentpage={item[:current]}
                  >
                    {item[:text] || render_slot(item)}
                  </CoreComponents.breadcrumb_link>
                <% else %>
                  {item[:text] || render_slot(item)}
                <% end %>
              </CoreComponents.breadcrumb_item>
            <% end %>
          </CoreComponents.breadcrumb>
      """
    },
    %{
      name: :checkbox_group,
      delegate: :core,
      patterns: ["%{item: [_ | _]}"],
      extra_slots: ~S"""
        slot :item do
          attr :label, :string
          attr :value, :string
          attr :checked, :boolean
          attr :disabled, :boolean
        end
      """,
      body: ~S"""
          <CoreComponents.checkbox_group
            disabled={@disabled}
            helper_text={@helper_text}
            invalid={@invalid}
            invalid_text={@invalid_text}
            legend_id={@legend_id}
            legend_text={@legend_text}
            orientation={@orientation}
            readonly={@readonly}
            warn={@warn}
            warn_text={@warn_text}
            {@rest}
          >
            <%= for item <- @item do %>
              <CoreComponents.checkbox
                label_text={item[:label]}
                value={item[:value]}
                checked={item[:checked]}
                disabled={item[:disabled]}
              />
            <% end %>
          </CoreComponents.checkbox_group>
      """
    },
    %{
      name: :combo_box,
      delegate: :form,
      patterns: ["%{item: [_ | _]}"],
      extra_slots: ~S"""
        slot :item do
          attr :label, :string
          attr :value, :string
          attr :disabled, :boolean
        end
      """,
      body: ~S"""
          <FormComponents.combo_box
            allow_custom_value={@allow_custom_value}
            autoalign={@autoalign}
            clear_selection_label={@clear_selection_label}
            direction={@direction}
            disabled={@disabled}
            helper_text={@helper_text}
            hide_label={@hide_label}
            input_label={@input_label}
            invalid={@invalid}
            invalid_text={@invalid_text}
            label={@label}
            name={@name}
            open={@open}
            read_only={@read_only}
            required={@required}
            required_validity_message={@required_validity_message}
            should_filter_item={@should_filter_item}
            size={@size}
            title_text={@title_text}
            toggle_label_closed={@toggle_label_closed}
            toggle_label_open={@toggle_label_open}
            type={@type}
            typeahead={@typeahead}
            validity_message={@validity_message}
            value={@value}
            warn={@warn}
            warn_text={@warn_text}
            {@rest}
          >
            <%= for item <- @item do %>
              <CoreComponents.combo_box_item
                value={item[:value] || item[:label]}
                disabled={item[:disabled]}
              >
                {item[:label] || render_slot(item)}
              </CoreComponents.combo_box_item>
            <% end %>
          </FormComponents.combo_box>
      """
    },
    %{
      name: :combo_button,
      delegate: :core,
      patterns: ["%{item: [_ | _]}"],
      extra_slots: ~S"""
        slot :item do
          attr :label, :string
          attr :disabled, :boolean
          attr :kind, :any
          attr :shortcut, :string
          attr :divider, :boolean
          attr :attrs, :map
        end

        slot :group do
          attr :label, :string
          attr :attrs, :map
        end

        slot :divider do
          attr :attrs, :map
        end
      """,
      body: ~S"""
          <CoreComponents.combo_button
            disabled={assigns[:disabled]}
            label={assigns[:label]}
            menu_alignment={assigns[:menu_alignment]}
            on_click={assigns[:on_click]}
            size={assigns[:size]}
            tooltip_alignment={assigns[:tooltip_alignment]}
            tooltip_content={assigns[:tooltip_content]}
            {@rest}
          >
            <CoreComponents.menu>
              {render_menu_items(assigns)}
            </CoreComponents.menu>
          </CoreComponents.combo_button>
      """
    },
    %{
      name: :code_snippet,
      delegate: :core,
      patterns: ["%{copy_text: nil}"],
      body: ~S"""
          <% copy_text =
            @copy_text ||
              (@inner_block
               |> render_slot()
               |> Phoenix.HTML.Safe.to_iodata()
               |> IO.iodata_to_binary()
               |> String.trim()) %>
          <CoreComponents.code_snippet
            copy_text={copy_text}
            disabled={@disabled}
            feedback={@feedback}
            feedback_timeout={@feedback_timeout}
            hide_copy_button={@hide_copy_button}
            max_collapsed_number_of_rows={@max_collapsed_number_of_rows}
            max_expanded_number_of_rows={@max_expanded_number_of_rows}
            min_collapsed_number_of_rows={@min_collapsed_number_of_rows}
            min_expanded_number_of_rows={@min_expanded_number_of_rows}
            show_less_text={@show_less_text}
            show_more_text={@show_more_text}
            tooltip_content={@tooltip_content}
            type={@type}
            wrap_text={@wrap_text}
            {@rest}
          >
            {render_slot(@inner_block)}
          </CoreComponents.code_snippet>
      """
    },
    %{
      name: :contained_list,
      delegate: :core,
      patterns: ["%{item: [_ | _]}"],
      extra_slots: ~S"""
        slot :item do
          attr :clickable, :boolean
          attr :disabled, :boolean
        end
      """,
      body: ~S"""
          <CoreComponents.contained_list
            is_inset={@is_inset}
            kind={@kind}
            size={@size}
            {@rest}
          >
            <.dynamic_tag :for={label <- @label} tag_name={Map.get(label, :tag, "div")} slot="label">
              {render_slot(label)}
            </.dynamic_tag>
            <.dynamic_tag :for={action <- @action} tag_name={Map.get(action, :tag, "div")} slot="action">
              {render_slot(action)}
            </.dynamic_tag>
            <%= for item <- @item do %>
              <CoreComponents.contained_list_item
                clickable={item[:clickable]}
                disabled={item[:disabled]}
              >
                {render_slot(item)}
              </CoreComponents.contained_list_item>
            <% end %>
          </CoreComponents.contained_list>
      """
    },
    %{
      name: :content_switcher,
      delegate: :core,
      patterns: ["%{item: [_ | _]}"],
      extra_slots: ~S"""
        slot :item do
          attr :label, :string
          attr :value, :string
          attr :disabled, :boolean
          attr :icon, :boolean
          attr :target, :string
        end
      """,
      body: ~S"""
          <CoreComponents.content_switcher
            icon={@icon}
            low_contrast={@low_contrast}
            selected_index={@selected_index}
            selection_mode={@selection_mode}
            size={@size}
            value={@value}
            {@rest}
          >
            <%= for item <- @item do %>
              <CoreComponents.content_switcher_item
                value={item[:value]}
                disabled={item[:disabled]}
                icon={item[:icon]}
                target={item[:target]}
              >
                {item[:label] || render_slot(item)}
              </CoreComponents.content_switcher_item>
            <% end %>
          </CoreComponents.content_switcher>
      """
    },
    %{
      name: :date_picker,
      delegate: :form,
      patterns: ["%{input: [_ | _]}"],
      extra_slots: ~S"""
        slot :input do
          attr :label, :string
          attr :placeholder, :string
          attr :value, :string
          attr :kind, :string
          attr :disabled, :boolean
          attr :invalid, :boolean
          attr :invalid_text, :string
          attr :readonly, :boolean
          attr :attrs, :map
        end
      """,
      body: ~S"""
          <FormComponents.date_picker
            allow_input={@allow_input}
            close_on_select={@close_on_select}
            date_format={@date_format}
            disabled={@disabled}
            enabled_range={@enabled_range}
            max_date={@max_date}
            min_date={@min_date}
            name={@name}
            open={@open}
            readonly={@readonly}
            value={@value}
            {@rest}
          >
            <%= for input <- @input do %>
              <CoreComponents.date_picker_input
                label_text={input[:label]}
                placeholder={input[:placeholder]}
                value={input[:value]}
                kind={input[:kind]}
                disabled={input[:disabled]}
                invalid={input[:invalid]}
                invalid_text={input[:invalid_text]}
                readonly={input[:readonly]}
                {input[:attrs] || %{}}
              />
            <% end %>
          </FormComponents.date_picker>
      """
    },
    %{
      name: :dropdown,
      delegate: :form,
      patterns: ["%{item: [_ | _]}"],
      extra_slots: ~S"""
        slot :item do
          attr :label, :string
          attr :value, :string
          attr :disabled, :boolean
        end
      """,
      body: ~S"""
          <FormComponents.dropdown
            autoalign={@autoalign}
            direction={@direction}
            disabled={@disabled}
            helper_text={@helper_text}
            hide_label={@hide_label}
            invalid={@invalid}
            invalid_text={@invalid_text}
            label={@label}
            name={@name}
            open={@open}
            read_only={@read_only}
            required={@required}
            required_validity_message={@required_validity_message}
            size={@size}
            toggle_label_closed={@toggle_label_closed}
            toggle_label_open={@toggle_label_open}
            type={@type}
            validity_message={@validity_message}
            value={@value}
            warn={@warn}
            warn_text={@warn_text}
            {@rest}
          >
            <.dynamic_tag
              :for={title <- @title_text}
              tag_name={Map.get(title, :tag, "div")}
              slot="title-text"
            >
              {render_slot(title)}
            </.dynamic_tag>
            <%= for item <- @item do %>
              <CoreComponents.dropdown_item
                value={item[:value] || item[:label]}
                disabled={item[:disabled]}
              >
                {item[:label] || render_slot(item)}
              </CoreComponents.dropdown_item>
            <% end %>
          </FormComponents.dropdown>
      """
    },
    %{
      name: :file_uploader,
      delegate: :core,
      patterns: ["%{button: [_ | _]}"],
      extra_slots: ~S"""
        slot :button do
          attr :label, :string
          attr :accept, :string
          attr :button_kind, :string
          attr :disabled, :boolean
          attr :multiple, :boolean
          attr :name, :string
          attr :size, :string
          attr :attrs, :map
        end

        slot :item do
          attr :state, :string
          attr :invalid, :boolean
          attr :icon_description, :string
          attr :attrs, :map
        end
      """,
      body: ~S"""
          <CoreComponents.file_uploader
            disabled={@disabled}
            label_description={@label_description}
            label_title={@label_title}
            {@rest}
          >
            <%= for button <- @button do %>
              <CoreComponents.file_uploader_button
                accept={button[:accept]}
                button_kind={button[:button_kind]}
                disabled={button[:disabled]}
                multiple={button[:multiple]}
                name={button[:name]}
                size={button[:size]}
                {button[:attrs] || %{}}
              >
                {button[:label] || render_slot(button)}
              </CoreComponents.file_uploader_button>
            <% end %>
            <%= for item <- @item do %>
              <CoreComponents.file_uploader_item
                state={item[:state]}
                invalid={item[:invalid]}
                icon_description={item[:icon_description]}
                {item[:attrs] || %{}}
              >
                {render_slot(item)}
              </CoreComponents.file_uploader_item>
            <% end %>
          </CoreComponents.file_uploader>
      """
    },
    %{
      name: :form,
      delegate: :core,
      patterns: ["%{}"],
      extra_attrs: ~S"""
        attr :for, :any, default: nil, doc: "form data passed to Phoenix.Component.form/1"
        attr :as, :any, default: nil, doc: "form name passed to Phoenix.Component.form/1"
        attr :action, :string, default: nil, doc: "form action"
        attr :method, :string, default: nil, doc: "form method"
        attr :multipart, :boolean, default: false, doc: "multipart form"
        attr :csrf_token, :any, default: nil, doc: "CSRF token"
        attr :errors, :list, default: nil, doc: "form errors"
      """,
      body: ~S"""
          <Phoenix.Component.form
            for={@for}
            as={@as}
            action={@action}
            method={@method}
            multipart={@multipart}
            csrf_token={@csrf_token}
            errors={@errors}
            :let={f}
            {@rest}
          >
            <CoreComponents.form>
              {render_slot(@inner_block, f)}
            </CoreComponents.form>
          </Phoenix.Component.form>
      """
    },
    %{
      name: :fluid_select,
      delegate: :form,
      patterns: ["%{item: [_ | _]}"],
      extra_slots: ~S"""
        slot :item do
          attr :label, :string
          attr :value, :string
          attr :selected, :boolean
          attr :disabled, :boolean
        end
      """,
      body: ~S"""
          <FormComponents.fluid_select
            autofocus={@autofocus}
            disabled={@disabled}
            hide_label={@hide_label}
            id={@id}
            inline={@inline}
            invalid={@invalid}
            invalid_text={@invalid_text}
            is_fluid={@is_fluid}
            multiple={@multiple}
            name={@name}
            pattern={@pattern}
            placeholder={@placeholder}
            readonly={@readonly}
            required={@required}
            required_validity_message={@required_validity_message}
            selected_index={@selected_index}
            size={@size}
            value={@value}
            warn={@warn}
            warn_text={@warn_text}
            {@rest}
          >
            <.dynamic_tag
              :for={label <- @label_text}
              tag_name={Map.get(label, :tag, "div")}
              slot="label-text"
            >
              {render_slot(label)}
            </.dynamic_tag>
            <.dynamic_tag
              :for={helper <- @helper_text}
              tag_name={Map.get(helper, :tag, "div")}
              slot="helper-text"
            >
              {render_slot(helper)}
            </.dynamic_tag>
            <.dynamic_tag
              :for={message <- @validity_message}
              tag_name={Map.get(message, :tag, "div")}
              slot="validity-message"
            >
              {render_slot(message)}
            </.dynamic_tag>
            <%= for item <- @item do %>
              <CoreComponents.select_item
                label={item[:label]}
                value={item[:value] || item[:label]}
                selected={item[:selected]}
                disabled={item[:disabled]}
              >
                {item[:label] || render_slot(item)}
              </CoreComponents.select_item>
            <% end %>
          </FormComponents.fluid_select>
      """
    },
    %{
      name: :grid,
      delegate: :core,
      patterns: ["%{column: [_ | _]}"],
      extra_slots: ~S"""
        slot :column do
          attr :sm, :string
          attr :md, :string
          attr :lg, :string
          attr :span, :string
          attr :attrs, :map
        end
      """,
      body: ~S"""
          <CoreComponents.grid
            align={@align}
            condensed={@condensed}
            full_width={@full_width}
            narrow={@narrow}
            {@rest}
          >
            <%= for column <- @column do %>
              <CoreComponents.column
                sm={column[:sm]}
                md={column[:md]}
                lg={column[:lg]}
                span={column[:span]}
                {column[:attrs] || %{}}
              >
                {render_slot(column)}
              </CoreComponents.column>
            <% end %>
          </CoreComponents.grid>
      """
    },
    %{
      name: :header,
      delegate: :core,
      patterns: ["%{name: [_ | _]}"],
      extra_slots: ~S"""
        slot :name do
          attr :href, :string
          attr :prefix, :string
          attr :attrs, :map
        end
      """,
      body: ~S"""
          <CoreComponents.header {@rest}>
            <%= for name <- @name do %>
              <CoreComponents.header_name
                href={name[:href]}
                prefix={name[:prefix]}
                {name[:attrs] || %{}}
              >
                {render_slot(name)}
              </CoreComponents.header_name>
            <% end %>
            {render_slot(@inner_block)}
          </CoreComponents.header>
      """
    },
    %{
      name: :icon,
      delegate: :core,
      patterns: ["%{name: name} when not is_nil(name)"],
      extra_attrs: ~S"""
        attr :name, :string, doc: "Carbon icon name"
      """,
      body: ~S"""
          <% icon_rest = if @class, do: Map.put(@rest || %{}, :class, @class), else: (@rest || %{}) %>
          <% size_value =
            case @size do
              size when is_integer(size) ->
                size

              size when is_binary(size) ->
                case Integer.parse(size) do
                  {value, _} -> value
                  _ -> 16
                end

              _ ->
                16
            end %>
          <Graphene.Icons.icon name={@name} size={size_value} {icon_rest} />
      """
    },
    %{
      name: :icon_button,
      delegate: :core,
      patterns: ["%{icon: [_ | _]}"],
      extra_slots: ~S"""
        slot :icon do
          attr :name, :string
          attr :size, :any
          attr :attrs, :map
        end
      """,
      body: ~S"""
          <CoreComponents.icon_button
            align={assigns[:align]}
            autoalign={assigns[:autoalign]}
            autofocus={assigns[:autofocus]}
            batch_action={assigns[:batch_action]}
            button_class_name={assigns[:button_class_name]}
            close_on_activation={assigns[:close_on_activation]}
            danger_description={assigns[:danger_description]}
            default_open={assigns[:default_open]}
            disabled={assigns[:disabled]}
            download={assigns[:download]}
            enter_delay_ms={assigns[:enter_delay_ms]}
            has_main_content={assigns[:has_main_content]}
            href={assigns[:href]}
            hreflang={assigns[:hreflang]}
            is_expressive={assigns[:is_expressive]}
            is_selected={assigns[:is_selected]}
            kind={assigns[:kind]}
            leave_delay_ms={assigns[:leave_delay_ms]}
            link_role={assigns[:link_role]}
            open_tooltip={assigns[:open_tooltip]}
            ping={assigns[:ping]}
            rel={assigns[:rel]}
            size={assigns[:size]}
            tab_index={assigns[:tab_index]}
            target={assigns[:target]}
            tooltip_alignment={assigns[:tooltip_alignment]}
            tooltip_position={assigns[:tooltip_position]}
            tooltip_text={assigns[:tooltip_text]}
            type={assigns[:type]}
            {@rest}
          >
            <%= for icon <- @icon do %>
              <% size_value =
                case icon[:size] do
                  size when is_integer(size) ->
                    size

                  size when is_binary(size) ->
                    case Integer.parse(size) do
                      {value, _} -> value
                      _ -> 16
                    end

                  _ ->
                    16
                end %>
              <% size_string = Integer.to_string(size_value) %>
              <%= if icon[:name] do %>
                <Graphene.Icons.icon name={icon[:name]} size={size_value} {icon[:attrs] || %{}} />
              <% else %>
                <CoreComponents.icon size={size_string} {icon[:attrs] || %{}}>
                  {render_slot(icon)}
                </CoreComponents.icon>
              <% end %>
            <% end %>
            {render_slot(@inner_block)}
          </CoreComponents.icon_button>
      """
    },
    %{
      name: :menu_button,
      delegate: :core,
      patterns: ["%{item: [_ | _]}"],
      extra_slots: ~S"""
        slot :item do
          attr :label, :string
          attr :disabled, :boolean
          attr :kind, :any
          attr :shortcut, :string
          attr :attrs, :map
        end

        slot :group do
          attr :label, :string
          attr :attrs, :map
        end

        slot :divider do
          attr :attrs, :map
        end
      """,
      body: ~S"""
          <CoreComponents.menu_button
            disabled={assigns[:disabled]}
            kind={assigns[:kind]}
            label={assigns[:label]}
            menu_alignment={assigns[:menu_alignment]}
            menu_background_token={assigns[:menu_background_token]}
            menu_border={assigns[:menu_border]}
            size={assigns[:size]}
            tab_index={assigns[:tab_index]}
            {@rest}
          >
            <CoreComponents.menu>
              {render_menu_items(assigns)}
            </CoreComponents.menu>
          </CoreComponents.menu_button>
      """
    },
    %{
      name: :ordered_list,
      delegate: :core,
      patterns: ["%{item: [_ | _]}"],
      extra_slots: ~S"""
        slot :item do
          attr :attrs, :map
        end
      """,
      body: ~S"""
          <CoreComponents.ordered_list
            is_expressive={@is_expressive}
            native={@native}
            nested={@nested}
            {@rest}
          >
            <%= for item <- @item do %>
              <CoreComponents.list_item {item[:attrs] || %{}}>
                {render_slot(item)}
              </CoreComponents.list_item>
            <% end %>
            {render_slot(@inner_block)}
          </CoreComponents.ordered_list>
      """
    },
    %{
      name: :unordered_list,
      delegate: :core,
      patterns: ["%{item: [_ | _]}"],
      extra_slots: ~S"""
        slot :item do
          attr :attrs, :map
        end
      """,
      body: ~S"""
          <CoreComponents.unordered_list
            is_expressive={@is_expressive}
            nested={@nested}
            {@rest}
          >
            <%= for item <- @item do %>
              <CoreComponents.list_item {item[:attrs] || %{}}>
                {render_slot(item)}
              </CoreComponents.list_item>
            <% end %>
            {render_slot(@inner_block)}
          </CoreComponents.unordered_list>
      """
    },
    %{
      name: :modal,
      delegate: :core,
      patterns: [
        "%{body: [_ | _]}",
        "%{footer_button: [_ | _]}",
        "%{label: [_ | _]}",
        "%{heading: [_ | _]}"
      ],
      extra_slots: ~S"""
        slot :label
        slot :heading
        slot :body

        slot :footer_button do
          attr :label, :string
          attr :kind, :string
          attr :disabled, :boolean
          attr :type, :string
          attr :autofocus, :boolean
          attr :attrs, :map
        end
      """,
      body: ~S"""
          <CoreComponents.modal
            alert={@alert}
            container_class={@container_class}
            full_width={@full_width}
            has_scrolling_content={@has_scrolling_content}
            loading_description={@loading_description}
            loading_icon_description={@loading_icon_description}
            loading_status={@loading_status}
            loading_success_delay={@loading_success_delay}
            open={@open}
            prevent_close={@prevent_close}
            prevent_close_on_click_outside={@prevent_close_on_click_outside}
            should_submit_on_enter={@should_submit_on_enter}
            size={@size}
            {@rest}
          >
            <CoreComponents.modal_header>
              <%= for label <- @label do %>
                <CoreComponents.modal_label>{render_slot(label)}</CoreComponents.modal_label>
              <% end %>
              <%= for heading <- @heading do %>
                <CoreComponents.modal_heading>{render_slot(heading)}</CoreComponents.modal_heading>
              <% end %>
            </CoreComponents.modal_header>
            <CoreComponents.modal_body :if={@body != []}>
              <CoreComponents.modal_body_content>
                <%= for body <- @body do %>
                  {render_slot(body)}
                <% end %>
              </CoreComponents.modal_body_content>
            </CoreComponents.modal_body>
            <CoreComponents.modal_footer :if={@footer_button != []}>
              <%= for button <- @footer_button do %>
                <CoreComponents.modal_footer_button
                  kind={button[:kind]}
                  disabled={button[:disabled]}
                  type={button[:type]}
                  autofocus={button[:autofocus]}
                  {button[:attrs] || %{}}
                >
                  {button[:label] || render_slot(button)}
                </CoreComponents.modal_footer_button>
              <% end %>
            </CoreComponents.modal_footer>
            {render_slot(@inner_block)}
          </CoreComponents.modal>
      """
    },
    %{
      name: :multi_select,
      delegate: :form,
      patterns: ["%{item: [_ | _]}"],
      extra_slots: ~S"""
        slot :item do
          attr :label, :string
          attr :value, :string
          attr :selected, :boolean
          attr :disabled, :boolean
        end
      """,
      body: ~S"""
          <FormComponents.multi_select
            autoalign={@autoalign}
            clear_selection_label={@clear_selection_label}
            clear_selection_text={@clear_selection_text}
            direction={@direction}
            disabled={@disabled}
            filterable={@filterable}
            helper_text={@helper_text}
            hide_label={@hide_label}
            invalid={@invalid}
            invalid_text={@invalid_text}
            label={@label}
            locale={@locale}
            name={@name}
            open={@open}
            read_only={@read_only}
            required={@required}
            required_validity_message={@required_validity_message}
            select_all={@select_all}
            selection_feedback={@selection_feedback}
            size={@size}
            toggle_label_closed={@toggle_label_closed}
            toggle_label_open={@toggle_label_open}
            type={@type}
            validity_message={@validity_message}
            value={@value}
            warn={@warn}
            warn_text={@warn_text}
            {@rest}
          >
            <.dynamic_tag
              :for={title <- @title_text}
              tag_name={Map.get(title, :tag, "div")}
              slot="title-text"
            >
              {render_slot(title)}
            </.dynamic_tag>
            <%= for item <- @item do %>
              <CoreComponents.multi_select_item
                value={item[:value] || item[:label]}
                disabled={item[:disabled]}
              >
                {item[:label] || render_slot(item)}
              </CoreComponents.multi_select_item>
            <% end %>
          </FormComponents.multi_select>
      """
    },
    %{
      name: :overflow_menu,
      delegate: :core,
      patterns: ["%{item: [_ | _]}"],
      extra_slots: ~S"""
        slot :item do
          attr :label, :string
          attr :disabled, :boolean
          attr :danger, :boolean
        end
      """,
      body: ~S"""
          <CoreComponents.overflow_menu
            align={assigns[:align]}
            autoalign={assigns[:autoalign]}
            autofocus={assigns[:autofocus]}
            batch_action={assigns[:batch_action]}
            breadcrumb={assigns[:breadcrumb]}
            button_class_name={assigns[:button_class_name]}
            close_on_activation={assigns[:close_on_activation]}
            danger_description={assigns[:danger_description]}
            data_table={assigns[:data_table]}
            default_open={assigns[:default_open]}
            disabled={assigns[:disabled]}
            download={assigns[:download]}
            enter_delay_ms={assigns[:enter_delay_ms]}
            flipped={assigns[:flipped]}
            has_main_content={assigns[:has_main_content]}
            href={assigns[:href]}
            hreflang={assigns[:hreflang]}
            index={assigns[:index]}
            is_expressive={assigns[:is_expressive]}
            is_selected={assigns[:is_selected]}
            kind={assigns[:kind]}
            leave_delay_ms={assigns[:leave_delay_ms]}
            link_role={assigns[:link_role]}
            open={assigns[:open]}
            open_tooltip={assigns[:open_tooltip]}
            ping={assigns[:ping]}
            rel={assigns[:rel]}
            size={assigns[:size]}
            tab_index={assigns[:tab_index]}
            target={assigns[:target]}
            toolbar_action={assigns[:toolbar_action]}
            tooltip_alignment={assigns[:tooltip_alignment]}
            tooltip_position={assigns[:tooltip_position]}
            tooltip_text={assigns[:tooltip_text]}
            type={assigns[:type]}
            {@rest}
          >
            <.dynamic_tag :for={icon <- @icon} tag_name={Map.get(icon, :tag, "span")} slot="icon">
              {render_slot(icon)}
            </.dynamic_tag>
            <.dynamic_tag
              :for={tooltip <- @tooltip_content}
              tag_name={Map.get(tooltip, :tag, "span")}
              slot="tooltip-content"
            >
              {render_slot(tooltip)}
            </.dynamic_tag>
            <CoreComponents.overflow_menu_body>
              <%= for item <- @item do %>
                <CoreComponents.overflow_menu_item disabled={item[:disabled]} danger={item[:danger]}>
                  {item[:label] || render_slot(item)}
                </CoreComponents.overflow_menu_item>
              <% end %>
            </CoreComponents.overflow_menu_body>
          </CoreComponents.overflow_menu>
      """
    },
    %{
      name: :page_header,
      delegate: :core,
      patterns: ["%{breadcrumb_slot: [_ | _]}", "%{breadcrumb: [_ | _]}"],
      extra_slots: ~S"""
        slot :breadcrumb do
          attr :border, :boolean
          attr :content_actions_flush, :boolean
          attr :page_actions_flush, :boolean
          attr :within_grid, :boolean
        end

        slot :breadcrumb_slot do
          attr :border, :boolean
          attr :content_actions_flush, :boolean
          attr :page_actions_flush, :boolean
          attr :within_grid, :boolean
        end

        slot :content do
          attr :title, :string
          attr :within_grid, :boolean
        end

        slot :content_text do
          attr :subtitle, :string
        end
      """,
      body: ~S"""
          <CoreComponents.page_header {@rest}>
            <% breadcrumbs = if @breadcrumb_slot != [], do: @breadcrumb_slot, else: @breadcrumb %>
            <%= for breadcrumb <- breadcrumbs do %>
              <CoreComponents.page_header_breadcrumb
                border={Map.get(breadcrumb, :border, true)}
                content_actions_flush={breadcrumb[:content_actions_flush]}
                page_actions_flush={breadcrumb[:page_actions_flush]}
                within_grid={breadcrumb[:within_grid]}
              >
                <%= if breadcrumb.inner_block do %>
                  {render_slot(breadcrumb)}
                <% end %>
              </CoreComponents.page_header_breadcrumb>
            <% end %>
            <%= for content <- @content do %>
              <CoreComponents.page_header_content
                title={content[:title]}
                within_grid={content[:within_grid]}
              >
                <%= if @content_text != [] do %>
                  <%= for text <- @content_text do %>
                    <CoreComponents.page_header_content_text subtitle={text[:subtitle]}>
                      <%= if text.inner_block do %>
                        {render_slot(text)}
                      <% end %>
                    </CoreComponents.page_header_content_text>
                  <% end %>
                <% end %>
                <%= if content.inner_block do %>
                  {render_slot(content)}
                <% end %>
              </CoreComponents.page_header_content>
            <% end %>
            {render_slot(@inner_block)}
          </CoreComponents.page_header>
      """
    },
    %{
      name: :popover,
      delegate: :core,
      patterns: ["%{content: [_ | _]}"],
      extra_slots: ~S"""
        slot :trigger
        slot :content
      """,
      body: ~S"""
          <CoreComponents.popover
            align={@align}
            alignment_axis_offset={@alignment_axis_offset}
            autoalign={@autoalign}
            autoalign_boundary={@autoalign_boundary}
            background_token={@background_token}
            border={@border}
            caret={@caret}
            drop_shadow={@drop_shadow}
            high_contrast={@high_contrast}
            open={@open}
            tab_tip={@tab_tip}
            {@rest}
          >
            <%= for trigger <- @trigger do %>
              {render_slot(trigger)}
            <% end %>
            <%= for content <- @content do %>
              <CoreComponents.popover_content>
                {render_slot(content)}
              </CoreComponents.popover_content>
            <% end %>
            {render_slot(@inner_block)}
          </CoreComponents.popover>
      """
    },
    %{
      name: :progress_indicator,
      delegate: :core,
      patterns: ["%{step: [_ | _]}"],
      extra_slots: ~S"""
        slot :step do
          attr :label, :string
          attr :description, :string
          attr :secondary_label, :string
          attr :secondary_label_text, :string
          attr :complete, :boolean
          attr :current, :boolean
          attr :disabled, :boolean
          attr :invalid, :boolean
          attr :icon_label, :string
          attr :clickable, :boolean
        end
      """,
      body: ~S"""
          <CoreComponents.progress_indicator
            current_index={@current_index}
            space_equally={@space_equally}
            vertical={@vertical}
            {@rest}
          >
            <%= for step <- @step do %>
              <CoreComponents.progress_step
                label={step[:label]}
                description={step[:description]}
                secondary_label={step[:secondary_label]}
                complete={step[:complete]}
                current={step[:current]}
                disabled={step[:disabled]}
                invalid={step[:invalid]}
                icon_label={step[:icon_label]}
                clickable={step[:clickable]}
              >
                <%= if step[:secondary_label_text] do %>
                  <span slot="secondary-label-text">{step[:secondary_label_text]}</span>
                <% end %>
              </CoreComponents.progress_step>
            <% end %>
          </CoreComponents.progress_indicator>
      """
    },
    %{
      name: :radio_button_group,
      delegate: :form,
      patterns: ["%{item: [_ | _]}"],
      extra_slots: ~S"""
        slot :item do
          attr :label, :string
          attr :value, :string
          attr :checked, :boolean
          attr :disabled, :boolean
        end
      """,
      body: ~S"""
          <FormComponents.radio_button_group
            default_selected={@default_selected}
            disabled={@disabled}
            helper_text={@helper_text}
            invalid={@invalid}
            invalid_text={@invalid_text}
            label_position={@label_position}
            legend_text={@legend_text}
            name={@name}
            orientation={@orientation}
            read_only={@read_only}
            required={@required}
            value={@value}
            warn={@warn}
            warn_text={@warn_text}
            {@rest}
          >
            <%= for item <- @item do %>
              <CoreComponents.radio_button
                label_text={item[:label]}
                value={item[:value]}
                checked={item[:checked]}
                disabled={item[:disabled]}
              />
            <% end %>
          </FormComponents.radio_button_group>
      """
    },
    %{
      name: :select,
      delegate: :form,
      patterns: ["%{item: [_ | _]}"],
      extra_slots: ~S"""
        slot :item do
          attr :label, :string
          attr :value, :string
          attr :selected, :boolean
          attr :disabled, :boolean
        end
      """,
      body: ~S"""
          <FormComponents.select
            autofocus={@autofocus}
            disabled={@disabled}
            hide_label={@hide_label}
            id={@id}
            inline={@inline}
            invalid={@invalid}
            invalid_text={@invalid_text}
            is_fluid={@is_fluid}
            multiple={@multiple}
            name={@name}
            pattern={@pattern}
            placeholder={@placeholder}
            readonly={@readonly}
            required={@required}
            required_validity_message={@required_validity_message}
            selected_index={@selected_index}
            size={@size}
            value={@value}
            warn={@warn}
            warn_text={@warn_text}
            {@rest}
          >
            <.dynamic_tag
              :for={label <- @label_text}
              tag_name={Map.get(label, :tag, "div")}
              slot="label-text"
            >
              {render_slot(label)}
            </.dynamic_tag>
            <.dynamic_tag
              :for={helper <- @helper_text}
              tag_name={Map.get(helper, :tag, "div")}
              slot="helper-text"
            >
              {render_slot(helper)}
            </.dynamic_tag>
            <.dynamic_tag
              :for={message <- @validity_message}
              tag_name={Map.get(message, :tag, "div")}
              slot="validity-message"
            >
              {render_slot(message)}
            </.dynamic_tag>
            <%= for item <- @item do %>
              <CoreComponents.select_item
                label={item[:label]}
                value={item[:value] || item[:label]}
                selected={item[:selected]}
                disabled={item[:disabled]}
              >
                {item[:label] || render_slot(item)}
              </CoreComponents.select_item>
            <% end %>
          </FormComponents.select>
      """
    },
    %{
      name: :structured_list,
      delegate: :core,
      patterns: ["%{rows: rows, col: [_ | _]} when is_list(rows)"],
      extra_attrs: ~S"""
        attr :rows, :list, default: nil
        attr :row_id, :any, default: nil
        attr :selected_ids, :list, default: nil
      """,
      extra_slots: ~S"""
        slot :col do
          attr :label, :any
        end
      """,
      prelude: ~S"""
          assigns =
            assigns
            |> assign(:selected_set, MapSet.new(Enum.map(assigns.selected_ids || [], &to_string/1)))
      """,
      body: ~S"""
          <CoreComponents.structured_list
            condensed={@condensed}
            flush={@flush}
            selection_name={@selection_name}
            {@rest}
          >
            <CoreComponents.structured_list_head>
              <CoreComponents.structured_list_header_row selection_name={@selection_name}>
                <CoreComponents.structured_list_header_cell :for={col <- @col}>
                  {render_column_label(col[:label])}
                </CoreComponents.structured_list_header_cell>
              </CoreComponents.structured_list_header_row>
            </CoreComponents.structured_list_head>
            <CoreComponents.structured_list_body>
              <%= for {row, index} <- Enum.with_index(@rows) do %>
                <CoreComponents.structured_list_row
                  selection_name={@selection_name}
                  selection_value={structured_list_row_id(@row_id, row, index)}
                  selected={structured_list_selected?(@selected_set, @row_id, row, index)}
                >
                  <CoreComponents.structured_list_cell :for={col <- @col}>
                    {render_slot(col, row)}
                  </CoreComponents.structured_list_cell>
                </CoreComponents.structured_list_row>
              <% end %>
            </CoreComponents.structured_list_body>
          </CoreComponents.structured_list>
      """
    },
    %{
      name: :tabs,
      delegate: :core,
      patterns: ["%{tab: [_ | _]}"],
      extra_slots: ~S"""
        slot :tab do
          attr :title, :string
          attr :target, :string
          attr :disabled, :boolean
          attr :value, :string
        end
      """,
      body: ~S"""
          <CoreComponents.tabs
            icon={@icon}
            low_contrast={@low_contrast}
            selected_index={@selected_index}
            selected_item_assistive_text={@selected_item_assistive_text}
            selecting_items_assistive_text={@selecting_items_assistive_text}
            selection_mode={@selection_mode}
            size={@size}
            trigger_content={@trigger_content}
            type={@type}
            value={@value}
            {@rest}
          >
            <%= for tab <- @tab do %>
              <CoreComponents.tab
                tab_title={tab[:title]}
                target={tab[:target]}
                disabled={tab[:disabled]}
                value={tab[:value]}
              >
                {render_slot(tab)}
              </CoreComponents.tab>
            <% end %>
          </CoreComponents.tabs>
      """
    },
    %{
      name: :time_picker,
      delegate: :form,
      patterns: ["%{select_item: [_ | _]}"],
      extra_slots: ~S"""
        slot :select_item do
          attr :label, :string
          attr :value, :string
          attr :selected, :boolean
          attr :disabled, :boolean
        end
      """,
      body: ~S"""
          <FormComponents.time_picker
            disabled={@disabled}
            hide_label={@hide_label}
            invalid={@invalid}
            invalid_text={@invalid_text}
            max_length={@max_length}
            name={@name}
            pattern={@pattern}
            placeholder={@placeholder}
            read_only={@read_only}
            required={@required}
            required_validity_message={@required_validity_message}
            size={@size}
            type={@type}
            value={@value}
            warning={@warning}
            warning_text={@warning_text}
            {@rest}
          >
            <.dynamic_tag
              :for={label <- @label_text}
              tag_name={Map.get(label, :tag, "div")}
              slot="label-text"
            >
              {render_slot(label)}
            </.dynamic_tag>
            <.dynamic_tag
              :for={message <- @validity_message}
              tag_name={Map.get(message, :tag, "div")}
              slot="validity-message"
            >
              {render_slot(message)}
            </.dynamic_tag>
            <CoreComponents.time_picker_select>
            <%= for item <- @select_item do %>
              <CoreComponents.select_item
                label={item[:label]}
                value={item[:value] || item[:label]}
                selected={item[:selected]}
                disabled={item[:disabled]}
              >
                {item[:label] || render_slot(item)}
              </CoreComponents.select_item>
            <% end %>
            </CoreComponents.time_picker_select>
          </FormComponents.time_picker>
      """
    },
    %{
      name: :toggletip,
      delegate: :core,
      patterns: ["%{action: [_ | _]}", "%{actions: [_ | _]}"],
      extra_slots: ~S"""
        slot :action do
          attr :tag, :string
        end
      """,
      body: ~S"""
          <CoreComponents.toggletip
            alignment={@alignment}
            alignment_axis_offset={@alignment_axis_offset}
            autoalign={@autoalign}
            button_label={@button_label}
            default_open={@default_open}
            open={@open}
            {@rest}
          >
            {render_slot(@inner_block)}
            <.dynamic_tag
              :for={s <- @body_text}
              tag_name={Map.get(s, :tag, "div")}
              slot="body-text"
            >
              {render_slot(s)}
            </.dynamic_tag>
            <.dynamic_tag
              :for={s <- @actions ++ @action}
              tag_name={Map.get(s, :tag, "div")}
              slot="actions"
            >
              {render_slot(s)}
            </.dynamic_tag>
          </CoreComponents.toggletip>
      """
    },
    %{
      name: :tooltip,
      delegate: :core,
      patterns: ["%{content: [_ | _]}"],
      extra_slots: ~S"""
        slot :trigger
        slot :content do
          attr :id, :string
          attr :attrs, :map
        end
      """,
      body: ~S"""
          <CoreComponents.tooltip
            align={@align}
            alignment_axis_offset={@alignment_axis_offset}
            autoalign={@autoalign}
            autoalign_boundary={@autoalign_boundary}
            background_token={@background_token}
            border={@border}
            caret={@caret}
            close_on_activation={@close_on_activation}
            data_table={@data_table}
            default_open={@default_open}
            drop_shadow={@drop_shadow}
            enter_delay_ms={@enter_delay_ms}
            high_contrast={@high_contrast}
            keyboard_only={@keyboard_only}
            leave_delay_ms={@leave_delay_ms}
            open={@open}
            size={@size}
            tab_tip={@tab_tip}
            timeout_id={@timeout_id}
            toolbar_action={@toolbar_action}
            {@rest}
          >
            <%= for trigger <- @trigger do %>
              {render_slot(trigger)}
            <% end %>
            <%= for content <- @content do %>
              <CoreComponents.tooltip_content
                id={content[:id]}
                {content[:attrs] || %{}}
              >
                {render_slot(content)}
              </CoreComponents.tooltip_content>
            <% end %>
            {render_slot(@inner_block)}
          </CoreComponents.tooltip>
      """
    },
    %{
      name: :tree_view,
      delegate: :core,
      patterns: ["%{node: [_ | _]}"],
      extra_slots: ~S"""
        slot :node do
          attr :label, :string
          attr :active, :boolean
          attr :disabled, :boolean
          attr :href, :string
          attr :id, :string
          attr :is_expanded, :boolean
          attr :selected, :boolean
          attr :on_click, :any
        end
      """,
      body: ~S"""
          <CoreComponents.tree_view
            hide_label={@hide_label}
            label={@label}
            size={@size}
            {@rest}
          >
            <%= for node <- @node do %>
              <CoreComponents.tree_node
                label={node[:label]}
                active={node[:active]}
                disabled={node[:disabled]}
                href={node[:href]}
                id={node[:id]}
                is_expanded={node[:is_expanded]}
                selected={node[:selected]}
                on_click={node[:on_click]}
              >
                <%= if node.inner_block do %>
                  {render_slot(node)}
                <% end %>
              </CoreComponents.tree_node>
            <% end %>
          </CoreComponents.tree_view>
      """
    }
  ]

  def carbon_component_recipes, do: @carbon_component_recipes

  def append_missing_components(components) do
    Enum.reduce(@manual_components, components, fn component, acc ->
      if Enum.any?(acc, &(&1.htmltag == component.htmltag)) do
        acc
      else
        acc ++ [component]
      end
    end)
  end

  defp set_step_default(component) do
    %{component | attrs: Enum.map(component.attrs, &set_step_attr_default/1)}
  end

  defp set_number_input_bounds_default(component) do
    component
    |> set_attr_default("min", "-Infty")
    |> set_attr_default("max", "Infty")
  end

  defp set_attr_default(component, htmlname, default) do
    attrs =
      Enum.map(component.attrs, fn attr ->
        if attr.htmlname == htmlname and Keyword.get(attr.opts, :default) in [nil, :__missing__] do
          %{attr | opts: Keyword.put(attr.opts, :default, default)}
        else
          attr
        end
      end)

    %{component | attrs: attrs}
  end

  defp add_missing_slots(%{htmltag: "cds-accordion-item"} = component) do
    ensure_attr(component, %{
      "name" => "controlled",
      "type" => "boolean",
      "description" => "Whether the item is controlled by the parent."
    })
  end

  defp add_missing_slots(%{htmltag: "cds-actionable-notification"} = component) do
    ensure_slot(component, %{
      "name" => "action",
      "description" => "Action content for the notification."
    })
  end

  defp add_missing_slots(%{htmltag: "cds-combo-box"} = component) do
    ensure_attr(component, %{
      "name" => "controlled",
      "type" => "boolean",
      "description" => "Whether the combobox is controlled."
    })
  end

  defp add_missing_slots(%{htmltag: "cds-content-switcher-item"} = component) do
    ensure_slot(component, %{
      "name" => "tooltip-content",
      "description" => "Tooltip content for the item."
    })
  end

  defp add_missing_slots(%{htmltag: "cds-definition-tooltip"} = component) do
    ensure_slot(component, %{
      "name" => "definition",
      "description" => "Definition content."
    })
  end

  defp add_missing_slots(%{htmltag: "cds-dropdown"} = component) do
    ensure_slot(component, %{
      "name" => "title-text",
      "description" => "Title text content."
    })
  end

  defp add_missing_slots(%{htmltag: "cds-expandable-tile"} = component) do
    ensure_slot(component, %{
      "name" => "above-the-fold-content",
      "description" => "Above-the-fold content."
    })
  end

  defp add_missing_slots(%{htmltag: "cds-file-uploader"} = component) do
    component
    |> ensure_attr(%{
      "name" => "multiple",
      "type" => "boolean",
      "description" => "`true` to enable multiple selection."
    })
    |> ensure_attr(%{
      "name" => "inputState",
      "attribute" => "input-state",
      "type" => "string",
      "description" => "Input state for the uploader."
    })
    |> ensure_attr(%{
      "name" => "inputName",
      "attribute" => "input-name",
      "type" => "string",
      "description" => "Name attribute for the input."
    })
    |> ensure_attr(%{
      "name" => "iconDescription",
      "attribute" => "icon-description",
      "type" => "string",
      "description" => "Description for the status icon."
    })
  end

  defp add_missing_slots(%{htmltag: "cds-icon-button"} = component) do
    ensure_slot(component, %{
      "name" => "tooltip-content",
      "description" => "Tooltip content."
    })
  end

  defp add_missing_slots(%{htmltag: "cds-inline-loading"} = component) do
    ensure_attr(component, %{
      "name" => "controlled",
      "type" => "boolean",
      "description" => "Whether the loading state is controlled."
    })
  end

  defp add_missing_slots(%{htmltag: "cds-menu"} = component) do
    component
    |> ensure_attr(%{
      "name" => "open",
      "type" => "boolean",
      "description" => "Whether the menu is open."
    })
    |> ensure_attr(%{
      "name" => "size",
      "type" => "string",
      "description" => "Menu size."
    })
    |> ensure_attr(%{
      "name" => "label",
      "type" => "string",
      "description" => "Menu label."
    })
    |> ensure_attr(%{
      "name" => "border",
      "type" => "boolean",
      "description" => "Whether the menu has a border."
    })
    |> ensure_attr(%{
      "name" => "backgroundToken",
      "attribute" => "background-token",
      "type" => "string",
      "description" => "Background token for the menu."
    })
    |> ensure_attr(%{
      "name" => "menuAlignment",
      "attribute" => "menu-alignment",
      "type" => "string",
      "description" => "Alignment of the menu."
    })
  end

  defp add_missing_slots(%{htmltag: "cds-menu-item"} = component) do
    component
    |> ensure_attr(%{
      "name" => "selected",
      "type" => "boolean",
      "description" => "Whether the menu item is selected."
    })
    |> ensure_slot(%{
      "name" => "submenu",
      "description" => "Submenu content."
    })
  end

  defp add_missing_slots(%{htmltag: "cds-multi-select"} = component) do
    ensure_slot(component, %{
      "name" => "title-text",
      "description" => "Title text content."
    })
  end

  defp add_missing_slots(%{htmltag: "cds-multi-select-item"} = component) do
    ensure_attr(component, %{
      "name" => "selected",
      "type" => "boolean",
      "description" => "Whether the item is selected."
    })
  end

  defp add_missing_slots(%{htmltag: "cds-page-header-breadcrumb"} = component) do
    component
    |> ensure_slot(%{
      "name" => "content-actions",
      "description" => "Content actions for the breadcrumb."
    })
    |> ensure_slot(%{
      "name" => "page-actions",
      "description" => "Page actions for the breadcrumb."
    })
  end

  defp add_missing_slots(%{htmltag: "cds-page-header-content"} = component) do
    component
    |> ensure_slot(%{
      "name" => "contextual-actions",
      "description" => "Contextual actions for the page header."
    })
    |> ensure_slot(%{
      "name" => "page-actions",
      "description" => "Page actions for the page header."
    })
  end

  defp add_missing_slots(%{htmltag: "cds-page-header-tabs"} = component) do
    ensure_slot(component, %{
      "name" => "tags",
      "description" => "Tags for the page header."
    })
  end

  defp add_missing_slots(%{htmltag: "cds-radio-button"} = component) do
    ensure_slot(component, %{
      "name" => "ai-label",
      "description" => "AI label content."
    })
  end

  defp add_missing_slots(%{htmltag: "cds-search"} = component) do
    ensure_attr(component, %{
      "name" => "colorScheme",
      "attribute" => "color-scheme",
      "type" => "string",
      "description" => "Color scheme for the search."
    })
  end

  defp add_missing_slots(%{htmltag: "cds-select-item"} = component) do
    ensure_attr(component, %{
      "name" => "text",
      "type" => "string",
      "description" => "Text for the select item."
    })
  end

  defp add_missing_slots(%{htmltag: "cds-side-nav"} = component) do
    ensure_attr(component, %{
      "name" => "usageMode",
      "attribute" => "usage-mode",
      "type" => "string",
      "description" => "Usage mode for the side nav."
    })
  end

  defp add_missing_slots(%{htmltag: "cds-slider"} = component) do
    component
    |> ensure_attr(%{
      "name" => "controlled",
      "type" => "boolean",
      "description" => "Whether the slider is controlled."
    })
    |> ensure_attr(%{
      "name" => "formatLabel",
      "attribute" => "format-label",
      "type" => "any",
      "description" => "Formatter for the slider label."
    })
    |> ensure_slot(%{
      "name" => "lower-input",
      "description" => "Lower input content."
    })
  end

  defp add_missing_slots(%{htmltag: "cds-slider-input"} = component) do
    ensure_attr(component, %{
      "name" => "required",
      "type" => "boolean",
      "description" => "Whether the input is required."
    })
  end

  defp add_missing_slots(%{htmltag: "cds-tabs"} = component) do
    ensure_attr(component, %{
      "name" => "disabled",
      "type" => "boolean",
      "description" => "Whether the tabs are disabled."
    })
  end

  defp add_missing_slots(%{htmltag: "cds-tile"} = component) do
    ensure_slot(component, %{
      "name" => "decorator",
      "description" => "Decorator content."
    })
  end

  defp add_missing_slots(%{htmltag: "cds-tile-group"} = component) do
    ensure_slot(component, %{
      "name" => "legend",
      "description" => "Legend content."
    })
  end

  defp add_missing_slots(%{htmltag: "cds-tree-view"} = component) do
    component
    |> ensure_attr(%{
      "name" => "controlled",
      "type" => "boolean",
      "description" => "Whether the tree view is controlled."
    })
    |> ensure_attr(%{
      "name" => "links",
      "type" => "boolean",
      "description" => "Whether the tree view renders links."
    })
  end

  defp add_missing_slots(%{htmltag: "feature-flags"} = component) do
    ensure_attr(component, %{
      "name" => "enableV12ToggleReducedLabelSpacing",
      "attribute" => "enable-v12-toggle-reduced-label-spacing",
      "type" => "boolean",
      "description" => "Enable reduced label spacing for v12 toggle."
    })
  end

  defp add_missing_slots(component), do: component

  defp resolve_slot_collisions(component) do
    slot_names =
      component.slots
      |> Enum.map(&Util.kebab2snake(&1.htmlname))
      |> MapSet.new()

    attrs =
      component.attrs
      |> Enum.reject(fn attr ->
        attr_name = Util.kebab2snake(attr.htmlname)
        MapSet.member?(slot_names, attr_name)
      end)

    %{component | attrs: attrs}
  end

  defp ensure_attr(component, %{"name" => name} = attr) do
    exists? = Enum.any?(component.attrs, &(&1.htmlname == name))

    if exists? do
      component
    else
      %{component | attrs: component.attrs ++ [Attr.parse(attr)]}
    end
  end

  defp ensure_slot(component, %{"name" => name} = slot) do
    exists? = Enum.any?(component.slots, &(&1.htmlname == name))

    if exists? do
      component
    else
      %{component | slots: component.slots ++ [Slot.parse(slot)]}
    end
  end

  defp set_step_attr_default(%{htmlname: "step"} = attr) do
    %{attr | opts: Keyword.put(attr.opts, :default, "1")}
  end

  defp set_step_attr_default(attr), do: attr
end
