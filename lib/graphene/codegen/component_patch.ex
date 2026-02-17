defmodule Graphene.CodeGen.ComponentPatches do
  @moduledoc """
  Known Patches for components code generation
  """
  alias Graphene.CodeGen.Component
  alias Graphene.CodeGen.Component.{Attr, Slot}

  def patch(
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

  def patch(
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

  def patch(
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

  def patch(
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

  def patch(%{htmltag: "cds-copy"} = component) do
    %{component | import: "./src/components/copy/copy.js"}
  end

  def patch(%{htmltag: "cds-number-input"} = component) do
    set_step_default(component)
  end

  def patch(%{htmltag: "cds-fluid-number-input"} = component) do
    set_step_default(component)
  end

  def patch(%{htmltag: "cds-button", slots: []} = component) do
    %{component | slots: [Slot.parse(%{"name" => "icon", "description" => "Icon."})]}
  end

  def patch(%{htmltag: "cds-table", slots: []} = component) do
    %{
      component
      | slots: [
          Slot.parse(%{"name" => "title", "description" => "Title"}),
          Slot.parse(%{"name" => "description", "description" => "Description"}),
          Slot.parse(%{"name" => "toolbar", "description" => "Toolbar"})
        ]
    }
  end

  def patch(%{htmltag: "cds-table-row"} = component) do
    ensure_attr(
      component,
      %{
        "name" => "radio",
        "type" => "boolean",
        "default" => "false",
        "description" => "Specify whether the control should be a radio button or inline checkbox."
      }
    )
  end

  def patch(component), do: component

  @manual_components [
    %Component{
      htmltag: "cds-menu",
      componentname: "menu",
      source: "./src/components/menu/menu.ts",
      docs: """
      Component `<cds-menu>` from `./src/components/menu/menu.ts`

      Menu.
      """,
      attrs: [],
      slots: []
    }
  ]


  def carbon_component_overrides do
    MapSet.new([:menu])
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
      label={@label}
      size={@size}
      {@rest}
    >
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
      title_text={@title_text}
      toggle_label_closed={@toggle_label_closed}
      toggle_label_open={@toggle_label_open}
      type={@type}
      validity_message={@validity_message}
      value={@value}
      warn={@warn}
      warn_text={@warn_text}
      {@rest}
    >
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
      helper_text={@helper_text}
      hide_label={@hide_label}
      id={@id}
      inline={@inline}
      invalid={@invalid}
      invalid_text={@invalid_text}
      is_fluid={@is_fluid}
      label_text={@label_text}
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
      <%= for item <- @item do %>
        <CoreComponents.select_item
          label={item[:label]}
          value={item[:value] || item[:label]}
          selected={item[:selected]}
          disabled={item[:disabled]}
        />
      <% end %>
    </FormComponents.fluid_select>
"""
    },
    %{
      name: :fluid_time_picker,
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
      label_text={@label_text}
      max_length={@max_length}
      name={@name}
      pattern={@pattern}
      placeholder={@placeholder}
      read_only={@read_only}
      required={@required}
      required_validity_message={@required_validity_message}
      size={@size}
      type={@type}
      validity_message={@validity_message}
      value={@value}
      warning={@warning}
      warning_text={@warning_text}
      {@rest}
    >
      <CoreComponents.time_picker_select>
        <%= for item <- @select_item do %>
          <CoreComponents.select_item
            label={item[:label]}
            value={item[:value] || item[:label]}
            selected={item[:selected]}
            disabled={item[:disabled]}
          />
        <% end %>
      </CoreComponents.time_picker_select>
    </FormComponents.time_picker>
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
      name: :modal,
      delegate: :core,
      patterns: [
        "%{body: [_ | _]}",
        "%{footer_button: [_ | _]}",
        "%{label: label, heading: heading} when not is_nil(label) or not is_nil(heading)"
      ],
      extra_slots: ~S"""
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
        <CoreComponents.modal_label :if={@label}>{@label}</CoreComponents.modal_label>
        <CoreComponents.modal_heading :if={@heading}>{@heading}</CoreComponents.modal_heading>
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
      title_text={@title_text}
      toggle_label_closed={@toggle_label_closed}
      toggle_label_open={@toggle_label_open}
      type={@type}
      validity_message={@validity_message}
      value={@value}
      warn={@warn}
      warn_text={@warn_text}
      {@rest}
    >
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
      align={@align}
      autoalign={@autoalign}
      autofocus={@autofocus}
      batch_action={@batch_action}
      breadcrumb={@breadcrumb}
      button_class_name={@button_class_name}
      close_on_activation={@close_on_activation}
      danger_description={@danger_description}
      data_table={@data_table}
      default_open={@default_open}
      disabled={@disabled}
      download={@download}
      enter_delay_ms={@enter_delay_ms}
      flipped={@flipped}
      has_main_content={@has_main_content}
      href={@href}
      hreflang={@hreflang}
      index={@index}
      is_expressive={@is_expressive}
      is_selected={@is_selected}
      kind={@kind}
      leave_delay_ms={@leave_delay_ms}
      link_role={@link_role}
      open={@open}
      open_tooltip={@open_tooltip}
      ping={@ping}
      rel={@rel}
      size={@size}
      tab_index={@tab_index}
      target={@target}
      toolbar_action={@toolbar_action}
      tooltip_alignment={@tooltip_alignment}
      tooltip_position={@tooltip_position}
      tooltip_text={@tooltip_text}
      type={@type}
      {@rest}
    >
      <%= for icon <- assigns[:"s-icon"] do %>
        {render_slot(icon)}
      <% end %>
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
      patterns: ["%{breadcrumb: [_ | _]}"],
      extra_slots: ~S"""
  slot :breadcrumb do
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
      <%= for breadcrumb <- @breadcrumb do %>
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
          secondary_label_text={step[:secondary_label_text]}
          complete={step[:complete]}
          current={step[:current]}
          disabled={step[:disabled]}
          invalid={step[:invalid]}
          icon_label={step[:icon_label]}
          clickable={step[:clickable]}
        />
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
      helper_text={@helper_text}
      hide_label={@hide_label}
      id={@id}
      inline={@inline}
      invalid={@invalid}
      invalid_text={@invalid_text}
      is_fluid={@is_fluid}
      label_text={@label_text}
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
      <%= for item <- @item do %>
        <CoreComponents.select_item
          label={item[:label]}
          value={item[:value] || item[:label]}
          selected={item[:selected]}
          disabled={item[:disabled]}
        />
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
      label_text={@label_text}
      max_length={@max_length}
      name={@name}
      pattern={@pattern}
      placeholder={@placeholder}
      read_only={@read_only}
      required={@required}
      required_validity_message={@required_validity_message}
      size={@size}
      type={@type}
      validity_message={@validity_message}
      value={@value}
      warning={@warning}
      warning_text={@warning_text}
      {@rest}
    >
      <CoreComponents.time_picker_select>
        <%= for item <- @select_item do %>
          <CoreComponents.select_item
            label={item[:label]}
            value={item[:value] || item[:label]}
            selected={item[:selected]}
            disabled={item[:disabled]}
          />
        <% end %>
      </CoreComponents.time_picker_select>
    </FormComponents.time_picker>
"""
    },
    %{
      name: :tooltip,
      delegate: :core,
      patterns: ["%{content: [_ | _]}"],
      extra_slots: ~S"""
  slot :trigger
  slot :content
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
        <CoreComponents.tooltip_content>
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

  defp ensure_attr(component, %{"name" => name} = attr) do
    exists? = Enum.any?(component.attrs, &(&1.htmlname == name))

    if exists? do
      component
    else
      %{component | attrs: component.attrs ++ [Attr.parse(attr)]}
    end
  end

  defp set_step_attr_default(%{htmlname: "step"} = attr) do
    %{attr | opts: Keyword.put(attr.opts, :default, "1")}
  end

  defp set_step_attr_default(attr), do: attr
end
