  defp form_input_assigns(assigns, opts) do
    mode = Keyword.fetch!(opts, :mode)
    checked_attr = Keyword.get(opts, :checked_attr, :checked)
    detail_key = Keyword.get(opts, :detail_key, Atom.to_string(checked_attr))
    value_attr = Keyword.get(opts, :value_attr, :value)
    default_event = Keyword.get(opts, :event, "change")

    assigns =
      case assigns do
        %{field: %Phoenix.HTML.FormField{} = field} ->
          assigns
          |> assign(:field, nil)
          |> assign(:id, field.id)
          |> assign(:name, field.name)
          |> assign(:value, field.value)

        _ ->
          assigns
      end

    assigns =
      assigns
      |> assign_new(:name, fn -> nil end)
      |> assign_new(:id, fn -> nil end)
      |> assign_new(:value, fn -> nil end)
      |> assign_new(:form, fn -> nil end)
      |> assign_new(:form_event, fn -> default_event end)

    id = assigns[:id] || assigns[:name]

    if is_nil(id) or id == "" do
      raise ArgumentError, "expected :id or :name for form component"
    end
    assigns = assign(assigns, :id, id)

    assigns =
      case mode do
        :boolean ->
          checked = normalize_checked(assigns, checked_attr)

          assigns
          |> assign(:checked, checked)
          |> assign(checked_attr, checked)

        _ ->
          assigns
          |> assign(value_attr, assigns[:value])
      end

    input_id = "#{id}-input"
    input_value = form_hidden_value(assigns, mode)
    assigns = if value_attr == :value, do: assigns, else: assign(assigns, :value, nil)

    hook_name = "GrapheneFormBridge"

    rest =
      (assigns[:rest] || %{})
      |> Map.put_new(:id, id)

    form_bridge_attrs =
      %{
        :"phx-hook" => hook_name,
        :"data-form-input" => input_id,
        :"data-form-event" => assigns[:form_event] || default_event,
        :"data-form-mode" => to_string(mode),
        :"data-form-detail" => detail_key,
        :"data-form-target-selector" => "##{id}"
      }

    assigns
    |> assign(:rest, rest)
    |> assign(:form_bridge_attrs, form_bridge_attrs)
    |> assign(:input_id, input_id)
    |> assign(:input_value, input_value)
  end

  defp normalize_checked(assigns, checked_attr) do
    value =
      cond do
        Map.has_key?(assigns, checked_attr) and not is_nil(assigns[checked_attr]) ->
          assigns[checked_attr]

        Map.has_key?(assigns, :checked) and not is_nil(assigns[:checked]) ->
          assigns[:checked]

        true ->
          assigns[:value]
      end

    Phoenix.HTML.Form.normalize_value("checkbox", value)
  end

  defp form_hidden_value(assigns, :boolean) do
    if assigns[:checked], do: "true", else: "false"
  end

  defp form_hidden_value(assigns, _mode) do
    value = assigns[:value]

    cond do
      is_binary(value) -> value
      is_number(value) -> to_string(value)
      is_boolean(value) -> if(value, do: "true", else: "false")
      is_nil(value) -> ""
      true -> inspect(value)
    end
  end

  @doc """
  Form-aware file uploader wrapper.

  Uses the file uploader button event by default. If you only provide a
  drop container slot, set `form_event` to `cds-file-uploader-drop-container-changed`.
  """
  attr :field, Phoenix.HTML.FormField, doc: "a form field struct, for example: @form[:attachments]"

  attr :form, :string,
    default: nil,
    doc: "the form attribute for the hidden input"

  attr :id, :string,
    default: nil,
    doc: "the DOM id for the file uploader root element"

  attr :name, :string,
    default: nil,
    doc: "the name used for the hidden form input"

  attr :value, :any,
    default: nil,
    doc: "optional value to sync to the hidden input"

  attr :form_event, :string,
    default: nil,
    doc: "override the custom event used to sync form values"

  attr :file_input_name, :string,
    default: nil,
    doc: "optional name attribute for the underlying file input"

  attr :disabled, :boolean, doc: "`true` if the file uploader should be disabled"
  attr :label_description, :string, doc: "The description text."
  attr :label_title, :string, doc: "The label title."
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
    assigns =
      assigns
      |> assign_new(:disabled, fn -> false end)
      |> assign_new(:label_description, fn -> nil end)
      |> assign_new(:label_title, fn -> nil end)
      |> assign_new(:file_input_name, fn -> nil end)
      |> assign_new(:button, fn -> [] end)
      |> assign_new(:drop_container, fn -> [] end)
      |> assign_new(:item, fn -> [] end)
      |> assign_new(:form_event, fn ->
        if Map.get(assigns, :drop_container, []) != [] and Map.get(assigns, :button, []) == [] do
          "cds-file-uploader-drop-container-changed"
        else
          "cds-file-uploader-button-changed"
        end
      end)
      |> form_input_assigns(name: :file_uploader, mode: :value, event: "cds-file-uploader-button-changed")

    ~H"""
    <input
      type="hidden"
      id={@input_id}
      name={@name}
      value={@input_value}
      form={@form}
      {@form_bridge_attrs}
    />
    <CoreComponents.file_uploader
      disabled={@disabled}
      label_description={@label_description}
      label_title={@label_title}
      {@rest}
    >
      <%= for drop <- @drop_container do %>
        <CoreComponents.file_uploader_drop_container
          accept={drop[:accept]}
          disabled={drop[:disabled]}
          multiple={drop[:multiple]}
          name={drop[:name] || @file_input_name}
          {drop[:attrs] || %{}}
        >
          {render_slot(drop)}
        </CoreComponents.file_uploader_drop_container>
      <% end %>
      <%= for button <- @button do %>
        <CoreComponents.file_uploader_button
          accept={button[:accept]}
          button_kind={button[:button_kind]}
          disabled={button[:disabled]}
          multiple={button[:multiple]}
          name={button[:name] || @file_input_name}
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
      {render_slot(@inner_block)}
    </CoreComponents.file_uploader>
    """
  end
