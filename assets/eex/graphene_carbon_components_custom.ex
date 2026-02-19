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
  File uploader wrapper for Carbon web components.
  """
  attr :field, Phoenix.HTML.FormField, default: nil
  attr :form, :string, default: nil
  attr :id, :string, default: nil
  attr :name, :string, default: nil
  attr :value, :any, default: nil
  attr :disabled, :boolean, default: false
  attr :label_description, :string, default: nil
  attr :label_title, :string, default: nil
  attr :file_input_name, :string, default: nil
  attr :form_event, :string, default: nil
  attr :rest, :global

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

  slot :drop_container do
    attr :accept, :string
    attr :disabled, :boolean
    attr :multiple, :boolean
    attr :name, :string
    attr :attrs, :map
  end

  slot :item do
    attr :state, :string
    attr :invalid, :boolean
    attr :icon_description, :string
    attr :attrs, :map
  end

  slot :inner_block

  def file_uploader(assigns) do
    FormComponents.file_uploader(assigns)
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
    content_class =
      case assigns[:content_class] do
        nil -> "cds--content"
        "" -> "cds--content"
        class when is_binary(class) ->
          if String.contains?(class, "cds--content") do
            class
          else
            class <> " cds--content"
          end
      end

    assigns = assign(assigns, :content_class, content_class)

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
