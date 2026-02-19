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
  defdelegate table_live(assigns), to: Graphene.CarbonComponents, as: :data_table

  @doc false
  defdelegate data_table(assigns), to: Graphene.CarbonComponents.DataTable

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
