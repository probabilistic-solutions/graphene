defmodule Graphene.CarbonComponents.TimePicker do
  @moduledoc false

  use Phoenix.Component

  alias Graphene.Internal.CoreComponents
  alias Graphene.Internal.FormComponents

  @doc """
  Component `<cds-time-picker>` from `./src/components/time-picker/time-picker.ts`

  Time Picker component.

  ## Events

  * `change` - Undocumented
  * `invalid` - Undocumented

  """
  attr :disabled, :boolean, doc: "Specify whether the control is disabled"
  attr :hide_label, :boolean, doc: "Specify whether the label should be hidden"
  attr :invalid, :boolean, doc: "Specify whether the control is currently invalid"

  attr :invalid_text, :string,
    doc: "Provide the text that is displayed when the control is in an invalid state",
    default: "Invalid time format."

  attr :max_length, :string, doc: "Specify the maximum length of the input value", default: "5"
  attr :name, :string, doc: "Name for the input in FormData"

  attr :pattern, :string,
    doc: "Pattern for input validation",
    default: "(1[012]|[1-9]):[0-5][0-9](\\\\s)?"

  attr :placeholder, :string, doc: "Placeholder text for the input", default: "hh:mm"
  attr :read_only, :boolean, doc: "Specify whether the control should be read-only"
  attr :required, :boolean, doc: "Whether the input is required"

  attr :required_validity_message, :string,
    doc: "Custom message for required validation",
    default: "Please fill out this field."

  attr :size, :string, doc: "Size of the time picker", values: ["sm", "md", "lg"], default: "md"
  attr :type, :string, doc: "Input type", default: "text"
  attr :value, :string, doc: "Value of the input"
  attr :warning, :boolean, doc: "Specify whether the control is in warning state"

  attr :warning_text, :string,
    doc: "Provide the text that is displayed when the control is in a warning state",
    default: "Warning message."

  attr :field, Phoenix.HTML.FormField, doc: "a form field struct, for example: @form[:email]"
  attr :form, :string, default: nil, doc: "the form attribute for the hidden input"

  attr :form_event, :string,
    default: nil,
    doc: "override the custom event used to sync form values"

  attr :rest, :global
  slot :label_text, doc: "The label text."
  slot :time_picker_select, doc: "Slot for time picker select components."

  slot :validity_message,
    doc:
      "The validity message. If present and non-empty, this input shows the UI of its invalid state."

  slot :select_item do
    attr :label, :string
    attr :value, :string
    attr :selected, :boolean
    attr :disabled, :boolean
  end

  slot :inner_block

  def time_picker(%{select_item: [_ | _]} = assigns) do
    assigns =
      assigns
      |> assign_new(:disabled, fn -> false end)
      |> assign_new(:hide_label, fn -> false end)
      |> assign_new(:invalid, fn -> false end)
      |> assign_new(:name, fn -> nil end)
      |> assign_new(:read_only, fn -> false end)
      |> assign_new(:required, fn -> false end)
      |> assign_new(:value, fn -> nil end)
      |> assign_new(:warning, fn -> false end)

    ~H"""
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
  end

  def time_picker(assigns) do
    FormComponents.time_picker(assigns)
  end

  @doc """
  Component `<cds-time-picker-select>` from `./src/components/time-picker/time-picker-select.ts`

  Time picker select dropdown.


  """
  attr :default_value, :string, doc: "Optionally provide the default value of the select"
  attr :disabled, :boolean, doc: "Specify whether the control is disabled"
  attr :id, :string, doc: "Specify a custom id for the select box"
  attr :name, :string, doc: "Name for the select in the `FormData`"
  attr :read_only, :boolean, doc: "Controls the readOnly state of the select"

  attr :size, :string,
    doc: "Size of the time picker select",
    values: ["sm", "md", "lg"],
    default: "md"

  attr :value, :string, doc: "The value of the select."
  attr :rest, :global
  slot :inner_block

  def time_picker_select(assigns) do
    CoreComponents.time_picker_select(assigns)
  end
end
