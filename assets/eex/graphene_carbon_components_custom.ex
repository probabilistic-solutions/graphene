  @doc """
  Renders a Carbon data table with selection, sorting, filtering, and expansion
  support. This component owns interactive state to avoid LiveView flicker.

  ## Events

  * `graphene:table-row-selected` - Row selection changed.
  * `graphene:table-row-all-selected` - Select-all toggled.
  * `graphene:table-sorted` - Sort changed.
  * `graphene:table-filtered` - Filtered rows changed.
  * `graphene:table-search-input` - Search input changed.
  * `graphene:table-batch-cancel` - Batch selection canceled.
  """

  attr :id, :string, required: true
  attr :rows, :list, required: true
  attr :row_id, :any, default: nil, doc: "the function for generating the row id"
  attr :row_click, :any, default: nil, doc: "the function for handling phx-click on each row"

  attr :row_item, :any,
    default: &Function.identity/1,
    doc: "the function for mapping each row before calling the :col and :action slots"

  attr :selectable, :boolean, default: false, doc: "enable row selection"
  attr :sortable, :boolean, default: false, doc: "enable sorting UI on header cells"

  attr :selected_ids, :list,
    default: nil,
    doc:
      "selected row ids. When nil, the table keeps its internal selection state. Pass an explicit list to control selection."

  attr :selection_name, :string, default: nil, doc: "name attribute for row selection inputs"
  attr :selection_label, :string, default: "Select row", doc: "aria label for row selection"
  attr :radio, :boolean, default: false, doc: "use radio selection instead of checkboxes"
  attr :size, :string, default: "lg", values: ["xs", "sm", "md", "lg", "xl"], doc: "table size"
  attr :expandable, :boolean, default: false, doc: "enable expandable rows"
  attr :batch_expansion, :boolean, default: false, doc: "enable batch expansion control"

  attr :overflow_menu_on_hover, :boolean,
    default: false,
    doc: "show overflow menu only on hover"

  attr :use_zebra_styles, :boolean, default: true, doc: "enable zebra striping"
  attr :use_static_width, :boolean, default: false, doc: "use static table width"
  attr :with_row_ai_labels, :boolean, default: false, doc: "enable AI labels in rows"
  attr :with_row_slugs, :boolean, default: false, doc: "enable slugs in rows"
  attr :locale, :string, default: nil, doc: "table locale"
  attr :filter_rows, :any, default: nil, doc: "custom filter rows function"

  attr :phx_update, :any,
    default: "ignore",
    doc:
      "phx-update behavior for the table root. Defaults to \"ignore\" so LiveView does not patch the table subtree after client-side sorting/filtering. Set to nil or false to allow normal patching."

  attr :on_row_selected, :any, default: nil, doc: "callback for row selection events"
  attr :on_row_all_selected, :any, default: nil, doc: "callback for select-all events"
  attr :on_sorted, :any, default: nil, doc: "callback for sort events"
  attr :on_filtered, :any, default: nil, doc: "callback for filter events"
  attr :on_search, :any, default: nil, doc: "callback for search events"
  attr :on_batch_cancel, :any, default: nil, doc: "callback for batch cancel events"

  slot :col, required: true do
    attr :label, :any
  end

  slot :action, doc: "the slot for showing user actions in the last table column"
  slot :title, doc: "table title"
  slot :description, doc: "table description"
  slot :toolbar, doc: "table toolbar contents"

  slot :row_decorator, doc: "content injected before row cells" do
    attr :class, :string
  end

  slot :expanded_row, doc: "content rendered as expanded rows"

  def data_table(assigns) do
    assigns =
      assigns
      |> table_assigns()
      |> assign(:component_id, "#{assigns.id}-component")

    ~H"""
    <.live_component
      module={DataTableComponent}
      id={@component_id}
      table_id={@id}
      rows={@rows}
      row_id={@row_id}
      row_click={@row_click}
      row_item={@row_item}
      col={@col}
      action={@action}
      selectable={@selectable}
      sortable={@sortable}
      selected_ids={@selected_ids}
      selection_name={@selection_name}
      selection_label={@selection_label}
      radio={@radio}
      size={@size}
      expandable={@expandable}
      batch_expansion={@batch_expansion}
      overflow_menu_on_hover={@overflow_menu_on_hover}
      use_zebra_styles={@use_zebra_styles}
      use_static_width={@use_static_width}
      with_row_ai_labels={@with_row_ai_labels}
      with_row_slugs={@with_row_slugs}
      locale={@locale}
      filter_rows={@filter_rows}
      phx_update={@phx_update}
      on_row_selected={@on_row_selected}
      on_row_all_selected={@on_row_all_selected}
      on_sorted={@on_sorted}
      on_filtered={@on_filtered}
      on_search={@on_search}
      on_batch_cancel={@on_batch_cancel}
      title={@title}
      description={@description}
      toolbar={@toolbar}
      row_decorator={@row_decorator}
      expanded_row={@expanded_row}
    />
    """
  end

  @doc """
  Renders a menu using `cds-menu-button` with menu items and groups.
  """
  attr :label, :string, default: nil
  attr :kind, :any, default: nil
  attr :size, :any, default: nil
  attr :disabled, :boolean, default: false
  attr :menu_alignment, :string, default: nil
  attr :menu_background_token, :any, default: nil
  attr :menu_border, :boolean, default: false
  attr :tab_index, :string, default: nil
  attr :rest, :global

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

  slot :divider

  def menu(assigns) do
    ~H"""
    <CoreComponents.menu_button
      label={@label}
      kind={@kind}
      size={@size}
      disabled={@disabled}
      menu_alignment={@menu_alignment}
      menu_background_token={@menu_background_token}
      menu_border={@menu_border}
      tab_index={@tab_index}
      {@rest}
    >
      <CoreComponents.menu>
        {render_menu_items(assigns)}
      </CoreComponents.menu>
    </CoreComponents.menu_button>
    """
  end

  @doc """
  Pagination navigation variant using `cds-pagination`.
  """
  attr :backward_text, :string,
    doc: "The assistive text for the button to go to previous page.",
    default: "Previous page"

  attr :disabled, :boolean, doc: "`true` if the pagination UI should be disabled."

  attr :forward_text, :string,
    doc: "The assistive text for the button to go to next page.",
    default: "Next page"

  attr :is_last_page, :boolean, doc: "`true` to explicitly state that user is at the last page."

  attr :items_per_page_text, :string,
    doc: "The translatable text indicating the number of items per page.",
    default: "Items per page:"

  attr :page, :string, doc: "The current page", default: "1"

  attr :page_input_disabled, :boolean,
    doc: "true if the select box to change the page should be disabled."

  attr :page_size, :string, doc: "Number of items per page.", default: "10"

  attr :page_size_input_disabled, :any,
    doc: "true if the select box to change the items per page should be disabled.",
    default: true

  attr :page_size_label_text, :string, doc: "The label text for the UI to select page size."
  attr :pages_unknown, :boolean, doc: "true if the total number of items is unknown."
  attr :rest, :global

  attr :size, :string,
    doc: "Specify the size of the Pagination.",
    values: ["sm", "md", "lg"],
    default: "md"

  attr :start, :string,
    doc: "The row number where current page start with, index that starts with zero.",
    default: "0"

  attr :total_items, :string, doc: "The number of total items."
  attr :total_pages, :string, doc: "The number of total pages.", default: "1"

  slot :inner_block

  slot :"s-page-sizes-select", doc: "Where to put in the `<page-sizes-select>`." do
    attr :tag, :string
  end

  def pagination_nav(assigns) do
    CoreComponents.pagination(assigns)
  end

  @doc """
  Fluid time picker wrapper (aliases `cds-time-picker`).
  """
  attr :disabled, :boolean, doc: "Specify whether the control is disabled."
  attr :hide_label, :boolean, doc: "Specify whether the label should be hidden."
  attr :invalid, :boolean, doc: "Specify whether the control is currently invalid."

  attr :invalid_text, :string,
    doc: "Provide the text that is displayed when the control is in an invalid state",
    default: "Invalid time format."

  attr :label_text, :string,
    doc: "Provide label text to be read by screen readers",
    default: "Select a time"

  attr :max_length, :string, doc: "Specify the maximum length of the input value", default: "5"
  attr :name, :string, doc: "Name for the input in FormData"

  attr :pattern, :string,
    doc: "Pattern for input validation",
    default: "(1[012]|[1-9]):[0-5][0-9](\\s)?"

  attr :placeholder, :string, doc: "Placeholder text for the input", default: "hh:mm"
  attr :read_only, :boolean, doc: "Specify whether the control should be read-only"
  attr :required, :boolean, doc: "Whether the input is required"

  attr :required_validity_message, :string,
    doc: "Custom message for required validation",
    default: "Please fill out this field."

  attr :rest, :global
  attr :size, :any, doc: "Size of the time picker"
  attr :type, :string, doc: "Input type", default: "text"
  attr :validity_message, :string, doc: "Validity message"
  attr :value, :string, doc: "Value of the input"
  attr :warning, :boolean, doc: "Specify whether the control is in warning state"

  attr :warning_text, :string,
    doc: "Provide the text that is displayed when the control is in a warning state",
    default: "Warning message."

  slot :inner_block

  slot :"s-label-text", doc: "The label text." do
    attr :tag, :string
  end

  slot :"s-time-picker-select", doc: "Slot for time picker select components." do
    attr :tag, :string
  end

  slot :"s-validity-message",
    doc:
      "The validity message. If present and non-empty, this input shows the UI of its invalid state." do
    attr :tag, :string
  end

  def fluid_time_picker(assigns) do
    FormComponents.time_picker(assigns)
  end

  @doc """
  UI shell layout that renders header, side nav, and content slots.
  """
  attr :rest, :global
  attr :content_class, :string, default: nil
  slot :skip_to_content
  slot :header
  slot :side_nav
  slot :content

  def ui_shell(assigns) do
    ~H"""
    <div {@rest}>
      {render_slot(@skip_to_content)}
      {render_slot(@header)}
      {render_slot(@side_nav)}
      <main class={@content_class}>
        {render_slot(@content)}
      </main>
    </div>
    """
  end

  defp render_menu_items(assigns) do
    ~H"""
    <%= for group <- @group do %>
      <CoreComponents.menu_item_group label={group[:label]} {group[:attrs] || %{}}>
        <%= if group.inner_block do %>
          {render_slot(group)}
        <% end %>
      </CoreComponents.menu_item_group>
    <% end %>
    <%= for divider <- @divider do %>
      <CoreComponents.menu_item_divider {divider[:attrs] || %{}} />
    <% end %>
    <%= for item <- @item do %>
      <CoreComponents.menu_item
        label={item[:label]}
        disabled={item[:disabled]}
        kind={item[:kind]}
        shortcut={item[:shortcut]}
        {item[:attrs] || %{}}
      >
        <%= if item.inner_block do %>
          {render_slot(item)}
        <% end %>
      </CoreComponents.menu_item>
    <% end %>
    """
  end

  defp render_column_label(nil), do: nil
  defp render_column_label(fun) when is_function(fun, 0), do: fun.()
  defp render_column_label(label), do: label

  defp structured_list_row_id(row_id_fun, row, index) do
    key =
      cond do
        is_function(row_id_fun, 1) -> row_id_fun.(row)
        is_nil(row_id_fun) -> index
        true -> row_id_fun
      end

    key |> to_string()
  end

  defp structured_list_selected?(selected_set, row_id_fun, row, index) do
    MapSet.member?(selected_set, structured_list_row_id(row_id_fun, row, index))
  end

  defp table_assigns(assigns) do
    assigns =
      case Map.get(assigns, :phx_update) do
        false -> Map.put(assigns, :phx_update, nil)
        "" -> Map.put(assigns, :phx_update, nil)
        _ -> assigns
      end

    case assigns do
      %{rows: %Phoenix.LiveView.LiveStream{}} ->
        assign(assigns, row_id: assigns.row_id || fn {id, _item} -> id end)

      _ ->
        assigns
    end
  end
