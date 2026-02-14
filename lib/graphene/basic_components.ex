defmodule Graphene.BasicComponents do
  @moduledoc """
  Compatibility wrappers around Graphene.CoreComponents that mirror the
  Phoenix installer core_components API.

  These components preserve the Phoenix core attributes/slots while rendering
  Carbon web components where possible.
  """

  use Phoenix.Component

  alias Phoenix.LiveView.JS
  alias Graphene.CoreComponents

  @hero_icon_map %{
    "hero-information-circle" => "information",
    "hero-exclamation-circle" => "warning--filled",
    "hero-x-mark" => "close",
    "hero-arrow-path" => "renew"
  }

  @available_graphene_icons MapSet.new(Graphene.Icons.available_icons())
  @icon_fallback "help"

  @doc """
  Renders flash notices.

  ## Examples

      <.flash kind={:info} flash={@flash} />
      <.flash kind={:info} phx-mounted={show("#flash")}>Welcome Back!</.flash>
  """
  attr :id, :string, doc: "the optional id of flash container"
  attr :flash, :map, default: %{}, doc: "the map of flash messages to display"
  attr :title, :string, default: nil
  attr :kind, :atom, values: [:info, :error], doc: "used for styling and flash lookup"
  attr :rest, :global, doc: "the arbitrary HTML attributes to add to the flash container"

  slot :inner_block, doc: "the optional inner block that renders the flash message"

  def flash(assigns) do
    assigns = assign_new(assigns, :id, fn -> "flash-#{assigns.kind}" end)
    assigns = assign(assigns, :carbon_kind, flash_kind(assigns.kind))

    ~H"""
    <CoreComponents.toast_notification
      :if={msg = render_slot(@inner_block) || Phoenix.Flash.get(@flash, @kind)}
      id={@id}
      kind={@carbon_kind}
      title={@title}
      open
      phx-click={JS.push("lv:clear-flash", value: %{key: @kind}) |> hide("##{@id}")}
      {@rest}
    >
      <:s-subtitle>{msg}</:s-subtitle>
    </CoreComponents.toast_notification>
    """
  end

  @doc """
  Renders a button with navigation support.

  ## Examples

      <.button>Send!</.button>
      <.button phx-click="go" variant="primary">Send!</.button>
      <.button navigate={~p"/"}>Home</.button>
  """
  attr :rest, :global, include: ~w(href navigate patch method download name value disabled)
  attr :class, :any, default: nil
  attr :variant, :string, default: nil, values: [nil, "primary"]
  attr :kind, :string, default: nil, doc: "Carbon button kind override."
  slot :inner_block, required: true

  def button(assigns) do
    assigns =
      assigns
      |> assign_new(:rest, fn -> %{} end)
      |> assign_new(:class, fn -> nil end)

    rest = assigns.rest
    navigate = rest[:navigate]
    patch = rest[:patch]
    href = rest[:href] || navigate || patch
    {rest, phx_click} = button_click(rest)
    kind = assigns[:kind] || assigns[:variant] || "primary"

    rest =
      case href do
        nil -> rest
        _ -> Map.put(rest, :href, href)
      end

    assigns =
      assigns
      |> assign(:rest, rest)
      |> assign(:phx_click, phx_click)
      |> assign(:carbon_kind, kind)

    ~H"""
    <CoreComponents.button kind={@carbon_kind} class={@class} phx-click={@phx_click} {@rest}>
      {render_slot(@inner_block)}
    </CoreComponents.button>
    """
  end

  @doc """
  Renders an input with label and error messages.

  A `Phoenix.HTML.FormField` may be passed as argument,
  which is used to retrieve the input name, id, and values.
  Otherwise all attributes may be passed explicitly.
  """
  attr :id, :any, default: nil
  attr :name, :any
  attr :label, :string, default: nil
  attr :value, :any, default: nil

  attr :type, :string,
    default: "text",
    values:
      ~w(checkbox color date datetime-local email file month number password search select tel text textarea time url week hidden)

  attr :field, Phoenix.HTML.FormField,
    doc: "a form field struct retrieved from the form, for example: @form[:email]"

  attr :errors, :list, default: []
  attr :checked, :boolean, doc: "the checked flag for checkbox inputs"
  attr :prompt, :string, default: nil, doc: "the prompt for select inputs"
  attr :options, :list, doc: "the options to pass to Phoenix.HTML.Form.options_for_select/2"
  attr :multiple, :boolean, default: false, doc: "the multiple flag for select inputs"
  attr :class, :any, default: nil, doc: "the input class to use over defaults"
  attr :error_class, :any, default: nil, doc: "the input error class to use over defaults"

  attr :rest, :global,
    include: ~w(accept autocomplete capture cols disabled form list max maxlength min minlength
                multiple pattern placeholder readonly required rows size step)

  def input(%{field: %Phoenix.HTML.FormField{} = field} = assigns) do
    errors = if Phoenix.Component.used_input?(field), do: field.errors, else: []

    assigns
    |> assign(field: nil, id: assigns.id || field.id)
    |> assign(:errors, Enum.map(errors, &translate_error(&1)))
    |> assign_new(:name, fn -> if assigns.multiple, do: field.name <> "[]", else: field.name end)
    |> assign_new(:value, fn -> field.value end)
    |> input()
  end

  def input(%{type: "hidden"} = assigns) do
    assigns = input_defaults(assigns)

    ~H"""
    <input type="hidden" id={@id} name={@name} value={@value} {@rest} />
    """
  end

  def input(%{type: "checkbox"} = assigns) do
    assigns = input_defaults(assigns)

    assigns =
      assign_new(assigns, :checked, fn ->
        Phoenix.HTML.Form.normalize_value("checkbox", assigns[:value])
      end)

    {invalid, invalid_text} = input_errors(assigns.errors)
    class = input_class(assigns.class, assigns.error_class, invalid)

    assigns = assign(assigns, invalid: invalid, invalid_text: invalid_text, class: class)

    ~H"""
    <CoreComponents.form_item>
      <input
        type="hidden"
        name={@name}
        value="false"
        disabled={@rest[:disabled]}
        form={@rest[:form]}
      />
      <CoreComponents.checkbox
        id={@id}
        name={@name}
        value="true"
        checked={@checked}
        label_text={@label}
        invalid={@invalid}
        invalid_text={@invalid_text}
        class={@class}
        {@rest}
      />
      <.error :for={msg <- @errors}>{msg}</.error>
    </CoreComponents.form_item>
    """
  end

  def input(%{type: "select"} = assigns) do
    assigns = input_defaults(assigns)

    {invalid, invalid_text} = input_errors(assigns.errors)
    class = input_class(assigns.class, assigns.error_class, invalid)
    selected = selected_values(assigns.value, assigns.multiple)

    assigns =
      assign(assigns,
        selected: selected,
        invalid: invalid,
        invalid_text: invalid_text,
        class: class
      )

    ~H"""
    <CoreComponents.form_item>
      <CoreComponents.select
        id={@id}
        name={@name}
        label_text={@label}
        value={select_value(@value, @multiple)}
        multiple={@multiple}
        invalid={@invalid}
        invalid_text={@invalid_text}
        class={@class}
        {@rest}
      >
        <CoreComponents.select_item
          :if={@prompt}
          value=""
          label={@prompt}
          selected={prompt_selected?(@value)}
        >
          {@prompt}
        </CoreComponents.select_item>
        <%= for option <- normalize_options(@options) do %>
          {render_select_option(option, @selected)}
        <% end %>
      </CoreComponents.select>
      <.error :for={msg <- @errors}>{msg}</.error>
    </CoreComponents.form_item>
    """
  end

  def input(%{type: "textarea"} = assigns) do
    assigns = input_defaults(assigns)

    {invalid, invalid_text} = input_errors(assigns.errors)
    class = input_class(assigns.class, assigns.error_class, invalid)

    assigns = assign(assigns, invalid: invalid, invalid_text: invalid_text, class: class)

    ~H"""
    <CoreComponents.form_item>
      <CoreComponents.textarea
        id={@id}
        name={@name}
        label={@label}
        value={Phoenix.HTML.Form.normalize_value("textarea", @value)}
        invalid={@invalid}
        invalid_text={@invalid_text}
        class={@class}
        {@rest}
      />
      <.error :for={msg <- @errors}>{msg}</.error>
    </CoreComponents.form_item>
    """
  end

  def input(%{type: "search"} = assigns) do
    assigns = input_defaults(assigns)

    class = input_class(assigns.class, assigns.error_class, assigns.errors != [])

    assigns = assign(assigns, class: class)

    ~H"""
    <CoreComponents.form_item>
      <CoreComponents.search
        name={@name}
        label_text={@label}
        value={Phoenix.HTML.Form.normalize_value("search", @value)}
        class={@class}
        {@rest}
      />
      <.error :for={msg <- @errors}>{msg}</.error>
    </CoreComponents.form_item>
    """
  end

  def input(%{type: "number"} = assigns) do
    assigns = input_defaults(assigns)

    {invalid, invalid_text} = input_errors(assigns.errors)
    class = input_class(assigns.class, assigns.error_class, invalid)

    assigns = assign(assigns, invalid: invalid, invalid_text: invalid_text, class: class)

    ~H"""
    <CoreComponents.form_item>
      <CoreComponents.number_input
        id={@id}
        name={@name}
        label={@label}
        value={Phoenix.HTML.Form.normalize_value("number", @value)}
        invalid={@invalid}
        invalid_text={@invalid_text}
        class={@class}
        {@rest}
      />
      <.error :for={msg <- @errors}>{msg}</.error>
    </CoreComponents.form_item>
    """
  end

  def input(%{type: "file"} = assigns) do
    assigns = input_defaults(assigns)

    {invalid, invalid_text} = input_errors(assigns.errors)
    class = input_class(assigns.class, assigns.error_class, invalid)

    assigns = assign(assigns, invalid: invalid, invalid_text: invalid_text, class: class)

    ~H"""
    <CoreComponents.form_item>
      <CoreComponents.file_uploader label_title={@label} label_description={@prompt}>
        <CoreComponents.file_uploader_button
          name={@name}
          accept={@rest[:accept]}
          multiple={@multiple}
          disabled={@rest[:disabled]}
        >
          {if @label, do: @label, else: "Upload"}
        </CoreComponents.file_uploader_button>
      </CoreComponents.file_uploader>
      <.error :for={msg <- @errors}>{msg}</.error>
    </CoreComponents.form_item>
    """
  end

  def input(%{type: type} = assigns) when type in ["text", "email", "password", "tel", "url"] do
    assigns = input_defaults(assigns)

    {invalid, invalid_text} = input_errors(assigns.errors)
    class = input_class(assigns.class, assigns.error_class, invalid)

    assigns = assign(assigns, invalid: invalid, invalid_text: invalid_text, class: class)

    ~H"""
    <CoreComponents.form_item>
      <CoreComponents.text_input
        id={@id}
        name={@name}
        label={@label}
        type={@type}
        value={Phoenix.HTML.Form.normalize_value(@type, @value)}
        invalid={@invalid}
        invalid_text={@invalid_text}
        class={@class}
        {@rest}
      />
      <.error :for={msg <- @errors}>{msg}</.error>
    </CoreComponents.form_item>
    """
  end

  def input(assigns) do
    assigns = input_defaults(assigns)

    class = input_class(assigns.class, assigns.error_class, assigns.errors != [])

    assigns = assign(assigns, class: class)

    ~H"""
    <CoreComponents.form_item>
      <label :if={@label}>{@label}</label>
      <input
        type={@type}
        name={@name}
        id={@id}
        value={Phoenix.HTML.Form.normalize_value(@type, @value)}
        class={@class}
        {@rest}
      />
      <.error :for={msg <- @errors}>{msg}</.error>
    </CoreComponents.form_item>
    """
  end

  # Helper used by inputs to generate form errors
  defp error(assigns) do
    ~H"""
    <p class="cds--form-requirement">{render_slot(@inner_block)}</p>
    """
  end

  @doc """
  Renders a header with title.
  """
  slot :inner_block, required: true
  slot :subtitle
  slot :actions

  def header(assigns) do
    ~H"""
    <CoreComponents.stack orientation="horizontal" gap="3">
      <CoreComponents.stack gap="1">
        <CoreComponents.heading>{render_slot(@inner_block)}</CoreComponents.heading>
        <p :if={@subtitle != []}>{render_slot(@subtitle)}</p>
      </CoreComponents.stack>
      <div :if={@actions != []}>{render_slot(@actions)}</div>
    </CoreComponents.stack>
    """
  end

  @doc """
  Renders a table with generic styling.

  ## Examples

      <.table id="users" rows={@users}>
        <:col :let={user} label="id">{user.id}</:col>
        <:col :let={user} label="username">{user.username}</:col>
      </.table>
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
  attr :selected_ids, :list, default: [], doc: "selected row ids"
  attr :selection_name, :string, default: nil, doc: "name attribute for row selection inputs"
  attr :selection_label, :string, default: "Select row", doc: "aria label for row selection"

  attr :on_row_selected, :any, default: nil, doc: "callback for row selection events"
  attr :on_row_all_selected, :any, default: nil, doc: "callback for select-all events"
  attr :on_sorted, :any, default: nil, doc: "callback for sort events"
  attr :on_filtered, :any, default: nil, doc: "callback for filter events"
  attr :on_search, :any, default: nil, doc: "callback for search events"
  attr :on_batch_cancel, :any, default: nil, doc: "callback for batch cancel events"

  slot :col, required: true do
    attr :label, :string
  end

  slot :action, doc: "the slot for showing user actions in the last table column"

  def table(assigns) do
    assigns =
      assigns
      |> table_assigns()
      |> assign(:component_id, "#{assigns.id}-component")

    ~H"""
    <.live_component
      module={Graphene.BasicComponents.TableComponent}
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
      on_row_selected={@on_row_selected}
      on_row_all_selected={@on_row_all_selected}
      on_sorted={@on_sorted}
      on_filtered={@on_filtered}
      on_search={@on_search}
      on_batch_cancel={@on_batch_cancel}
    />
    """
  end

  @doc """
  Renders a data list.

  ## Examples

      <.list>
        <:item title="Title">{@post.title}</:item>
        <:item title="Views">{@post.views}</:item>
      </.list>
  """
  slot :item, required: true do
    attr :title, :string, required: true
  end

  def list(assigns) do
    ~H"""
    <CoreComponents.unordered_list>
      <CoreComponents.list_item :for={item <- @item}>
        <div>
          <strong>{item.title}</strong>
          <div>{render_slot(item)}</div>
        </div>
      </CoreComponents.list_item>
    </CoreComponents.unordered_list>
    """
  end

  @doc """
  Renders a Carbon icon by name.
  """
  attr :name, :string, required: true
  attr :class, :any, default: ""
  attr :size, :integer, default: 24

  def icon(assigns) do
    assigns =
      assigns
      |> assign_new(:class, fn -> "" end)
      |> assign_new(:size, fn -> 24 end)
      |> assign(:carbon_name, normalize_icon_name(assigns.name))

    ~H"""
    <Graphene.Icons.icon name={@carbon_name} size={@size} class={@class} />
    """
  end

  ## JS Commands

  def show(js \\ %JS{}, selector) do
    JS.show(js,
      to: selector,
      time: 300,
      transition:
        {"transition-all ease-out duration-300",
         "opacity-0 translate-y-4 sm:translate-y-0 sm:scale-95",
         "opacity-100 translate-y-0 sm:scale-100"}
    )
  end

  def hide(js \\ %JS{}, selector) do
    JS.hide(js,
      to: selector,
      time: 200,
      transition:
        {"transition-all ease-in duration-200", "opacity-100 translate-y-0 sm:scale-100",
         "opacity-0 translate-y-4 sm:translate-y-0 sm:scale-95"}
    )
  end

  @doc """
  Translates an error message using gettext.
  """
  def translate_error({msg, opts}) do
    Enum.reduce(opts, msg, fn {key, value}, acc ->
      String.replace(acc, "%{#{key}}", fn _ -> to_string(value) end)
    end)
  end

  @doc """
  Translates the errors for a field from a keyword list of errors.
  """
  def translate_errors(errors, field) when is_list(errors) do
    for {^field, {msg, opts}} <- errors, do: translate_error({msg, opts})
  end

  defp table_assigns(assigns) do
    case assigns do
      %{rows: %Phoenix.LiveView.LiveStream{}} ->
        assign(assigns, row_id: assigns.row_id || fn {id, _item} -> id end)

      _ ->
        assigns
    end
  end

  defp button_click(rest) do
    navigate = rest[:navigate]
    patch = rest[:patch]
    rest = Map.drop(rest, [:navigate, :patch, :method])

    cond do
      Map.has_key?(rest, :"phx-click") -> {rest, nil}
      navigate -> {rest, JS.navigate(navigate)}
      patch -> {rest, JS.patch(patch)}
      true -> {rest, nil}
    end
  end

  defp flash_kind(:info), do: "info"
  defp flash_kind(:error), do: "error"
  defp flash_kind(kind) when is_atom(kind), do: Atom.to_string(kind)
  defp flash_kind(kind), do: to_string(kind)

  defp normalize_icon_name("hero-" <> rest = name) do
    case Map.get(@hero_icon_map, name) do
      nil ->
        if MapSet.member?(@available_graphene_icons, rest), do: rest, else: @icon_fallback

      mapped ->
        mapped
    end
  end

  defp normalize_icon_name(name) do
    if MapSet.member?(@available_graphene_icons, name), do: name, else: @icon_fallback
  end

  defp input_defaults(assigns) do
    assigns
    |> assign_new(:id, fn -> nil end)
    |> assign_new(:name, fn -> nil end)
    |> assign_new(:label, fn -> nil end)
    |> assign_new(:value, fn -> nil end)
    |> assign_new(:type, fn -> "text" end)
    |> assign_new(:errors, fn -> [] end)
    |> assign_new(:prompt, fn -> nil end)
    |> assign_new(:options, fn -> [] end)
    |> assign_new(:multiple, fn -> false end)
    |> assign_new(:class, fn -> nil end)
    |> assign_new(:error_class, fn -> nil end)
    |> assign_new(:rest, fn -> %{} end)
  end

  defp input_errors([]), do: {false, nil}
  defp input_errors([message | _]), do: {true, message}

  defp input_class(nil, nil, _invalid), do: nil
  defp input_class(class, nil, _invalid), do: class
  defp input_class(class, error_class, true), do: [class, error_class]
  defp input_class(class, _error_class, false), do: class

  defp prompt_selected?(value) do
    value in [nil, "", []]
  end

  defp selected_values(value, multiple) do
    values =
      cond do
        value in [nil, ""] -> []
        multiple and is_list(value) -> value
        is_list(value) -> value
        true -> [value]
      end

    values
    |> Enum.map(&to_string/1)
    |> MapSet.new()
  end

  defp normalize_options(nil), do: []

  defp normalize_options(options) when is_list(options) do
    Enum.map(options, fn
      {label, value} when is_list(value) -> {:group, label, normalize_options(value)}
      {label, value} -> {:option, label, value}
      value -> {:option, value, value}
    end)
  end

  defp render_select_option({:group, label, options}, selected) do
    assigns = %{label: to_string(label), options: options, selected: selected}

    ~H"""
    <CoreComponents.select_item_group label={@label}>
      <%= for option <- @options do %>
        {render_select_option(option, @selected)}
      <% end %>
    </CoreComponents.select_item_group>
    """
  end

  defp render_select_option({:option, label, value}, selected) do
    label_text = to_string(label)
    value_text = to_string(value)

    assigns = %{
      label: label_text,
      value: value_text,
      selected: MapSet.member?(selected, value_text)
    }

    ~H"""
    <CoreComponents.select_item label={@label} value={@value} selected={@selected}>
      {@label}
    </CoreComponents.select_item>
    """
  end

  defp select_value(_value, true), do: nil
  defp select_value(value, false) when is_nil(value), do: nil
  defp select_value(value, false), do: to_string(value)
end
