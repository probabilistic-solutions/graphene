defmodule Graphene.FormComponents do
  @moduledoc """
  Form-aware wrappers for Carbon web components.

  These components bridge Carbon custom change events into native `change`
  events on a hidden input so Phoenix forms can use `phx-change` normally.
  """

  use Phoenix.Component

  alias Graphene.CoreComponents

  defp form_bridge_hook(assigns) do
    ~H"""
    <script :type={Phoenix.LiveView.ColocatedHook} name=".GrapheneFormBridge" runtime>
      {
        mounted() {
          const whenDefined = (tagName, cb) => {
            if (!tagName || !customElements || !customElements.whenDefined) {
              cb();
              return;
            }
            customElements.whenDefined(tagName).then(cb).catch(cb);
          };

          const parseValue = (detail, target) => {
            if (detail && Object.prototype.hasOwnProperty.call(detail, "value")) return detail.value;
            if (detail && detail.item && Object.prototype.hasOwnProperty.call(detail.item, "value")) {
              return detail.item.value;
            }
            if (detail && detail.selectedItem && Object.prototype.hasOwnProperty.call(detail.selectedItem, "value")) {
              return detail.selectedItem.value;
            }
            if (detail && Array.isArray(detail.selectedItems)) {
              return detail.selectedItems.map((item) =>
                item && Object.prototype.hasOwnProperty.call(item, "value") ? item.value : item
              );
            }
            if (target && Object.prototype.hasOwnProperty.call(target, "value")) return target.value;
            if (target && Object.prototype.hasOwnProperty.call(target, "selectedItem")) {
              const selected = target.selectedItem;
              if (selected && Object.prototype.hasOwnProperty.call(selected, "value")) return selected.value;
            }
            return "";
          };

          const parseChecked = (detail, target, detailKey) => {
            if (detailKey && detail && Object.prototype.hasOwnProperty.call(detail, detailKey)) {
              return detail[detailKey];
            }
            if (detail && Object.prototype.hasOwnProperty.call(detail, "toggled")) return detail.toggled;
            if (detail && Object.prototype.hasOwnProperty.call(detail, "checked")) return detail.checked;
            if (target && Object.prototype.hasOwnProperty.call(target, "toggled")) return target.toggled;
            if (target && Object.prototype.hasOwnProperty.call(target, "checked")) return target.checked;
            return false;
          };

          this._formBridgeHandler = (event) => {
            const inputId = this.el.dataset.formInput;
            if (!inputId) return;
            const input = document.getElementById(inputId);
            if (!input) return;

            const mode = this.el.dataset.formMode || "value";
            const detailKey = this.el.dataset.formDetail || null;
            const detail = event && event.detail ? event.detail : null;
            const target = event && event.target ? event.target : this.el;

            if (mode === "boolean") {
              const checked = Boolean(parseChecked(detail, target, detailKey));
              input.value = checked ? "true" : "false";
            } else {
              const value = parseValue(detail, target);
              if (Array.isArray(value)) {
                input.value = JSON.stringify(value);
              } else if (value === null || typeof value === "undefined") {
                input.value = "";
              } else {
                input.value = String(value);
              }
            }

            input.dispatchEvent(new Event("input", { bubbles: true }));
            input.dispatchEvent(new Event("change", { bubbles: true }));
          };

          const eventName = this.el.dataset.formEvent || "change";
          this._formBridgeEvent = eventName;

          const isNativeEvent = eventName === "input" || eventName === "change";
          const attachNativeListener = () => {
            const shadowTarget =
              this.el.shadowRoot && this.el.shadowRoot.querySelector("input, textarea, select");
            if (shadowTarget) {
              this._formBridgeTarget = shadowTarget;
              this._formBridgeTarget.addEventListener(eventName, this._formBridgeHandler);
              return true;
            }
            return false;
          };

          const tagName = (this.el.tagName || "").toLowerCase();
          whenDefined(tagName, () => {

            if (isNativeEvent) {
              if (!attachNativeListener()) {
                let attempts = 0;
                const retry = () => {
                  attempts += 1;
                  if (attachNativeListener()) return;
                  if (attempts < 20) {
                    this._formBridgeTimer = requestAnimationFrame(retry);
                  }
                };
                this._formBridgeTimer = requestAnimationFrame(retry);
              }
            } else {
              this._formBridgeTarget = this.el;
              this._formBridgeTarget.addEventListener(eventName, this._formBridgeHandler);
            }
          });
        },

        destroyed() {
          if (this._formBridgeHandler && this._formBridgeEvent && this._formBridgeTarget) {
            this._formBridgeTarget.removeEventListener(this._formBridgeEvent, this._formBridgeHandler);
          }
          if (this._formBridgeTimer) {
            cancelAnimationFrame(this._formBridgeTimer);
          }
        }
      }
    </script>
    """
  end

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

    hook_name = "#{inspect(__MODULE__)}.GrapheneFormBridge"

    rest =
      (assigns[:rest] || %{})
      |> Map.put_new(:id, id)
      |> Map.merge(%{
        :"phx-hook" => hook_name,
        :"data-form-input" => input_id,
        :"data-form-event" => assigns[:form_event] || default_event,
        :"data-form-mode" => to_string(mode),
        :"data-form-detail" => detail_key
      })

    assigns
    |> assign(:rest, rest)
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
  Component `<cds-checkbox>` from `./src/components/checkbox/checkbox.ts`

  Check box.

  ## Events

  * `cds-checkbox-changed` - The custom event fired after this changebox changes its checked state.


  ## Attributes

  * `checked` (`:boolean`) - Specify whether the underlying input should be checked. Defaults to `false`.
  * `data_table` (`:boolean`) - Specify if checkbox is being used in a data table. Defaults to `false`.
  * `default_checked` (`:any`) - Specify whether the underlying input should be checked by default. Defaults to `nil`.
  * `disabled` (`:boolean`) - Specify whether the Checkbox should be disabled. Defaults to `false`.
  * `helper_text` (`:any`) - Provide text for the form group for additional help. Defaults to `nil`.
  * `hide_checkbox` (`:boolean`) - Specify whether the checkbox should be present in the DOM,
    but invisible and uninteractable. Used for data-table purposes.

    Defaults to `false`.
  * `hide_label` (`:boolean`) - Specify whether the label should be hidden, or not. Defaults to `false`.
  * `id` (`:string`) - Specify a custom id for the checkbox. Defaults to `"checkbox"`.
  * `indeterminate` (`:boolean`) - Specify whether the Checkbox is in an indeterminate state. Defaults to `false`.
  * `invalid` (`:boolean`) - Specify whether the Checkbox is currently invalid. Defaults to `false`.
  * `invalid_text` (`:any`) - Provide the text that is displayed when the Checkbox is in an invalid state. Defaults to `nil`.
  * `label_text` (`:string`) - Provide a label to provide a description of the Checkbox input that you are
    exposing to the user

    Defaults to `nil`.
  * `name` (`:string`) - The form name. Defaults to `nil`.
  * `readonly` (`:boolean`) - Specify whether the Checkbox is read-only. Defaults to `false`.
  * `title` (`:string`) - Specify a title for the node for the Checkbox. Defaults to `nil`.
  * `value` (`:string`) - The value. Defaults to `nil`.
  * `warn` (`:boolean`) - Specify whether the Checkbox is in a warn state. Defaults to `false`.
  * `warn_text` (`:boolean`) - Provide the text that is displayed when the Checkbox is in a warn state. Defaults to `false`.
  * Global attributes are accepted.
  ## Slots

  * `inner_block`


  Form-aware wrapper.
  """
  attr :field, Phoenix.HTML.FormField, doc: "a form field struct, for example: @form[:email]"

  attr :form, :string,
    default: nil,
    doc: "the form attribute for the hidden input"

  attr :form_event, :string,
    default: nil,
    doc: "override the custom event used to sync form values"

  attr :checked, :boolean, doc: "Specify whether the underlying input should be checked"
  attr :data_table, :boolean, doc: "Specify if checkbox is being used in a data table"

  attr :default_checked, :any,
    doc: "Specify whether the underlying input should be checked by default"

  attr :disabled, :boolean, doc: "Specify whether the Checkbox should be disabled"
  attr :helper_text, :any, doc: "Provide text for the form group for additional help"

  attr :hide_checkbox, :boolean,
    doc:
      "Specify whether the checkbox should be present in the DOM,\nbut invisible and uninteractable. Used for data-table purposes."

  attr :hide_label, :boolean, doc: "Specify whether the label should be hidden, or not"
  attr :id, :string, doc: "Specify a custom id for the checkbox", default: "checkbox"
  attr :indeterminate, :boolean, doc: "Specify whether the Checkbox is in an indeterminate state"
  attr :invalid, :boolean, doc: "Specify whether the Checkbox is currently invalid"

  attr :invalid_text, :any,
    doc: "Provide the text that is displayed when the Checkbox is in an invalid state"

  attr :label_text, :string,
    doc:
      "Provide a label to provide a description of the Checkbox input that you are\nexposing to the user"

  attr :name, :string, doc: "The form name."
  attr :readonly, :boolean, doc: "Specify whether the Checkbox is read-only"
  attr :rest, :global
  attr :title, :string, doc: "Specify a title for the node for the Checkbox"
  attr :value, :string, doc: "The value."
  attr :warn, :boolean, doc: "Specify whether the Checkbox is in a warn state"

  attr :warn_text, :boolean,
    doc: "Provide the text that is displayed when the Checkbox is in a warn state"

  slot :inner_block

  def checkbox(assigns) do
    assigns =
      form_input_assigns(assigns,
        name: :checkbox,
        mode: :boolean,
        event: "cds-checkbox-changed",
        checked_attr: :checked
      )

    component_assigns = Map.drop(assigns, [:input_id, :input_value, :component_assigns, :id])
    assigns = assign(assigns, :component_assigns, component_assigns)

    ~H"""
    <input type="hidden" id={@input_id} name={@name} value={@input_value} form={@form} />
    {CoreComponents.checkbox(@component_assigns)}
    <.form_bridge_hook />
    """
  end

  @doc """
  Component `<cds-toggle>` from `./src/components/toggle/toggle.ts`

  Basic toggle.

  ## Events

  * `cds-toggle-changed` - The custom event fired after this changebox changes its checked state.
  * `cds-checkbox-changed` - The custom event fired after this changebox changes its checked state.


  ## Attributes

  * `checked` (`:boolean`) - **Deprecated:** Use `toggled` instead.
    The `checked` attribute will be removed in the next major version.

    Defaults to `false`.
  * `data_table` (`:boolean`) - Specify if checkbox is being used in a data table. Defaults to `false`.
  * `default_checked` (`:any`) - Specify whether the underlying input should be checked by default. Defaults to `nil`.
  * `disabled` (`:boolean`) - Specify whether the Checkbox should be disabled. Defaults to `false`.
  * `helper_text` (`:any`) - Provide text for the form group for additional help. Defaults to `nil`.
  * `hide_checkbox` (`:boolean`) - Specify whether the checkbox should be present in the DOM,
    but invisible and uninteractable. Used for data-table purposes.

    Defaults to `false`.
  * `hide_label` (`:boolean`) - Hide label text. Defaults to `false`.
  * `id` (`:string`) - Specify a custom id for the checkbox. Defaults to `"checkbox"`.
  * `indeterminate` (`:boolean`) - Specify whether the Checkbox is in an indeterminate state. Defaults to `false`.
  * `invalid` (`:boolean`) - Specify whether the Checkbox is currently invalid. Defaults to `false`.
  * `invalid_text` (`:any`) - Provide the text that is displayed when the Checkbox is in an invalid state. Defaults to `nil`.
  * `label_a` (`:string`) - Specify the label for the "on" position. Defaults to `"On"`.
  * `label_b` (`:string`) - Specify the label for the "off" position. Defaults to `"Off"`.
  * `name` (`:string`) - The form name. Defaults to `nil`.
  * `read_only` (`:boolean`) - Read only boolean. Defaults to `false`.
  * `readonly` (`:boolean`) - Specify whether the Checkbox is read-only. Defaults to `false`.
  * `size` (`:string`) - Toggle size. Defaults to `""`. Must be one of `""`, or `"sm"`.
  * `title` (`:string`) - Specify a title for the node for the Checkbox. Defaults to `nil`.
  * `toggled` (`:boolean`) - Specify whether the control is toggled. Defaults to `nil`.
  * `value` (`:string`) - The value. Defaults to `nil`.
  * `warn` (`:boolean`) - Specify whether the Checkbox is in a warn state. Defaults to `false`.
  * `warn_text` (`:boolean`) - Provide the text that is displayed when the Checkbox is in a warn state. Defaults to `false`.
  * Global attributes are accepted.
  ## Slots

  * `checked_text` - The text for the checked state. Accepts attributes:

    * `tag` (`:string`)
  * `label_text` - The label text. Accepts attributes:

    * `tag` (`:string`)
  * `unchecked_text` - The text for the unchecked state. Accepts attributes:

    * `tag` (`:string`)
  * `inner_block`


  Form-aware wrapper.
  """
  attr :field, Phoenix.HTML.FormField, doc: "a form field struct, for example: @form[:email]"

  attr :form, :string,
    default: nil,
    doc: "the form attribute for the hidden input"

  attr :form_event, :string,
    default: nil,
    doc: "override the custom event used to sync form values"

  attr :checked, :boolean,
    doc:
      "\n**Deprecated:** Use `toggled` instead.\nThe `checked` attribute will be removed in the next major version."

  attr :data_table, :boolean, doc: "Specify if checkbox is being used in a data table"

  attr :default_checked, :any,
    doc: "Specify whether the underlying input should be checked by default"

  attr :disabled, :boolean, doc: "Specify whether the Checkbox should be disabled"
  attr :helper_text, :any, doc: "Provide text for the form group for additional help"

  attr :hide_checkbox, :boolean,
    doc:
      "Specify whether the checkbox should be present in the DOM,\nbut invisible and uninteractable. Used for data-table purposes."

  attr :hide_label, :boolean, doc: "Hide label text."
  attr :id, :string, doc: "Specify a custom id for the checkbox", default: "checkbox"
  attr :indeterminate, :boolean, doc: "Specify whether the Checkbox is in an indeterminate state"
  attr :invalid, :boolean, doc: "Specify whether the Checkbox is currently invalid"

  attr :invalid_text, :any,
    doc: "Provide the text that is displayed when the Checkbox is in an invalid state"

  attr :label_a, :string, doc: "Specify the label for the \"on\" position", default: "On"
  attr :label_b, :string, doc: "Specify the label for the \"off\" position", default: "Off"
  attr :name, :string, doc: "The form name."
  attr :read_only, :boolean, doc: "Read only boolean."
  attr :readonly, :boolean, doc: "Specify whether the Checkbox is read-only"
  attr :rest, :global
  attr :size, :string, doc: "Toggle size.", values: ["", "sm"], default: ""
  attr :title, :string, doc: "Specify a title for the node for the Checkbox"
  attr :toggled, :boolean, doc: "Specify whether the control is toggled"
  attr :value, :string, doc: "The value."
  attr :warn, :boolean, doc: "Specify whether the Checkbox is in a warn state"

  attr :warn_text, :boolean,
    doc: "Provide the text that is displayed when the Checkbox is in a warn state"

  slot :checked_text, doc: "The text for the checked state." do
    attr :tag, :string
  end

  slot :inner_block

  slot :label_text, doc: "The label text." do
    attr :tag, :string
  end

  slot :unchecked_text, doc: "The text for the unchecked state." do
    attr :tag, :string
  end

  def toggle(assigns) do
    assigns =
      form_input_assigns(assigns,
        name: :toggle,
        mode: :boolean,
        event: "cds-toggle-changed",
        checked_attr: :toggled,
        detail_key: "toggled"
      )

    component_assigns = Map.drop(assigns, [:input_id, :input_value, :component_assigns, :id])
    assigns = assign(assigns, :component_assigns, component_assigns)

    ~H"""
    <input type="hidden" id={@input_id} name={@name} value={@input_value} form={@form} />
    {CoreComponents.toggle(@component_assigns)}
    <.form_bridge_hook />
    """
  end

  @doc """
  Component `<cds-radio-button-group>` from `./src/components/radio-button/radio-button-group.ts`

  Radio button group.

  ## Events

  * `cds-radio-button-group-changed` - The custom event fired after this radio button group changes its selected item.
  * `cds-radio-button-changed` - The name of the custom event fired after a radio button changes its checked state.


  ## Attributes

  * `default_selected` (`:string`) - The `value` attribute for the `<input>` for selection. Defaults to `nil`.
  * `disabled` (`:boolean`) - `true` if the radio button group should be disabled. Defaults to `false`.
  * `helper_text` (`:any`) - The helper text. Defaults to `nil`.
  * `invalid` (`:boolean`) - Specify if the currently value is invalid. Defaults to `false`.
  * `invalid_text` (`:string`) - Message which is displayed if the value is invalid. Defaults to `nil`.
  * `label_position` (`:string`) - The label position. Defaults to `"right"`. Must be one of `"left"`, or `"right"`.
  * `legend_text` (`:string`) - The label position. Defaults to `nil`.
  * `name` (`:string`) - The `name` attribute for the `<input>` for selection. Defaults to `nil`.
  * `orientation` (`:string`) - The orientation to lay out radio buttons. Defaults to `"horizontal"`. Must be one of `"horizontal"`, or `"vertical"`.
  * `read_only` (`:boolean`) - Controls the readonly state of the radio button group. Defaults to `false`.
  * `required` (`:boolean`) - `true` to specify if input selection in group is required. Defaults to `false`.
  * `value` (`:string`) - The `value` attribute for the `<input>` for selection. Defaults to `nil`.
  * `warn` (`:boolean`) - Specify whether the control is currently in warning state. Defaults to `false`.
  * `warn_text` (`:string`) - Provide the text that is displayed when the control is in warning state. Defaults to `nil`.
  * Global attributes are accepted.
  ## Slots

  * `inner_block`


  Form-aware wrapper.
  """
  attr :field, Phoenix.HTML.FormField, doc: "a form field struct, for example: @form[:email]"

  attr :form, :string,
    default: nil,
    doc: "the form attribute for the hidden input"

  attr :form_event, :string,
    default: nil,
    doc: "override the custom event used to sync form values"

  attr :default_selected, :string, doc: "The `value` attribute for the `<input>` for selection."
  attr :disabled, :boolean, doc: "`true` if the radio button group should be disabled."
  attr :helper_text, :any, doc: "The helper text."
  attr :invalid, :boolean, doc: "Specify if the currently value is invalid."
  attr :invalid_text, :string, doc: "Message which is displayed if the value is invalid."

  attr :label_position, :string,
    doc: "The label position.",
    values: ["left", "right"],
    default: "right"

  attr :legend_text, :string, doc: "The label position."
  attr :name, :string, doc: "The `name` attribute for the `<input>` for selection."

  attr :orientation, :string,
    doc: "The orientation to lay out radio buttons.",
    values: ["horizontal", "vertical"],
    default: "horizontal"

  attr :read_only, :boolean, doc: "Controls the readonly state of the radio button group."
  attr :required, :boolean, doc: "`true` to specify if input selection in group is required."
  attr :rest, :global
  attr :value, :string, doc: "The `value` attribute for the `<input>` for selection."
  attr :warn, :boolean, doc: "Specify whether the control is currently in warning state"

  attr :warn_text, :string,
    doc: "Provide the text that is displayed when the control is in warning state"

  slot :inner_block

  def radio_button_group(assigns) do
    assigns =
      form_input_assigns(assigns,
        name: :radio_button_group,
        mode: :value,
        event: "cds-radio-button-group-changed"
      )

    component_assigns = Map.drop(assigns, [:input_id, :input_value, :component_assigns, :id])
    assigns = assign(assigns, :component_assigns, component_assigns)

    ~H"""
    <input type="hidden" id={@input_id} name={@name} value={@input_value} form={@form} />
    {CoreComponents.radio_button_group(@component_assigns)}
    <.form_bridge_hook />
    """
  end

  @doc """
  Component `<cds-number-input>` from `./src/components/number-input/number-input.ts`

  Number input.

  ## Events

  * `cds-number-input` - The name of the custom event fired after the value is changed upon a user gesture.
  * `invalid` - Undocumented


  ## Attributes

  * `allow_empty` (`:boolean`) - `true` to allow empty string. Defaults to `false`.
  * `autocomplete` (`:string`) - May be any of the standard HTML autocomplete options. Defaults to `nil`.
  * `autofocus` (`:boolean`) - Sets the input to be focussed automatically on page load. Defaults to false. Defaults to `false`.
  * `decrement_button_assistive_text` (`:string`) - Aria text for the button that decrements the value. Defaults to `"decrease number input"`.
  * `default_value` (`:string`) - Optional starting value for uncontrolled state. Defaults to `nil`.
  * `disable_wheel` (`:boolean`) - Specify if the wheel functionality for the input should be disabled, or not. Defaults to `false`.
  * `disabled` (`:boolean`) - Controls the disabled state of the input. Defaults to `false`.
  * `enable_counter` (`:boolean`) - Specify whether to display the character counter. Defaults to `false`.
  * `hide_label` (`:boolean`) - Specify whether you want the underlying label to be visually hidden. Defaults to `false`.
  * `hide_steppers` (`:boolean`) - Specify whether you want the steppers to be hidden. Defaults to `false`.
  * `hide_password_label` (`:string`) - "Hide password" tooltip text on password visibility toggle. Defaults to `"Hide password"`.
  * `icon_description` (`:string`) - Provide a description for up/down icons that can be read by screen readers. Defaults to `nil`.
  * `increment_button_assistive_text` (`:string`) - Aria text for the button that increments the value. Defaults to `"increase number input"`.
  * `inline` (`:boolean`) - true to use the inline version. Defaults to `false`.
  * `invalid` (`:boolean`) - Specify if the currently value is invalid. Defaults to `false`.
  * `invalid_text` (`:string`) - Message which is displayed if the value is invalid. Defaults to `nil`.
  * `is_fluid` (`:boolean`) - Set to true to use the fluid variant. Defaults to `false`.
  * `label` (`:string`) - Generic label that will be used as the textual representation of what this field is for. Defaults to `nil`.
  * `max` (`:string`) - The maximum value allowed in the input. Defaults to `nil`.
  * `max_count` (`:any`) - Max character count allowed for input. This is needed in order for enableCounter to display. Defaults to `nil`.
  * `min` (`:string`) - The minimum value allowed in the input. Defaults to `nil`.
  * `name` (`:string`) - Name for the input in the `FormData`. Defaults to `nil`.
  * `pattern` (`:string`) - Pattern to validate the input against for HTML validity checking. Defaults to `nil`.
  * `placeholder` (`:string`) - Value to display when the input has an empty `value`. Defaults to `nil`.
  * `readonly` (`:boolean`) - Specify if the component should be read-only. Defaults to `false`.
  * `required` (`:boolean`) - Boolean property to set the required status. Defaults to `false`.
  * `required_validity_message` (`:string`) - The special validity message for `required`. Defaults to `"Please fill out this field."`.
  * `show_password_visibility_toggle` (`:boolean`) - Boolean property to render password visibility toggle. Defaults to `false`.
  * `show_password_label` (`:string`) - "Show password" tooltip text on password visibility toggle. Defaults to `"Show password"`.
  * `size` (`:any`) - The input box size. Defaults to `nil`.
  * `step` (`:string`) - The amount the value should increase or decrease by. Defaults to `"1"`.
  * `tooltip_alignment` (`:string`) - Specify the alignment of the tooltip to the icon-only button.
    Can be one of: start, center, or end.

    Defaults to `"center"`. Must be one of `"start"`, `"center"`, or `"end"`.
  * `tooltip_direction` (`:string`) - Specify the direction of the tooltip for icon-only buttons.
    Can be either top, right, bottom, or left.

    Defaults to `"bottom"`. Must be one of `"top"`, `"right"`, `"bottom"`, or `"left"`.
  * `type` (`:string`) - The type of the input. Can be one of the types listed in the INPUT_TYPE enum. Defaults to `"text"`. Must be one of `"email"`, `"password"`, `"tel"`, `"text"`, or `"url"`.
  * `value` (`:string`) - The value of the input. Defaults to `nil`.
  * `warn` (`:boolean`) - Specify whether the control is currently in warning state. Defaults to `false`.
  * `warn_text` (`:string`) - Provide the text that is displayed when the control is in warning state. Defaults to `nil`.
  * Global attributes are accepted.
  ## Slots

  * `helper_text` - The helper text. Accepts attributes:

    * `tag` (`:string`)
  * `label_text` - The label text. Accepts attributes:

    * `tag` (`:string`)
  * `validity_message` - The validity message. If present and non-empty, this input shows the UI of its invalid state. Accepts attributes:

    * `tag` (`:string`)
  * `inner_block`


  Form-aware wrapper.
  """
  attr :field, Phoenix.HTML.FormField, doc: "a form field struct, for example: @form[:email]"

  attr :form, :string,
    default: nil,
    doc: "the form attribute for the hidden input"

  attr :form_event, :string,
    default: nil,
    doc: "override the custom event used to sync form values"

  attr :allow_empty, :boolean, doc: "`true` to allow empty string."
  attr :autocomplete, :string, doc: "May be any of the standard HTML autocomplete options"

  attr :autofocus, :boolean,
    doc: "Sets the input to be focussed automatically on page load. Defaults to false"

  attr :decrement_button_assistive_text, :string,
    doc: "Aria text for the button that decrements the value",
    default: "decrease number input"

  attr :default_value, :string, doc: "Optional starting value for uncontrolled state"

  attr :disable_wheel, :boolean,
    doc: "Specify if the wheel functionality for the input should be disabled, or not"

  attr :disabled, :boolean, doc: "Controls the disabled state of the input"
  attr :enable_counter, :boolean, doc: "Specify whether to display the character counter"

  attr :hide_label, :boolean,
    doc: "Specify whether you want the underlying label to be visually hidden"

  attr :hide_password_label, :string,
    doc: "\"Hide password\" tooltip text on password visibility toggle",
    default: "Hide password"

  attr :hide_steppers, :boolean, doc: "Specify whether you want the steppers to be hidden"

  attr :icon_description, :string,
    doc: "Provide a description for up/down icons that can be read by screen readers"

  attr :increment_button_assistive_text, :string,
    doc: "Aria text for the button that increments the value",
    default: "increase number input"

  attr :inline, :boolean, doc: "true to use the inline version."
  attr :invalid, :boolean, doc: "Specify if the currently value is invalid."
  attr :invalid_text, :string, doc: "Message which is displayed if the value is invalid."
  attr :is_fluid, :boolean, doc: "Set to true to use the fluid variant."

  attr :label, :string,
    doc: "Generic label that will be used as the textual representation of what this field is for"

  attr :max, :string, doc: "The maximum value allowed in the input"

  attr :max_count, :any,
    doc:
      "Max character count allowed for input. This is needed in order for enableCounter to display"

  attr :min, :string, doc: "The minimum value allowed in the input"
  attr :name, :string, doc: "Name for the input in the `FormData`"
  attr :pattern, :string, doc: "Pattern to validate the input against for HTML validity checking"
  attr :placeholder, :string, doc: "Value to display when the input has an empty `value`"
  attr :readonly, :boolean, doc: "Specify if the component should be read-only"
  attr :required, :boolean, doc: "Boolean property to set the required status"

  attr :required_validity_message, :string,
    doc: "The special validity message for `required`.",
    default: "Please fill out this field."

  attr :rest, :global

  attr :show_password_label, :string,
    doc: "\"Show password\" tooltip text on password visibility toggle",
    default: "Show password"

  attr :show_password_visibility_toggle, :boolean,
    doc: "Boolean property to render password visibility toggle"

  attr :size, :any, doc: "The input box size."
  attr :step, :string, doc: "The amount the value should increase or decrease by", default: "1"

  attr :tooltip_alignment, :string,
    doc:
      "Specify the alignment of the tooltip to the icon-only button.\nCan be one of: start, center, or end.",
    values: ["start", "center", "end"],
    default: "center"

  attr :tooltip_direction, :string,
    doc:
      "Specify the direction of the tooltip for icon-only buttons.\nCan be either top, right, bottom, or left.",
    values: ["top", "right", "bottom", "left"],
    default: "bottom"

  attr :type, :string,
    doc: "The type of the input. Can be one of the types listed in the INPUT_TYPE enum",
    values: ["email", "password", "tel", "text", "url"],
    default: "text"

  attr :value, :string, doc: "The value of the input."
  attr :warn, :boolean, doc: "Specify whether the control is currently in warning state"

  attr :warn_text, :string,
    doc: "Provide the text that is displayed when the control is in warning state"

  slot :helper_text, doc: "The helper text." do
    attr :tag, :string
  end

  slot :inner_block

  slot :label_text, doc: "The label text." do
    attr :tag, :string
  end

  slot :validity_message,
    doc:
      "The validity message. If present and non-empty, this input shows the UI of its invalid state." do
    attr :tag, :string
  end

  def number_input(assigns) do
    assigns =
      form_input_assigns(assigns,
        name: :number_input,
        mode: :value,
        event: "cds-number-input",
        value_attr: :default_value
      )

    component_assigns = Map.drop(assigns, [:input_id, :input_value, :component_assigns, :id])
    assigns = assign(assigns, :component_assigns, component_assigns)

    ~H"""
    <input type="hidden" id={@input_id} name={@name} value={@input_value} form={@form} />
    {CoreComponents.number_input(@component_assigns)}
    <.form_bridge_hook />
    """
  end

  @doc """
  Component `<cds-fluid-number-input>` from `./src/components/fluid-number-input/fluid-number-input.ts`

  Fluid number input.

  ## Events

  * `cds-number-input` - The name of the custom event fired after the value is changed upon a user gesture.
  * `invalid` - Undocumented


  ## Attributes

  * `allow_empty` (`:boolean`) - `true` to allow empty string. Defaults to `false`.
  * `autocomplete` (`:string`) - May be any of the standard HTML autocomplete options. Defaults to `nil`.
  * `autofocus` (`:boolean`) - Sets the input to be focussed automatically on page load. Defaults to false. Defaults to `false`.
  * `decrement_button_assistive_text` (`:string`) - Aria text for the button that decrements the value. Defaults to `"decrease number input"`.
  * `default_value` (`:string`) - Optional starting value for uncontrolled state. Defaults to `nil`.
  * `disable_wheel` (`:boolean`) - Specify if the wheel functionality for the input should be disabled, or not. Defaults to `false`.
  * `disabled` (`:boolean`) - Controls the disabled state of the input. Defaults to `false`.
  * `enable_counter` (`:boolean`) - Specify whether to display the character counter. Defaults to `false`.
  * `hide_label` (`:boolean`) - Specify whether you want the underlying label to be visually hidden. Defaults to `false`.
  * `hide_steppers` (`:boolean`) - Specify whether you want the steppers to be hidden. Defaults to `false`.
  * `hide_password_label` (`:string`) - "Hide password" tooltip text on password visibility toggle. Defaults to `"Hide password"`.
  * `icon_description` (`:string`) - Provide a description for up/down icons that can be read by screen readers. Defaults to `nil`.
  * `increment_button_assistive_text` (`:string`) - Aria text for the button that increments the value. Defaults to `"increase number input"`.
  * `inline` (`:boolean`) - true to use the inline version. Defaults to `false`.
  * `invalid` (`:boolean`) - Specify if the currently value is invalid. Defaults to `false`.
  * `invalid_text` (`:string`) - Message which is displayed if the value is invalid. Defaults to `nil`.
  * `is_fluid` (`:boolean`) - Set to true to use the fluid variant. Defaults to `false`.
  * `label` (`:string`) - Generic label that will be used as the textual representation of what this field is for. Defaults to `nil`.
  * `max` (`:string`) - The maximum value allowed in the input. Defaults to `nil`.
  * `max_count` (`:any`) - Max character count allowed for input. This is needed in order for enableCounter to display. Defaults to `nil`.
  * `min` (`:string`) - The minimum value allowed in the input. Defaults to `nil`.
  * `name` (`:string`) - Name for the input in the `FormData`. Defaults to `nil`.
  * `pattern` (`:string`) - Pattern to validate the input against for HTML validity checking. Defaults to `nil`.
  * `placeholder` (`:string`) - Value to display when the input has an empty `value`. Defaults to `nil`.
  * `readonly` (`:boolean`) - Specify if the component should be read-only. Defaults to `false`.
  * `required` (`:boolean`) - Boolean property to set the required status. Defaults to `false`.
  * `required_validity_message` (`:string`) - The special validity message for `required`. Defaults to `"Please fill out this field."`.
  * `show_password_visibility_toggle` (`:boolean`) - Boolean property to render password visibility toggle. Defaults to `false`.
  * `show_password_label` (`:string`) - "Show password" tooltip text on password visibility toggle. Defaults to `"Show password"`.
  * `size` (`:any`) - The input box size. Defaults to `nil`.
  * `step` (`:string`) - The amount the value should increase or decrease by. Defaults to `"1"`.
  * `tooltip_alignment` (`:string`) - Specify the alignment of the tooltip to the icon-only button.
    Can be one of: start, center, or end.

    Defaults to `"center"`. Must be one of `"start"`, `"center"`, or `"end"`.
  * `tooltip_direction` (`:string`) - Specify the direction of the tooltip for icon-only buttons.
    Can be either top, right, bottom, or left.

    Defaults to `"bottom"`. Must be one of `"top"`, `"right"`, `"bottom"`, or `"left"`.
  * `type` (`:string`) - The type of the input. Can be one of the types listed in the INPUT_TYPE enum. Defaults to `"text"`. Must be one of `"email"`, `"password"`, `"tel"`, `"text"`, or `"url"`.
  * `value` (`:string`) - The value of the input. Defaults to `nil`.
  * `warn` (`:boolean`) - Specify whether the control is currently in warning state. Defaults to `false`.
  * `warn_text` (`:string`) - Provide the text that is displayed when the control is in warning state. Defaults to `nil`.
  * Global attributes are accepted.
  ## Slots

  * `helper_text` - The helper text. Accepts attributes:

    * `tag` (`:string`)
  * `label_text` - The label text. Accepts attributes:

    * `tag` (`:string`)
  * `validity_message` - The validity message. If present and non-empty, this input shows the UI of its invalid state. Accepts attributes:

    * `tag` (`:string`)
  * `inner_block`


  Form-aware wrapper.
  """
  attr :field, Phoenix.HTML.FormField, doc: "a form field struct, for example: @form[:email]"

  attr :form, :string,
    default: nil,
    doc: "the form attribute for the hidden input"

  attr :form_event, :string,
    default: nil,
    doc: "override the custom event used to sync form values"

  attr :allow_empty, :boolean, doc: "`true` to allow empty string."
  attr :autocomplete, :string, doc: "May be any of the standard HTML autocomplete options"

  attr :autofocus, :boolean,
    doc: "Sets the input to be focussed automatically on page load. Defaults to false"

  attr :decrement_button_assistive_text, :string,
    doc: "Aria text for the button that decrements the value",
    default: "decrease number input"

  attr :default_value, :string, doc: "Optional starting value for uncontrolled state"

  attr :disable_wheel, :boolean,
    doc: "Specify if the wheel functionality for the input should be disabled, or not"

  attr :disabled, :boolean, doc: "Controls the disabled state of the input"
  attr :enable_counter, :boolean, doc: "Specify whether to display the character counter"

  attr :hide_label, :boolean,
    doc: "Specify whether you want the underlying label to be visually hidden"

  attr :hide_password_label, :string,
    doc: "\"Hide password\" tooltip text on password visibility toggle",
    default: "Hide password"

  attr :hide_steppers, :boolean, doc: "Specify whether you want the steppers to be hidden"

  attr :icon_description, :string,
    doc: "Provide a description for up/down icons that can be read by screen readers"

  attr :increment_button_assistive_text, :string,
    doc: "Aria text for the button that increments the value",
    default: "increase number input"

  attr :inline, :boolean, doc: "true to use the inline version."
  attr :invalid, :boolean, doc: "Specify if the currently value is invalid."
  attr :invalid_text, :string, doc: "Message which is displayed if the value is invalid."
  attr :is_fluid, :boolean, doc: "Set to true to use the fluid variant."

  attr :label, :string,
    doc: "Generic label that will be used as the textual representation of what this field is for"

  attr :max, :string, doc: "The maximum value allowed in the input"

  attr :max_count, :any,
    doc:
      "Max character count allowed for input. This is needed in order for enableCounter to display"

  attr :min, :string, doc: "The minimum value allowed in the input"
  attr :name, :string, doc: "Name for the input in the `FormData`"
  attr :pattern, :string, doc: "Pattern to validate the input against for HTML validity checking"
  attr :placeholder, :string, doc: "Value to display when the input has an empty `value`"
  attr :readonly, :boolean, doc: "Specify if the component should be read-only"
  attr :required, :boolean, doc: "Boolean property to set the required status"

  attr :required_validity_message, :string,
    doc: "The special validity message for `required`.",
    default: "Please fill out this field."

  attr :rest, :global

  attr :show_password_label, :string,
    doc: "\"Show password\" tooltip text on password visibility toggle",
    default: "Show password"

  attr :show_password_visibility_toggle, :boolean,
    doc: "Boolean property to render password visibility toggle"

  attr :size, :any, doc: "The input box size."
  attr :step, :string, doc: "The amount the value should increase or decrease by", default: "1"

  attr :tooltip_alignment, :string,
    doc:
      "Specify the alignment of the tooltip to the icon-only button.\nCan be one of: start, center, or end.",
    values: ["start", "center", "end"],
    default: "center"

  attr :tooltip_direction, :string,
    doc:
      "Specify the direction of the tooltip for icon-only buttons.\nCan be either top, right, bottom, or left.",
    values: ["top", "right", "bottom", "left"],
    default: "bottom"

  attr :type, :string,
    doc: "The type of the input. Can be one of the types listed in the INPUT_TYPE enum",
    values: ["email", "password", "tel", "text", "url"],
    default: "text"

  attr :value, :string, doc: "The value of the input."
  attr :warn, :boolean, doc: "Specify whether the control is currently in warning state"

  attr :warn_text, :string,
    doc: "Provide the text that is displayed when the control is in warning state"

  slot :helper_text, doc: "The helper text." do
    attr :tag, :string
  end

  slot :inner_block

  slot :label_text, doc: "The label text." do
    attr :tag, :string
  end

  slot :validity_message,
    doc:
      "The validity message. If present and non-empty, this input shows the UI of its invalid state." do
    attr :tag, :string
  end

  def fluid_number_input(assigns) do
    assigns =
      form_input_assigns(assigns,
        name: :fluid_number_input,
        mode: :value,
        event: "cds-number-input",
        value_attr: :default_value
      )

    component_assigns = Map.drop(assigns, [:input_id, :input_value, :component_assigns, :id])
    assigns = assign(assigns, :component_assigns, component_assigns)

    ~H"""
    <input type="hidden" id={@input_id} name={@name} value={@input_value} form={@form} />
    {CoreComponents.fluid_number_input(@component_assigns)}
    <.form_bridge_hook />
    """
  end

  @doc """
  Component `<cds-text-input>` from `./src/components/text-input/text-input.ts`

  Text Input element. Supports all the usual attributes for textual input types

  ## Events

  * `invalid` - Undocumented


  ## Attributes

  * `autocomplete` (`:string`) - May be any of the standard HTML autocomplete options. Defaults to `nil`.
  * `autofocus` (`:boolean`) - Sets the input to be focussed automatically on page load. Defaults to false. Defaults to `false`.
  * `disabled` (`:boolean`) - Controls the disabled state of the input. Defaults to `false`.
  * `enable_counter` (`:boolean`) - Specify whether to display the character counter. Defaults to `false`.
  * `hide_label` (`:boolean`) - Specify whether you want the underlying label to be visually hidden. Defaults to `false`.
  * `hide_password_label` (`:string`) - "Hide password" tooltip text on password visibility toggle. Defaults to `"Hide password"`.
  * `inline` (`:boolean`) - true to use the inline version. Defaults to `false`.
  * `invalid` (`:boolean`) - Specify if the currently value is invalid. Defaults to `false`.
  * `invalid_text` (`:string`) - Message which is displayed if the value is invalid. Defaults to `nil`.
  * `is_fluid` (`:boolean`) - Defaults to `false`.
  * `label` (`:string`) - Generic label that will be used as the textual representation of what this field is for. Defaults to `nil`.
  * `max_count` (`:any`) - Max character count allowed for input. This is needed in order for enableCounter to display. Defaults to `nil`.
  * `name` (`:string`) - Name for the input in the `FormData`. Defaults to `nil`.
  * `pattern` (`:string`) - Pattern to validate the input against for HTML validity checking. Defaults to `nil`.
  * `placeholder` (`:string`) - Value to display when the input has an empty `value`. Defaults to `nil`.
  * `readonly` (`:boolean`) - Specify if the component should be read-only. Defaults to `false`.
  * `required` (`:boolean`) - Boolean property to set the required status. Defaults to `false`.
  * `required_validity_message` (`:string`) - The special validity message for `required`. Defaults to `"Please fill out this field."`.
  * `show_password_visibility_toggle` (`:boolean`) - Boolean property to render password visibility toggle. Defaults to `false`.
  * `show_password_label` (`:string`) - "Show password" tooltip text on password visibility toggle. Defaults to `"Show password"`.
  * `size` (`:any`) - The input box size. Defaults to `nil`.
  * `tooltip_alignment` (`:string`) - Specify the alignment of the tooltip to the icon-only button.
    Can be one of: start, center, or end.

    Defaults to `"center"`. Must be one of `"start"`, `"center"`, or `"end"`.
  * `tooltip_direction` (`:string`) - Specify the direction of the tooltip for icon-only buttons.
    Can be either top, right, bottom, or left.

    Defaults to `"bottom"`. Must be one of `"top"`, `"right"`, `"bottom"`, or `"left"`.
  * `type` (`:string`) - The type of the input. Can be one of the types listed in the INPUT_TYPE enum. Defaults to `"text"`. Must be one of `"email"`, `"password"`, `"tel"`, `"text"`, or `"url"`.
  * `value` (`:string`) - The value of the input. Defaults to `nil`.
  * `warn` (`:boolean`) - Specify whether the control is currently in warning state. Defaults to `false`.
  * `warn_text` (`:string`) - Provide the text that is displayed when the control is in warning state. Defaults to `nil`.
  * Global attributes are accepted.
  ## Slots

  * `helper_text` - The helper text. Accepts attributes:

    * `tag` (`:string`)
  * `label_text` - The label text. Accepts attributes:

    * `tag` (`:string`)
  * `validity_message` - The validity message. If present and non-empty, this input shows the UI of its invalid state. Accepts attributes:

    * `tag` (`:string`)
  * `inner_block`


  Form-aware wrapper.
  """
  attr :field, Phoenix.HTML.FormField, doc: "a form field struct, for example: @form[:email]"

  attr :form, :string,
    default: nil,
    doc: "the form attribute for the hidden input"

  attr :form_event, :string,
    default: nil,
    doc: "override the custom event used to sync form values"

  attr :autocomplete, :string, doc: "May be any of the standard HTML autocomplete options"

  attr :autofocus, :boolean,
    doc: "Sets the input to be focussed automatically on page load. Defaults to false"

  attr :disabled, :boolean, doc: "Controls the disabled state of the input"
  attr :enable_counter, :boolean, doc: "Specify whether to display the character counter"

  attr :hide_label, :boolean,
    doc: "Specify whether you want the underlying label to be visually hidden"

  attr :hide_password_label, :string,
    doc: "\"Hide password\" tooltip text on password visibility toggle",
    default: "Hide password"

  attr :inline, :boolean, doc: "true to use the inline version."
  attr :invalid, :boolean, doc: "Specify if the currently value is invalid."
  attr :invalid_text, :string, doc: "Message which is displayed if the value is invalid."
  attr :is_fluid, :boolean

  attr :label, :string,
    doc: "Generic label that will be used as the textual representation of what this field is for"

  attr :max_count, :any,
    doc:
      "Max character count allowed for input. This is needed in order for enableCounter to display"

  attr :name, :string, doc: "Name for the input in the `FormData`"
  attr :pattern, :string, doc: "Pattern to validate the input against for HTML validity checking"
  attr :placeholder, :string, doc: "Value to display when the input has an empty `value`"
  attr :readonly, :boolean, doc: "Specify if the component should be read-only"
  attr :required, :boolean, doc: "Boolean property to set the required status"

  attr :required_validity_message, :string,
    doc: "The special validity message for `required`.",
    default: "Please fill out this field."

  attr :rest, :global

  attr :show_password_label, :string,
    doc: "\"Show password\" tooltip text on password visibility toggle",
    default: "Show password"

  attr :show_password_visibility_toggle, :boolean,
    doc: "Boolean property to render password visibility toggle"

  attr :size, :any, doc: "The input box size."

  attr :tooltip_alignment, :string,
    doc:
      "Specify the alignment of the tooltip to the icon-only button.\nCan be one of: start, center, or end.",
    values: ["start", "center", "end"],
    default: "center"

  attr :tooltip_direction, :string,
    doc:
      "Specify the direction of the tooltip for icon-only buttons.\nCan be either top, right, bottom, or left.",
    values: ["top", "right", "bottom", "left"],
    default: "bottom"

  attr :type, :string,
    doc: "The type of the input. Can be one of the types listed in the INPUT_TYPE enum",
    values: ["email", "password", "tel", "text", "url"],
    default: "text"

  attr :value, :string, doc: "The value of the input."
  attr :warn, :boolean, doc: "Specify whether the control is currently in warning state"

  attr :warn_text, :string,
    doc: "Provide the text that is displayed when the control is in warning state"

  slot :helper_text, doc: "The helper text." do
    attr :tag, :string
  end

  slot :inner_block

  slot :label_text, doc: "The label text." do
    attr :tag, :string
  end

  slot :validity_message,
    doc:
      "The validity message. If present and non-empty, this input shows the UI of its invalid state." do
    attr :tag, :string
  end

  def text_input(assigns) do
    assigns = form_input_assigns(assigns, name: :text_input, mode: :value, event: "input")
    component_assigns = Map.drop(assigns, [:input_id, :input_value, :component_assigns, :id])
    assigns = assign(assigns, :component_assigns, component_assigns)

    ~H"""
    <input type="hidden" id={@input_id} name={@name} value={@input_value} form={@form} />
    {CoreComponents.text_input(@component_assigns)}
    <.form_bridge_hook />
    """
  end

  @doc """
  Component `<cds-fluid-text-input>` from `./src/components/fluid-text-input/fluid-text-input.ts`

  Fluid text input.

  ## Events

  * `invalid` - Undocumented


  ## Attributes

  * `autocomplete` (`:string`) - May be any of the standard HTML autocomplete options. Defaults to `nil`.
  * `autofocus` (`:boolean`) - Sets the input to be focussed automatically on page load. Defaults to false. Defaults to `false`.
  * `disabled` (`:boolean`) - Controls the disabled state of the input. Defaults to `false`.
  * `enable_counter` (`:boolean`) - Specify whether to display the character counter. Defaults to `false`.
  * `hide_label` (`:boolean`) - Specify whether you want the underlying label to be visually hidden. Defaults to `false`.
  * `hide_password_label` (`:string`) - "Hide password" tooltip text on password visibility toggle. Defaults to `"Hide password"`.
  * `inline` (`:boolean`) - true to use the inline version. Defaults to `false`.
  * `invalid` (`:boolean`) - Specify if the currently value is invalid. Defaults to `false`.
  * `invalid_text` (`:string`) - Message which is displayed if the value is invalid. Defaults to `nil`.
  * `is_fluid` (`:boolean`) - Defaults to `false`.
  * `label` (`:string`) - Generic label that will be used as the textual representation of what this field is for. Defaults to `nil`.
  * `max_count` (`:any`) - Max character count allowed for input. This is needed in order for enableCounter to display. Defaults to `nil`.
  * `name` (`:string`) - Name for the input in the `FormData`. Defaults to `nil`.
  * `pattern` (`:string`) - Pattern to validate the input against for HTML validity checking. Defaults to `nil`.
  * `placeholder` (`:string`) - Value to display when the input has an empty `value`. Defaults to `nil`.
  * `readonly` (`:boolean`) - Specify if the component should be read-only. Defaults to `false`.
  * `required` (`:boolean`) - Boolean property to set the required status. Defaults to `false`.
  * `required_validity_message` (`:string`) - The special validity message for `required`. Defaults to `"Please fill out this field."`.
  * `show_password_visibility_toggle` (`:boolean`) - Boolean property to render password visibility toggle. Defaults to `false`.
  * `show_password_label` (`:string`) - "Show password" tooltip text on password visibility toggle. Defaults to `"Show password"`.
  * `size` (`:any`) - The input box size. Defaults to `nil`.
  * `tooltip_alignment` (`:string`) - Specify the alignment of the tooltip to the icon-only button.
    Can be one of: start, center, or end.

    Defaults to `"center"`. Must be one of `"start"`, `"center"`, or `"end"`.
  * `tooltip_direction` (`:string`) - Specify the direction of the tooltip for icon-only buttons.
    Can be either top, right, bottom, or left.

    Defaults to `"bottom"`. Must be one of `"top"`, `"right"`, `"bottom"`, or `"left"`.
  * `type` (`:string`) - The type of the input. Can be one of the types listed in the INPUT_TYPE enum. Defaults to `"text"`. Must be one of `"email"`, `"password"`, `"tel"`, `"text"`, or `"url"`.
  * `value` (`:string`) - The value of the input. Defaults to `nil`.
  * `warn` (`:boolean`) - Specify whether the control is currently in warning state. Defaults to `false`.
  * `warn_text` (`:string`) - Provide the text that is displayed when the control is in warning state. Defaults to `nil`.
  * Global attributes are accepted.
  ## Slots

  * `helper_text` - The helper text. Accepts attributes:

    * `tag` (`:string`)
  * `label_text` - The label text. Accepts attributes:

    * `tag` (`:string`)
  * `validity_message` - The validity message. If present and non-empty, this input shows the UI of its invalid state. Accepts attributes:

    * `tag` (`:string`)
  * `inner_block`


  Form-aware wrapper.
  """
  attr :field, Phoenix.HTML.FormField, doc: "a form field struct, for example: @form[:email]"

  attr :form, :string,
    default: nil,
    doc: "the form attribute for the hidden input"

  attr :form_event, :string,
    default: nil,
    doc: "override the custom event used to sync form values"

  attr :autocomplete, :string, doc: "May be any of the standard HTML autocomplete options"

  attr :autofocus, :boolean,
    doc: "Sets the input to be focussed automatically on page load. Defaults to false"

  attr :disabled, :boolean, doc: "Controls the disabled state of the input"
  attr :enable_counter, :boolean, doc: "Specify whether to display the character counter"

  attr :hide_label, :boolean,
    doc: "Specify whether you want the underlying label to be visually hidden"

  attr :hide_password_label, :string,
    doc: "\"Hide password\" tooltip text on password visibility toggle",
    default: "Hide password"

  attr :inline, :boolean, doc: "true to use the inline version."
  attr :invalid, :boolean, doc: "Specify if the currently value is invalid."
  attr :invalid_text, :string, doc: "Message which is displayed if the value is invalid."
  attr :is_fluid, :boolean

  attr :label, :string,
    doc: "Generic label that will be used as the textual representation of what this field is for"

  attr :max_count, :any,
    doc:
      "Max character count allowed for input. This is needed in order for enableCounter to display"

  attr :name, :string, doc: "Name for the input in the `FormData`"
  attr :pattern, :string, doc: "Pattern to validate the input against for HTML validity checking"
  attr :placeholder, :string, doc: "Value to display when the input has an empty `value`"
  attr :readonly, :boolean, doc: "Specify if the component should be read-only"
  attr :required, :boolean, doc: "Boolean property to set the required status"

  attr :required_validity_message, :string,
    doc: "The special validity message for `required`.",
    default: "Please fill out this field."

  attr :rest, :global

  attr :show_password_label, :string,
    doc: "\"Show password\" tooltip text on password visibility toggle",
    default: "Show password"

  attr :show_password_visibility_toggle, :boolean,
    doc: "Boolean property to render password visibility toggle"

  attr :size, :any, doc: "The input box size."

  attr :tooltip_alignment, :string,
    doc:
      "Specify the alignment of the tooltip to the icon-only button.\nCan be one of: start, center, or end.",
    values: ["start", "center", "end"],
    default: "center"

  attr :tooltip_direction, :string,
    doc:
      "Specify the direction of the tooltip for icon-only buttons.\nCan be either top, right, bottom, or left.",
    values: ["top", "right", "bottom", "left"],
    default: "bottom"

  attr :type, :string,
    doc: "The type of the input. Can be one of the types listed in the INPUT_TYPE enum",
    values: ["email", "password", "tel", "text", "url"],
    default: "text"

  attr :value, :string, doc: "The value of the input."
  attr :warn, :boolean, doc: "Specify whether the control is currently in warning state"

  attr :warn_text, :string,
    doc: "Provide the text that is displayed when the control is in warning state"

  slot :helper_text, doc: "The helper text." do
    attr :tag, :string
  end

  slot :inner_block

  slot :label_text, doc: "The label text." do
    attr :tag, :string
  end

  slot :validity_message,
    doc:
      "The validity message. If present and non-empty, this input shows the UI of its invalid state." do
    attr :tag, :string
  end

  def fluid_text_input(assigns) do
    assigns = form_input_assigns(assigns, name: :fluid_text_input, mode: :value, event: "input")
    component_assigns = Map.drop(assigns, [:input_id, :input_value, :component_assigns, :id])
    assigns = assign(assigns, :component_assigns, component_assigns)

    ~H"""
    <input type="hidden" id={@input_id} name={@name} value={@input_value} form={@form} />
    {CoreComponents.fluid_text_input(@component_assigns)}
    <.form_bridge_hook />
    """
  end

  @doc """
  Component `<cds-password-input>` from `./src/components/password-input/password-input.ts`

  Password Input element. Supports all the usual attributes for textual input types

  ## Events

  * `invalid` - Undocumented


  ## Attributes

  * `autocomplete` (`:string`) - May be any of the standard HTML autocomplete options. Defaults to `nil`.
  * `autofocus` (`:boolean`) - Sets the input to be focussed automatically on page load. Defaults to false. Defaults to `false`.
  * `disabled` (`:boolean`) - Controls the disabled state of the input. Defaults to `false`.
  * `enable_counter` (`:boolean`) - Specify whether to display the character counter. Defaults to `false`.
  * `hide_label` (`:boolean`) - Specify whether you want the underlying label to be visually hidden. Defaults to `false`.
  * `hide_password_label` (`:string`) - "Hide password" tooltip text on password visibility toggle. Defaults to `"Hide password"`.
  * `inline` (`:boolean`) - true to use the inline version. Defaults to `false`.
  * `invalid` (`:boolean`) - Specify if the currently value is invalid. Defaults to `false`.
  * `invalid_text` (`:string`) - Message which is displayed if the value is invalid. Defaults to `nil`.
  * `is_fluid` (`:boolean`) - Defaults to `false`.
  * `label` (`:string`) - Generic label that will be used as the textual representation of what this field is for. Defaults to `nil`.
  * `max_count` (`:any`) - Max character count allowed for input. This is needed in order for enableCounter to display. Defaults to `nil`.
  * `name` (`:string`) - Name for the input in the `FormData`. Defaults to `nil`.
  * `pattern` (`:string`) - Pattern to validate the input against for HTML validity checking. Defaults to `nil`.
  * `placeholder` (`:string`) - Value to display when the input has an empty `value`. Defaults to `nil`.
  * `readonly` (`:boolean`) - Specify if the component should be read-only. Defaults to `false`.
  * `required` (`:boolean`) - Boolean property to set the required status. Defaults to `false`.
  * `required_validity_message` (`:string`) - The special validity message for `required`. Defaults to `"Please fill out this field."`.
  * `show_password_label` (`:string`) - "Show password" tooltip text on password visibility toggle. Defaults to `"Show password"`.
  * `show_password_visibility_toggle` (`:boolean`) - Boolean property to render password visibility toggle. Defaults to `false`.
  * `size` (`:any`) - The input box size. Defaults to `nil`.
  * `tooltip_alignment` (`:string`) - Specify the alignment of the tooltip to the icon-only button.
    Can be one of: start, center, or end.

    Defaults to `"center"`. Must be one of `"start"`, `"center"`, or `"end"`.
  * `tooltip_position` (`:string`) - Specify the direction of the tooltip for icon-only buttons.
    Can be either top, right, bottom, or left.

    Defaults to `"bottom"`. Must be one of `"top"`, `"right"`, `"bottom"`, or `"left"`.
  * `type` (`:string`) - The native `<input>` type. Defaults to “password”. Defaults to `"password"`. Must be one of `"email"`, `"password"`, `"tel"`, `"text"`, or `"url"`.
  * `value` (`:string`) - The value of the input. Defaults to `nil`.
  * `warn` (`:boolean`) - Specify whether the control is currently in warning state. Defaults to `false`.
  * `warn_text` (`:string`) - Provide the text that is displayed when the control is in warning state. Defaults to `nil`.
  * Global attributes are accepted.
  ## Slots

  * `helper_text` - The helper text. Accepts attributes:

    * `tag` (`:string`)
  * `label_text` - The label text. Accepts attributes:

    * `tag` (`:string`)
  * `validity_message` - The validity message. If present and non-empty, this input shows the UI of its invalid state. Accepts attributes:

    * `tag` (`:string`)
  * `inner_block`


  Form-aware wrapper.
  """
  attr :field, Phoenix.HTML.FormField, doc: "a form field struct, for example: @form[:email]"

  attr :form, :string,
    default: nil,
    doc: "the form attribute for the hidden input"

  attr :form_event, :string,
    default: nil,
    doc: "override the custom event used to sync form values"

  attr :autocomplete, :string, doc: "May be any of the standard HTML autocomplete options"

  attr :autofocus, :boolean,
    doc: "Sets the input to be focussed automatically on page load. Defaults to false"

  attr :disabled, :boolean, doc: "Controls the disabled state of the input"
  attr :enable_counter, :boolean, doc: "Specify whether to display the character counter"

  attr :hide_label, :boolean,
    doc: "Specify whether you want the underlying label to be visually hidden"

  attr :hide_password_label, :string,
    doc: "\"Hide password\" tooltip text on password visibility toggle",
    default: "Hide password"

  attr :inline, :boolean, doc: "true to use the inline version."
  attr :invalid, :boolean, doc: "Specify if the currently value is invalid."
  attr :invalid_text, :string, doc: "Message which is displayed if the value is invalid."
  attr :is_fluid, :boolean

  attr :label, :string,
    doc: "Generic label that will be used as the textual representation of what this field is for"

  attr :max_count, :any,
    doc:
      "Max character count allowed for input. This is needed in order for enableCounter to display"

  attr :name, :string, doc: "Name for the input in the `FormData`"
  attr :pattern, :string, doc: "Pattern to validate the input against for HTML validity checking"
  attr :placeholder, :string, doc: "Value to display when the input has an empty `value`"
  attr :readonly, :boolean, doc: "Specify if the component should be read-only"
  attr :required, :boolean, doc: "Boolean property to set the required status"

  attr :required_validity_message, :string,
    doc: "The special validity message for `required`.",
    default: "Please fill out this field."

  attr :rest, :global

  attr :show_password_label, :string,
    doc: "\"Show password\" tooltip text on password visibility toggle",
    default: "Show password"

  attr :show_password_visibility_toggle, :boolean,
    doc: "Boolean property to render password visibility toggle"

  attr :size, :any, doc: "The input box size."

  attr :tooltip_alignment, :string,
    doc:
      "Specify the alignment of the tooltip to the icon-only button.\nCan be one of: start, center, or end.",
    values: ["start", "center", "end"],
    default: "center"

  attr :tooltip_position, :string,
    doc:
      "Specify the direction of the tooltip for icon-only buttons.\nCan be either top, right, bottom, or left.",
    values: ["top", "right", "bottom", "left"],
    default: "bottom"

  attr :type, :string,
    doc: "The native `<input>` type. Defaults to “password”.",
    values: ["email", "password", "tel", "text", "url"],
    default: "password"

  attr :value, :string, doc: "The value of the input."
  attr :warn, :boolean, doc: "Specify whether the control is currently in warning state"

  attr :warn_text, :string,
    doc: "Provide the text that is displayed when the control is in warning state"

  slot :helper_text, doc: "The helper text." do
    attr :tag, :string
  end

  slot :inner_block

  slot :label_text, doc: "The label text." do
    attr :tag, :string
  end

  slot :validity_message,
    doc:
      "The validity message. If present and non-empty, this input shows the UI of its invalid state." do
    attr :tag, :string
  end

  def password_input(assigns) do
    assigns = form_input_assigns(assigns, name: :password_input, mode: :value, event: "input")
    component_assigns = Map.drop(assigns, [:input_id, :input_value, :component_assigns, :id])
    assigns = assign(assigns, :component_assigns, component_assigns)

    ~H"""
    <input type="hidden" id={@input_id} name={@name} value={@input_value} form={@form} />
    {CoreComponents.password_input(@component_assigns)}
    <.form_bridge_hook />
    """
  end

  @doc """
  Component `<cds-textarea>` from `./src/components/textarea/textarea.ts`

  Text area.

  ## Events

  * `input` - Undocumented
  * `invalid` - Undocumented


  ## Attributes

  * `autocomplete` (`:string`) - May be any of the standard HTML autocomplete options. Defaults to `nil`.
  * `autofocus` (`:boolean`) - Sets the input to be focussed automatically on page load. Defaults to false. Defaults to `false`.
  * `cols` (`:any`) - The number of columns for the textarea to show by default. Defaults to `nil`.
  * `counter_mode` (`:any`) - Specify the method used for calculating the counter number. Defaults to `nil`.
  * `disabled` (`:boolean`) - Controls the disabled state of the input. Defaults to `false`.
  * `enable_counter` (`:boolean`) - Specify whether to display the character counter. Defaults to `false`.
  * `hide_label` (`:boolean`) - Specify whether you want the underlying label to be visually hidden. Defaults to `false`.
  * `hide_password_label` (`:string`) - "Hide password" tooltip text on password visibility toggle. Defaults to `"Hide password"`.
  * `id` (`:string`) - ID to link the `label` and `textarea`. Defaults to `nil`.
  * `inline` (`:boolean`) - true to use the inline version. Defaults to `false`.
  * `invalid` (`:boolean`) - Specify if the currently value is invalid. Defaults to `false`.
  * `invalid_text` (`:string`) - Message which is displayed if the value is invalid. Defaults to `nil`.
  * `is_fluid` (`:boolean`) - Specify whether the textarea is fluid or not. Defaults to `false`.
  * `label` (`:string`) - Generic label that will be used as the textual representation of what this field is for. Defaults to `nil`.
  * `max_count` (`:any`) - Max character count allowed for input. This is needed in order for enableCounter to display. Defaults to `nil`.
  * `name` (`:string`) - Name for the input in the `FormData`. Defaults to `nil`.
  * `pattern` (`:string`) - Pattern to validate the textarea against for HTML validity checking. Defaults to `nil`.
  * `placeholder` (`:string`) - Value to display when the input has an empty `value`. Defaults to `nil`.
  * `readonly` (`:boolean`) - Specify if the component should be read-only. Defaults to `false`.
  * `required` (`:boolean`) - Boolean property to set the required status. Defaults to `false`.
  * `required_validity_message` (`:string`) - The special validity message for `required`. Defaults to `"Please fill out this field."`.
  * `rows` (`:string`) - The number of rows for the textarea to show by default. Defaults to `"4"`.
  * `show_password_visibility_toggle` (`:boolean`) - Boolean property to render password visibility toggle. Defaults to `false`.
  * `show_password_label` (`:string`) - "Show password" tooltip text on password visibility toggle. Defaults to `"Show password"`.
  * `size` (`:any`) - The input box size. Defaults to `nil`.
  * `tooltip_alignment` (`:string`) - Specify the alignment of the tooltip to the icon-only button.
    Can be one of: start, center, or end.

    Defaults to `"center"`. Must be one of `"start"`, `"center"`, or `"end"`.
  * `tooltip_direction` (`:string`) - Specify the direction of the tooltip for icon-only buttons.
    Can be either top, right, bottom, or left.

    Defaults to `"bottom"`. Must be one of `"top"`, `"right"`, `"bottom"`, or `"left"`.
  * `type` (`:string`) - The type of the input. Can be one of the types listed in the INPUT_TYPE enum. Defaults to `"text"`. Must be one of `"email"`, `"password"`, `"tel"`, `"text"`, or `"url"`.
  * `value` (`:string`) - The value of the input. Defaults to `nil`.
  * `warn` (`:boolean`) - Specify whether the control is currently in warning state. Defaults to `false`.
  * `warn_text` (`:string`) - Provide the text that is displayed when the control is in warning state. Defaults to `nil`.
  * Global attributes are accepted.
  ## Slots

  * `helper_text` - The helper text. Accepts attributes:

    * `tag` (`:string`)
  * `label_text` - The label text. Accepts attributes:

    * `tag` (`:string`)
  * `validity_message` - The validity message. If present and non-empty, this input shows the UI of its invalid state. Accepts attributes:

    * `tag` (`:string`)
  * `inner_block`


  Form-aware wrapper.
  """
  attr :field, Phoenix.HTML.FormField, doc: "a form field struct, for example: @form[:email]"

  attr :form, :string,
    default: nil,
    doc: "the form attribute for the hidden input"

  attr :form_event, :string,
    default: nil,
    doc: "override the custom event used to sync form values"

  attr :autocomplete, :string, doc: "May be any of the standard HTML autocomplete options"

  attr :autofocus, :boolean,
    doc: "Sets the input to be focussed automatically on page load. Defaults to false"

  attr :cols, :any, doc: "The number of columns for the textarea to show by default"
  attr :counter_mode, :any, doc: "Specify the method used for calculating the counter number"
  attr :disabled, :boolean, doc: "Controls the disabled state of the input"
  attr :enable_counter, :boolean, doc: "Specify whether to display the character counter"

  attr :hide_label, :boolean,
    doc: "Specify whether you want the underlying label to be visually hidden"

  attr :hide_password_label, :string,
    doc: "\"Hide password\" tooltip text on password visibility toggle",
    default: "Hide password"

  attr :id, :string, doc: "ID to link the `label` and `textarea`"
  attr :inline, :boolean, doc: "true to use the inline version."
  attr :invalid, :boolean, doc: "Specify if the currently value is invalid."
  attr :invalid_text, :string, doc: "Message which is displayed if the value is invalid."
  attr :is_fluid, :boolean, doc: "Specify whether the textarea is fluid or not"

  attr :label, :string,
    doc: "Generic label that will be used as the textual representation of what this field is for"

  attr :max_count, :any,
    doc:
      "Max character count allowed for input. This is needed in order for enableCounter to display"

  attr :name, :string, doc: "Name for the input in the `FormData`"

  attr :pattern, :string,
    doc: "Pattern to validate the textarea against for HTML validity checking"

  attr :placeholder, :string, doc: "Value to display when the input has an empty `value`"
  attr :readonly, :boolean, doc: "Specify if the component should be read-only"
  attr :required, :boolean, doc: "Boolean property to set the required status"

  attr :required_validity_message, :string,
    doc: "The special validity message for `required`.",
    default: "Please fill out this field."

  attr :rest, :global
  attr :rows, :string, doc: "The number of rows for the textarea to show by default", default: "4"

  attr :show_password_label, :string,
    doc: "\"Show password\" tooltip text on password visibility toggle",
    default: "Show password"

  attr :show_password_visibility_toggle, :boolean,
    doc: "Boolean property to render password visibility toggle"

  attr :size, :any, doc: "The input box size."

  attr :tooltip_alignment, :string,
    doc:
      "Specify the alignment of the tooltip to the icon-only button.\nCan be one of: start, center, or end.",
    values: ["start", "center", "end"],
    default: "center"

  attr :tooltip_direction, :string,
    doc:
      "Specify the direction of the tooltip for icon-only buttons.\nCan be either top, right, bottom, or left.",
    values: ["top", "right", "bottom", "left"],
    default: "bottom"

  attr :type, :string,
    doc: "The type of the input. Can be one of the types listed in the INPUT_TYPE enum",
    values: ["email", "password", "tel", "text", "url"],
    default: "text"

  attr :value, :string, doc: "The value of the input."
  attr :warn, :boolean, doc: "Specify whether the control is currently in warning state"

  attr :warn_text, :string,
    doc: "Provide the text that is displayed when the control is in warning state"

  slot :helper_text, doc: "The helper text." do
    attr :tag, :string
  end

  slot :inner_block

  slot :label_text, doc: "The label text." do
    attr :tag, :string
  end

  slot :validity_message,
    doc:
      "The validity message. If present and non-empty, this input shows the UI of its invalid state." do
    attr :tag, :string
  end

  def textarea(assigns) do
    assigns = form_input_assigns(assigns, name: :textarea, mode: :value, event: "input")
    component_assigns = Map.drop(assigns, [:input_id, :input_value, :component_assigns, :id])
    assigns = assign(assigns, :component_assigns, component_assigns)

    ~H"""
    <input type="hidden" id={@input_id} name={@name} value={@input_value} form={@form} />
    {CoreComponents.textarea(@component_assigns)}
    <.form_bridge_hook />
    """
  end

  @doc """
  Component `<cds-fluid-textarea>` from `./src/components/fluid-textarea/fluid-textarea.ts`

  Fluid text area input.

  ## Events

  * `input` - Undocumented
  * `invalid` - Undocumented


  ## Attributes

  * `autocomplete` (`:string`) - May be any of the standard HTML autocomplete options. Defaults to `nil`.
  * `autofocus` (`:boolean`) - Sets the input to be focussed automatically on page load. Defaults to false. Defaults to `false`.
  * `cols` (`:any`) - The number of columns for the textarea to show by default. Defaults to `nil`.
  * `counter_mode` (`:any`) - Specify the method used for calculating the counter number. Defaults to `nil`.
  * `disabled` (`:boolean`) - Controls the disabled state of the input. Defaults to `false`.
  * `enable_counter` (`:boolean`) - Specify whether to display the character counter. Defaults to `false`.
  * `hide_label` (`:boolean`) - Specify whether you want the underlying label to be visually hidden. Defaults to `false`.
  * `hide_password_label` (`:string`) - "Hide password" tooltip text on password visibility toggle. Defaults to `"Hide password"`.
  * `id` (`:string`) - ID to link the `label` and `textarea`. Defaults to `nil`.
  * `inline` (`:boolean`) - true to use the inline version. Defaults to `false`.
  * `invalid` (`:boolean`) - Specify if the currently value is invalid. Defaults to `false`.
  * `invalid_text` (`:string`) - Message which is displayed if the value is invalid. Defaults to `nil`.
  * `is_fluid` (`:boolean`) - Specify whether the textarea is fluid or not. Defaults to `false`.
  * `label` (`:string`) - Generic label that will be used as the textual representation of what this field is for. Defaults to `nil`.
  * `max_count` (`:any`) - Max character count allowed for input. This is needed in order for enableCounter to display. Defaults to `nil`.
  * `name` (`:string`) - Name for the input in the `FormData`. Defaults to `nil`.
  * `pattern` (`:string`) - Pattern to validate the textarea against for HTML validity checking. Defaults to `nil`.
  * `placeholder` (`:string`) - Value to display when the input has an empty `value`. Defaults to `nil`.
  * `readonly` (`:boolean`) - Specify if the component should be read-only. Defaults to `false`.
  * `required` (`:boolean`) - Boolean property to set the required status. Defaults to `false`.
  * `required_validity_message` (`:string`) - The special validity message for `required`. Defaults to `"Please fill out this field."`.
  * `rows` (`:string`) - The number of rows for the textarea to show by default. Defaults to `"4"`.
  * `show_password_visibility_toggle` (`:boolean`) - Boolean property to render password visibility toggle. Defaults to `false`.
  * `show_password_label` (`:string`) - "Show password" tooltip text on password visibility toggle. Defaults to `"Show password"`.
  * `size` (`:any`) - The input box size. Defaults to `nil`.
  * `tooltip_alignment` (`:string`) - Specify the alignment of the tooltip to the icon-only button.
    Can be one of: start, center, or end.

    Defaults to `"center"`. Must be one of `"start"`, `"center"`, or `"end"`.
  * `tooltip_direction` (`:string`) - Specify the direction of the tooltip for icon-only buttons.
    Can be either top, right, bottom, or left.

    Defaults to `"bottom"`. Must be one of `"top"`, `"right"`, `"bottom"`, or `"left"`.
  * `type` (`:string`) - The type of the input. Can be one of the types listed in the INPUT_TYPE enum. Defaults to `"text"`. Must be one of `"email"`, `"password"`, `"tel"`, `"text"`, or `"url"`.
  * `value` (`:string`) - The value of the input. Defaults to `nil`.
  * `warn` (`:boolean`) - Specify whether the control is currently in warning state. Defaults to `false`.
  * `warn_text` (`:string`) - Provide the text that is displayed when the control is in warning state. Defaults to `nil`.
  * Global attributes are accepted.
  ## Slots

  * `helper_text` - The helper text. Accepts attributes:

    * `tag` (`:string`)
  * `label_text` - The label text. Accepts attributes:

    * `tag` (`:string`)
  * `validity_message` - The validity message. If present and non-empty, this input shows the UI of its invalid state. Accepts attributes:

    * `tag` (`:string`)
  * `inner_block`


  Form-aware wrapper.
  """
  attr :field, Phoenix.HTML.FormField, doc: "a form field struct, for example: @form[:email]"

  attr :form, :string,
    default: nil,
    doc: "the form attribute for the hidden input"

  attr :form_event, :string,
    default: nil,
    doc: "override the custom event used to sync form values"

  attr :autocomplete, :string, doc: "May be any of the standard HTML autocomplete options"

  attr :autofocus, :boolean,
    doc: "Sets the input to be focussed automatically on page load. Defaults to false"

  attr :cols, :any, doc: "The number of columns for the textarea to show by default"
  attr :counter_mode, :any, doc: "Specify the method used for calculating the counter number"
  attr :disabled, :boolean, doc: "Controls the disabled state of the input"
  attr :enable_counter, :boolean, doc: "Specify whether to display the character counter"

  attr :hide_label, :boolean,
    doc: "Specify whether you want the underlying label to be visually hidden"

  attr :hide_password_label, :string,
    doc: "\"Hide password\" tooltip text on password visibility toggle",
    default: "Hide password"

  attr :id, :string, doc: "ID to link the `label` and `textarea`"
  attr :inline, :boolean, doc: "true to use the inline version."
  attr :invalid, :boolean, doc: "Specify if the currently value is invalid."
  attr :invalid_text, :string, doc: "Message which is displayed if the value is invalid."
  attr :is_fluid, :boolean, doc: "Specify whether the textarea is fluid or not"

  attr :label, :string,
    doc: "Generic label that will be used as the textual representation of what this field is for"

  attr :max_count, :any,
    doc:
      "Max character count allowed for input. This is needed in order for enableCounter to display"

  attr :name, :string, doc: "Name for the input in the `FormData`"

  attr :pattern, :string,
    doc: "Pattern to validate the textarea against for HTML validity checking"

  attr :placeholder, :string, doc: "Value to display when the input has an empty `value`"
  attr :readonly, :boolean, doc: "Specify if the component should be read-only"
  attr :required, :boolean, doc: "Boolean property to set the required status"

  attr :required_validity_message, :string,
    doc: "The special validity message for `required`.",
    default: "Please fill out this field."

  attr :rest, :global
  attr :rows, :string, doc: "The number of rows for the textarea to show by default", default: "4"

  attr :show_password_label, :string,
    doc: "\"Show password\" tooltip text on password visibility toggle",
    default: "Show password"

  attr :show_password_visibility_toggle, :boolean,
    doc: "Boolean property to render password visibility toggle"

  attr :size, :any, doc: "The input box size."

  attr :tooltip_alignment, :string,
    doc:
      "Specify the alignment of the tooltip to the icon-only button.\nCan be one of: start, center, or end.",
    values: ["start", "center", "end"],
    default: "center"

  attr :tooltip_direction, :string,
    doc:
      "Specify the direction of the tooltip for icon-only buttons.\nCan be either top, right, bottom, or left.",
    values: ["top", "right", "bottom", "left"],
    default: "bottom"

  attr :type, :string,
    doc: "The type of the input. Can be one of the types listed in the INPUT_TYPE enum",
    values: ["email", "password", "tel", "text", "url"],
    default: "text"

  attr :value, :string, doc: "The value of the input."
  attr :warn, :boolean, doc: "Specify whether the control is currently in warning state"

  attr :warn_text, :string,
    doc: "Provide the text that is displayed when the control is in warning state"

  slot :helper_text, doc: "The helper text." do
    attr :tag, :string
  end

  slot :inner_block

  slot :label_text, doc: "The label text." do
    attr :tag, :string
  end

  slot :validity_message,
    doc:
      "The validity message. If present and non-empty, this input shows the UI of its invalid state." do
    attr :tag, :string
  end

  def fluid_textarea(assigns) do
    assigns = form_input_assigns(assigns, name: :fluid_textarea, mode: :value, event: "input")
    component_assigns = Map.drop(assigns, [:input_id, :input_value, :component_assigns, :id])
    assigns = assign(assigns, :component_assigns, component_assigns)

    ~H"""
    <input type="hidden" id={@input_id} name={@name} value={@input_value} form={@form} />
    {CoreComponents.fluid_textarea(@component_assigns)}
    <.form_bridge_hook />
    """
  end

  @doc """
  Component `<cds-search>` from `./src/components/search/search.ts`

  Search box.

  ## Events

  * `cds-search-input` - The custom event fired after the search content is changed upon a user gesture.


  ## Attributes

  * `autocomplete` (`:string`) - Specify an optional value for the autocomplete property on the underlying <input>,
    defaults to "off"

    Defaults to `"off"`.
  * `close_button_label_text` (`:string`) - Specify a label to be read by screen readers on the "close" button. Defaults to `nil`.
  * `disabled` (`:boolean`) - `true` if the search box should be disabled. Defaults to `false`.
  * `expandable` (`:boolean`) - `true` if the search bar can be expandable. Defaults to `false`.
  * `expanded` (`:boolean`) - `true` if the expandable search has been expanded. Defaults to `false`.
  * `has_custom_icon` (`:boolean`) - Defaults to `false`.
  * `label_text` (`:string`) - The label text. Defaults to `nil`.
  * `name` (`:string`) - The form name in `FormData`. Defaults to `nil`.
  * `placeholder` (`:string`) - The placeholder text. Defaults to `"Search"`.
  * `role` (`:string`) - Specify the role for the underlying <input>, defaults to searchbox. Defaults to `nil`.
  * `size` (`:any`) - The search box size. Defaults to `nil`.
  * `type` (`:string`) - The `<input>` name. Defaults to `nil`.
  * `value` (`:string`) - The value. Defaults to `nil`.
  * Global attributes are accepted.
  ## Slots

  * `inner_block`


  Form-aware wrapper.
  """
  attr :field, Phoenix.HTML.FormField, doc: "a form field struct, for example: @form[:email]"

  attr :form, :string,
    default: nil,
    doc: "the form attribute for the hidden input"

  attr :form_event, :string,
    default: nil,
    doc: "override the custom event used to sync form values"

  attr :autocomplete, :string,
    doc:
      "Specify an optional value for the autocomplete property on the underlying <input>,\ndefaults to \"off\"",
    default: "off"

  attr :close_button_label_text, :string,
    doc: "Specify a label to be read by screen readers on the \"close\" button"

  attr :disabled, :boolean, doc: "`true` if the search box should be disabled."
  attr :expandable, :boolean, doc: "`true` if the search bar can be expandable"
  attr :expanded, :boolean, doc: "`true` if the expandable search has been expanded"
  attr :has_custom_icon, :boolean
  attr :label_text, :string, doc: "The label text."
  attr :name, :string, doc: "The form name in `FormData`."
  attr :placeholder, :string, doc: "The placeholder text.", default: "Search"
  attr :rest, :global
  attr :role, :string, doc: "Specify the role for the underlying <input>, defaults to searchbox"
  attr :size, :any, doc: "The search box size."
  attr :type, :string, doc: "The `<input>` name."
  attr :value, :string, doc: "The value."
  slot :inner_block

  def search(assigns) do
    assigns = form_input_assigns(assigns, name: :search, mode: :value, event: "cds-search-input")
    component_assigns = Map.drop(assigns, [:input_id, :input_value, :component_assigns, :id])
    assigns = assign(assigns, :component_assigns, component_assigns)

    ~H"""
    <input type="hidden" id={@input_id} name={@name} value={@input_value} form={@form} />
    {CoreComponents.search(@component_assigns)}
    <.form_bridge_hook />
    """
  end

  @doc """
  Component `<cds-fluid-search>` from `./src/components/fluid-search/fluid-search.ts`

  Fluid text input.

  ## Events

  * `cds-search-input` - The custom event fired after the search content is changed upon a user gesture.


  ## Attributes

  * `autocomplete` (`:string`) - Specify an optional value for the autocomplete property on the underlying <input>,
    defaults to "off"

    Defaults to `"off"`.
  * `close_button_label_text` (`:string`) - Specify a label to be read by screen readers on the "close" button. Defaults to `nil`.
  * `disabled` (`:boolean`) - `true` if the search box should be disabled. Defaults to `false`.
  * `expandable` (`:boolean`) - `true` if the search bar can be expandable. Defaults to `false`.
  * `expanded` (`:boolean`) - `true` if the expandable search has been expanded. Defaults to `false`.
  * `has_custom_icon` (`:boolean`) - Defaults to `false`.
  * `label_text` (`:string`) - The label text. Defaults to `nil`.
  * `name` (`:string`) - The form name in `FormData`. Defaults to `nil`.
  * `placeholder` (`:string`) - The placeholder text. Defaults to `"Search"`.
  * `role` (`:string`) - Specify the role for the underlying <input>, defaults to searchbox. Defaults to `nil`.
  * `size` (`:any`) - The search box size. Defaults to `nil`.
  * `type` (`:string`) - The `<input>` name. Defaults to `nil`.
  * `value` (`:string`) - The value. Defaults to `nil`.
  * Global attributes are accepted.
  ## Slots

  * `inner_block`


  Form-aware wrapper.
  """
  attr :field, Phoenix.HTML.FormField, doc: "a form field struct, for example: @form[:email]"

  attr :form, :string,
    default: nil,
    doc: "the form attribute for the hidden input"

  attr :form_event, :string,
    default: nil,
    doc: "override the custom event used to sync form values"

  attr :autocomplete, :string,
    doc:
      "Specify an optional value for the autocomplete property on the underlying <input>,\ndefaults to \"off\"",
    default: "off"

  attr :close_button_label_text, :string,
    doc: "Specify a label to be read by screen readers on the \"close\" button"

  attr :disabled, :boolean, doc: "`true` if the search box should be disabled."
  attr :expandable, :boolean, doc: "`true` if the search bar can be expandable"
  attr :expanded, :boolean, doc: "`true` if the expandable search has been expanded"
  attr :has_custom_icon, :boolean
  attr :label_text, :string, doc: "The label text."
  attr :name, :string, doc: "The form name in `FormData`."
  attr :placeholder, :string, doc: "The placeholder text.", default: "Search"
  attr :rest, :global
  attr :role, :string, doc: "Specify the role for the underlying <input>, defaults to searchbox"
  attr :size, :any, doc: "The search box size."
  attr :type, :string, doc: "The `<input>` name."
  attr :value, :string, doc: "The value."
  slot :inner_block

  def fluid_search(assigns) do
    assigns =
      form_input_assigns(assigns, name: :fluid_search, mode: :value, event: "cds-search-input")

    component_assigns = Map.drop(assigns, [:input_id, :input_value, :component_assigns, :id])
    assigns = assign(assigns, :component_assigns, component_assigns)

    ~H"""
    <input type="hidden" id={@input_id} name={@name} value={@input_value} form={@form} />
    {CoreComponents.fluid_search(@component_assigns)}
    <.form_bridge_hook />
    """
  end

  @doc """
  Component `<cds-select>` from `./src/components/select/select.ts`

  Select box.

  ## Events

  * `cds-select-selected` - The name of the custom event fired after an item is selected.


  ## Attributes

  * `autofocus` (`:boolean`) - Sets the select to be focussed automatically on page load. Defaults to false. Defaults to `false`.
  * `disabled` (`:boolean`) - Controls the disabled state of the select. Defaults to `false`.
  * `hide_label` (`:boolean`) - Specify whether the label should be hidden, or not. Defaults to `false`.
  * `id` (`:string`) - ID to link the `label` and `select`. Defaults to `nil`.
  * `inline` (`:boolean`) - Specify whether you want the inline version of this control. Defaults to `false`.
  * `invalid` (`:boolean`) - Specify if the currently value is invalid. Defaults to `false`.
  * `invalid_text` (`:string`) - Message which is displayed if the value is invalid. Defaults to `nil`.
  * `is_fluid` (`:boolean`) - Specify whether the textarea is fluid or not. Defaults to `false`.
  * `multiple` (`:boolean`) - `true` to enable multiple selection. Defaults to `nil`.
  * `name` (`:string`) - Name for the select in the `FormData`. Defaults to `nil`.
  * `pattern` (`:string`) - Pattern to validate the select against for HTML validity checking. Defaults to `nil`.
  * `placeholder` (`:string`) - Value to display when the select has an empty `value`. Defaults to `nil`.
  * `readonly` (`:boolean`) - Controls the readonly state of the select. Defaults to `false`.
  * `required` (`:boolean`) - Boolean property to set the required status. Defaults to `false`.
  * `required_validity_message` (`:string`) - The special validity message for `required`. Defaults to `"Please fill out this field."`.
  * `selected_index` (`:string`) - The selected index. Defaults to `nil`.
  * `size` (`:any`) - The input box size. Defaults to `nil`.
  * `value` (`:string`) - The value of the text area. Defaults to `nil`.
  * `warn` (`:boolean`) - Specify if the currently value is warn. Defaults to `false`.
  * `warn_text` (`:string`) - Message which is displayed if the value is warn. Defaults to `nil`.
  * Global attributes are accepted.
  ## Slots

  * `helper_text` - The helper text. Accepts attributes:

    * `tag` (`:string`)
  * `label_text` - The label text. Accepts attributes:

    * `tag` (`:string`)
  * `validity_message` - The validity message. If present and non-empty, this input shows the UI of its invalid state. Accepts attributes:

    * `tag` (`:string`)
  * `inner_block`


  Form-aware wrapper.
  """
  attr :field, Phoenix.HTML.FormField, doc: "a form field struct, for example: @form[:email]"

  attr :form, :string,
    default: nil,
    doc: "the form attribute for the hidden input"

  attr :form_event, :string,
    default: nil,
    doc: "override the custom event used to sync form values"

  attr :autofocus, :boolean,
    doc: "Sets the select to be focussed automatically on page load. Defaults to false"

  attr :disabled, :boolean, doc: "Controls the disabled state of the select"
  attr :hide_label, :boolean, doc: "Specify whether the label should be hidden, or not"
  attr :id, :string, doc: "ID to link the `label` and `select`"
  attr :inline, :boolean, doc: "Specify whether you want the inline version of this control"
  attr :invalid, :boolean, doc: "Specify if the currently value is invalid."
  attr :invalid_text, :string, doc: "Message which is displayed if the value is invalid."
  attr :is_fluid, :boolean, doc: "Specify whether the textarea is fluid or not"
  attr :multiple, :boolean, doc: "`true` to enable multiple selection."
  attr :name, :string, doc: "Name for the select in the `FormData`"
  attr :pattern, :string, doc: "Pattern to validate the select against for HTML validity checking"
  attr :placeholder, :string, doc: "Value to display when the select has an empty `value`"
  attr :readonly, :boolean, doc: "Controls the readonly state of the select"
  attr :required, :boolean, doc: "Boolean property to set the required status"

  attr :required_validity_message, :string,
    doc: "The special validity message for `required`.",
    default: "Please fill out this field."

  attr :rest, :global
  attr :selected_index, :string, doc: "The selected index."
  attr :size, :any, doc: "The input box size."
  attr :value, :string, doc: "The value of the text area."
  attr :warn, :boolean, doc: "Specify if the currently value is warn."
  attr :warn_text, :string, doc: "Message which is displayed if the value is warn."

  slot :helper_text, doc: "The helper text." do
    attr :tag, :string
  end

  slot :inner_block

  slot :label_text, doc: "The label text." do
    attr :tag, :string
  end

  slot :validity_message,
    doc:
      "The validity message. If present and non-empty, this input shows the UI of its invalid state." do
    attr :tag, :string
  end

  def select(assigns) do
    assigns =
      form_input_assigns(assigns, name: :select, mode: :value, event: "cds-select-selected")

    component_assigns = Map.drop(assigns, [:input_id, :input_value, :component_assigns, :id])
    assigns = assign(assigns, :component_assigns, component_assigns)

    ~H"""
    <input type="hidden" id={@input_id} name={@name} value={@input_value} form={@form} />
    {CoreComponents.select(@component_assigns)}
    <.form_bridge_hook />
    """
  end

  @doc """
  Component `<cds-fluid-select>` from `./src/components/fluid-select/fluid-select.ts`

  Fluid text select.

  ## Events

  * `cds-select-selected` - The name of the custom event fired after an item is selected.


  ## Attributes

  * `autofocus` (`:boolean`) - Sets the select to be focussed automatically on page load. Defaults to false. Defaults to `false`.
  * `disabled` (`:boolean`) - Controls the disabled state of the select. Defaults to `false`.
  * `hide_label` (`:boolean`) - Specify whether the label should be hidden, or not. Defaults to `false`.
  * `id` (`:string`) - ID to link the `label` and `select`. Defaults to `nil`.
  * `inline` (`:boolean`) - Specify whether you want the inline version of this control. Defaults to `false`.
  * `invalid` (`:boolean`) - Specify if the currently value is invalid. Defaults to `false`.
  * `invalid_text` (`:string`) - Message which is displayed if the value is invalid. Defaults to `nil`.
  * `is_fluid` (`:boolean`) - Specify whether the textarea is fluid or not. Defaults to `false`.
  * `multiple` (`:boolean`) - `true` to enable multiple selection. Defaults to `nil`.
  * `name` (`:string`) - Name for the select in the `FormData`. Defaults to `nil`.
  * `pattern` (`:string`) - Pattern to validate the select against for HTML validity checking. Defaults to `nil`.
  * `placeholder` (`:string`) - Value to display when the select has an empty `value`. Defaults to `nil`.
  * `readonly` (`:boolean`) - Controls the readonly state of the select. Defaults to `false`.
  * `required` (`:boolean`) - Boolean property to set the required status. Defaults to `false`.
  * `required_validity_message` (`:string`) - The special validity message for `required`. Defaults to `"Please fill out this field."`.
  * `selected_index` (`:string`) - The selected index. Defaults to `nil`.
  * `size` (`:any`) - The input box size. Defaults to `nil`.
  * `value` (`:string`) - The value of the text area. Defaults to `nil`.
  * `warn` (`:boolean`) - Specify if the currently value is warn. Defaults to `false`.
  * `warn_text` (`:string`) - Message which is displayed if the value is warn. Defaults to `nil`.
  * Global attributes are accepted.
  ## Slots

  * `helper_text` - The helper text. Accepts attributes:

    * `tag` (`:string`)
  * `label_text` - The label text. Accepts attributes:

    * `tag` (`:string`)
  * `validity_message` - The validity message. If present and non-empty, this input shows the UI of its invalid state. Accepts attributes:

    * `tag` (`:string`)
  * `inner_block`


  Form-aware wrapper.
  """
  attr :field, Phoenix.HTML.FormField, doc: "a form field struct, for example: @form[:email]"

  attr :form, :string,
    default: nil,
    doc: "the form attribute for the hidden input"

  attr :form_event, :string,
    default: nil,
    doc: "override the custom event used to sync form values"

  attr :autofocus, :boolean,
    doc: "Sets the select to be focussed automatically on page load. Defaults to false"

  attr :disabled, :boolean, doc: "Controls the disabled state of the select"
  attr :hide_label, :boolean, doc: "Specify whether the label should be hidden, or not"
  attr :id, :string, doc: "ID to link the `label` and `select`"
  attr :inline, :boolean, doc: "Specify whether you want the inline version of this control"
  attr :invalid, :boolean, doc: "Specify if the currently value is invalid."
  attr :invalid_text, :string, doc: "Message which is displayed if the value is invalid."
  attr :is_fluid, :boolean, doc: "Specify whether the textarea is fluid or not"
  attr :multiple, :boolean, doc: "`true` to enable multiple selection."
  attr :name, :string, doc: "Name for the select in the `FormData`"
  attr :pattern, :string, doc: "Pattern to validate the select against for HTML validity checking"
  attr :placeholder, :string, doc: "Value to display when the select has an empty `value`"
  attr :readonly, :boolean, doc: "Controls the readonly state of the select"
  attr :required, :boolean, doc: "Boolean property to set the required status"

  attr :required_validity_message, :string,
    doc: "The special validity message for `required`.",
    default: "Please fill out this field."

  attr :rest, :global
  attr :selected_index, :string, doc: "The selected index."
  attr :size, :any, doc: "The input box size."
  attr :value, :string, doc: "The value of the text area."
  attr :warn, :boolean, doc: "Specify if the currently value is warn."
  attr :warn_text, :string, doc: "Message which is displayed if the value is warn."

  slot :helper_text, doc: "The helper text." do
    attr :tag, :string
  end

  slot :inner_block

  slot :label_text, doc: "The label text." do
    attr :tag, :string
  end

  slot :validity_message,
    doc:
      "The validity message. If present and non-empty, this input shows the UI of its invalid state." do
    attr :tag, :string
  end

  def fluid_select(assigns) do
    assigns =
      form_input_assigns(assigns, name: :fluid_select, mode: :value, event: "cds-select-selected")

    component_assigns = Map.drop(assigns, [:input_id, :input_value, :component_assigns, :id])
    assigns = assign(assigns, :component_assigns, component_assigns)

    ~H"""
    <input type="hidden" id={@input_id} name={@name} value={@input_value} form={@form} />
    {CoreComponents.fluid_select(@component_assigns)}
    <.form_bridge_hook />
    """
  end

  @doc """
  Component `<cds-dropdown>` from `./src/components/dropdown/dropdown.ts`

  Dropdown.

  ## Events

  * `cds-dropdown-beingselected` - The custom event fired before a dropdown item is selected upon a user gesture.
  Cancellation of this event stops changing the user-initiated selection.
  * `cds-dropdown-beingtoggled` - The custom event fired before the open state of this dropdown is toggled upon a user gesture.
  Cancellation of this event stops the user-initiated toggling.
  * `cds-dropdown-selected` - The custom event fired after a dropdown item is selected upon a user gesture.
  * `cds-dropdown-toggled` - The custom event fired after the open state of this dropdown is toggled upon a user gesture.
  * `input` - Undocumented
  * `invalid` - Undocumented


  ## Attributes

  * `autoalign` (`:boolean`) - Specify whether auto align functionality should be applied. Defaults to `false`.
  * `direction` (`:string`) - Specify the direction of the dropdown. Can be either top or bottom. Defaults to `"bottom"`. Must be one of `"top"`, or `"bottom"`.
  * `disabled` (`:boolean`) - `true` if this dropdown should be disabled. Defaults to `false`.
  * `helper_text` (`:string`) - The helper text. Defaults to `nil`.
  * `hide_label` (`:boolean`) - Specify whether the title text should be hidden or not. Defaults to `false`.
  * `invalid` (`:boolean`) - `true` to show the UI of the invalid state. Defaults to `false`.
  * `invalid_text` (`:string`) - Message which is displayed if the value is invalid. Defaults to `nil`.
  * `label` (`:string`) - Generic label that will be used as the textual representation of what this field is for. Defaults to `nil`.
  * `name` (`:string`) - Name for the dropdown in the `FormData`. Defaults to `nil`.
  * `open` (`:boolean`) - `true` if this dropdown should be open. Defaults to `false`.
  * `read_only` (`:boolean`) - Whether or not the Dropdown is readonly. Defaults to `false`.
  * `required` (`:boolean`) - `true` if the value is required. Defaults to `false`.
  * `required_validity_message` (`:string`) - The special validity message for `required`. Defaults to `"Please fill out this field."`.
  * `size` (`:string`) - Dropdown size. Defaults to `"md"`. Must be one of `"sm"`, `"md"`, or `"lg"`.
  * `title_text` (`:string`) - Provide the title text that will be read by a screen reader when visiting this control. Defaults to `nil`.
  * `toggle_label_closed` (`:string`) - The `aria-label` attribute for the UI indicating the closed state. Defaults to `nil`.
  * `toggle_label_open` (`:string`) - The `aria-label` attribute for the UI indicating the open state. Defaults to `nil`.
  * `type` (`:string`) - `true` if this dropdown should use the inline UI variant. Defaults to `""`. Must be one of `""`, or `"inline"`.
  * `validity_message` (`:string`) - The validity message. Defaults to `nil`.
  * `value` (`:string`) - The value of the selected item. Defaults to `nil`.
  * `warn` (`:boolean`) - Specify whether the control is currently in warning state. Defaults to `false`.
  * `warn_text` (`:string`) - Provide the text that is displayed when the control is in warning state. Defaults to `nil`.
  * Global attributes are accepted.
  ## Slots

  * `inner_block`


  Form-aware wrapper.
  """
  attr :field, Phoenix.HTML.FormField, doc: "a form field struct, for example: @form[:email]"

  attr :form, :string,
    default: nil,
    doc: "the form attribute for the hidden input"

  attr :form_event, :string,
    default: nil,
    doc: "override the custom event used to sync form values"

  attr :autoalign, :boolean, doc: "Specify whether auto align functionality should be applied"

  attr :direction, :string,
    doc: "Specify the direction of the dropdown. Can be either top or bottom.",
    values: ["top", "bottom"],
    default: "bottom"

  attr :disabled, :boolean, doc: "`true` if this dropdown should be disabled."
  attr :helper_text, :string, doc: "The helper text."
  attr :hide_label, :boolean, doc: "Specify whether the title text should be hidden or not"
  attr :invalid, :boolean, doc: "`true` to show the UI of the invalid state."
  attr :invalid_text, :string, doc: "Message which is displayed if the value is invalid."

  attr :label, :string,
    doc: "Generic label that will be used as the textual representation of what this field is for"

  attr :name, :string, doc: "Name for the dropdown in the `FormData`"
  attr :open, :boolean, doc: "`true` if this dropdown should be open."
  attr :read_only, :boolean, doc: "Whether or not the Dropdown is readonly"
  attr :required, :boolean, doc: "`true` if the value is required."

  attr :required_validity_message, :string,
    doc: "The special validity message for `required`.",
    default: "Please fill out this field."

  attr :rest, :global
  attr :size, :string, doc: "Dropdown size.", values: ["sm", "md", "lg"], default: "md"

  attr :title_text, :string,
    doc: "Provide the title text that will be read by a screen reader when visiting this control"

  attr :toggle_label_closed, :string,
    doc: "The `aria-label` attribute for the UI indicating the closed state."

  attr :toggle_label_open, :string,
    doc: "The `aria-label` attribute for the UI indicating the open state."

  attr :type, :string,
    doc: "`true` if this dropdown should use the inline UI variant.",
    values: ["", "inline"],
    default: ""

  attr :validity_message, :string, doc: "The validity message."
  attr :value, :string, doc: "The value of the selected item."
  attr :warn, :boolean, doc: "Specify whether the control is currently in warning state"

  attr :warn_text, :string,
    doc: "Provide the text that is displayed when the control is in warning state"

  slot :inner_block

  def dropdown(assigns) do
    assigns =
      form_input_assigns(assigns, name: :dropdown, mode: :value, event: "cds-dropdown-selected")

    component_assigns = Map.drop(assigns, [:input_id, :input_value, :component_assigns, :id])
    assigns = assign(assigns, :component_assigns, component_assigns)

    ~H"""
    <input type="hidden" id={@input_id} name={@name} value={@input_value} form={@form} />
    {CoreComponents.dropdown(@component_assigns)}
    <.form_bridge_hook />
    """
  end

  @doc """
  Component `<cds-combo-box>` from `./src/components/combo-box/combo-box.ts`

  Combo box.

  ## Events

  * `cds-combo-box-beingselected` - The custom event fired before a combo box item is selected upon a user gesture.
  Cancellation of this event stops changing the user-initiated selection.
  * `cds-combo-box-beingtoggled` - The custom event fired before the open state of this combo box is toggled upon a user gesture.
  Cancellation of this event stops the user-initiated toggling.
  * `cds-combo-box-selected` - The custom event fired after a combo box item is selected upon a user gesture.
  * `cds-combo-box-toggled` - The custom event fired after the open state of this combo box is toggled upon a user gesture.
  * `cds-dropdown-beingselected` - The custom event fired before a dropdown item is selected upon a user gesture.
  Cancellation of this event stops changing the user-initiated selection.
  * `cds-dropdown-beingtoggled` - The custom event fired before the open state of this dropdown is toggled upon a user gesture.
  Cancellation of this event stops the user-initiated toggling.
  * `cds-dropdown-selected` - The custom event fired after a dropdown item is selected upon a user gesture.
  * `cds-dropdown-toggled` - The custom event fired after the open state of this dropdown is toggled upon a user gesture.
  * `input` - Undocumented
  * `invalid` - Undocumented


  ## Attributes

  * `allow_custom_value` (`:boolean`) - `true` to allow custom values that do not match any item in the list. Defaults to `false`.
  * `autoalign` (`:boolean`) - Specify whether auto align functionality should be applied. Defaults to `false`.
  * `clear_selection_label` (`:string`) - The `aria-label` attribute for the icon to clear selection. Defaults to `"Clear selection"`.
  * `direction` (`:string`) - Specify the direction of the dropdown. Can be either top or bottom. Defaults to `"bottom"`. Must be one of `"top"`, or `"bottom"`.
  * `disabled` (`:boolean`) - `true` if this dropdown should be disabled. Defaults to `false`.
  * `helper_text` (`:string`) - The helper text. Defaults to `nil`.
  * `hide_label` (`:boolean`) - Specify whether the title text should be hidden or not. Defaults to `false`.
  * `input_label` (`:string`) - The `aria-label` attribute for the `<input>` for filtering. Defaults to `nil`.
  * `invalid` (`:boolean`) - `true` to show the UI of the invalid state. Defaults to `false`.
  * `invalid_text` (`:string`) - Message which is displayed if the value is invalid. Defaults to `nil`.
  * `label` (`:string`) - Generic label that will be used as the textual representation of what this field is for. Defaults to `nil`.
  * `name` (`:string`) - Name for the dropdown in the `FormData`. Defaults to `nil`.
  * `open` (`:boolean`) - `true` if this dropdown should be open. Defaults to `false`.
  * `read_only` (`:boolean`) - Whether or not the Dropdown is readonly. Defaults to `false`.
  * `required` (`:boolean`) - `true` if the value is required. Defaults to `false`.
  * `required_validity_message` (`:string`) - The special validity message for `required`. Defaults to `"Please fill out this field."`.
  * `should_filter_item` (`:any`) - Provide custom filtering behavior. This attribute will be ignored if
    `typeahead` is enabled and will default to `true`

    Defaults to `nil`.
  * `size` (`:string`) - Dropdown size. Defaults to `"md"`. Must be one of `"sm"`, `"md"`, or `"lg"`.
  * `title_text` (`:string`) - Provide the title text that will be read by a screen reader when visiting this control. Defaults to `nil`.
  * `toggle_label_closed` (`:string`) - The `aria-label` attribute for the UI indicating the closed state. Defaults to `nil`.
  * `toggle_label_open` (`:string`) - The `aria-label` attribute for the UI indicating the open state. Defaults to `nil`.
  * `type` (`:string`) - `true` if this dropdown should use the inline UI variant. Defaults to `""`. Must be one of `""`, or `"inline"`.
  * `typeahead` (`:boolean`) - **Experimental**: will enable autocomplete and typeahead for the input field. Defaults to `false`.
  * `validity_message` (`:string`) - The validity message. Defaults to `nil`.
  * `value` (`:string`) - The value of the selected item. Defaults to `nil`.
  * `warn` (`:boolean`) - Specify whether the control is currently in warning state. Defaults to `false`.
  * `warn_text` (`:string`) - Provide the text that is displayed when the control is in warning state. Defaults to `nil`.
  * Global attributes are accepted.
  ## Slots

  * `inner_block`


  Form-aware wrapper.
  """
  attr :field, Phoenix.HTML.FormField, doc: "a form field struct, for example: @form[:email]"

  attr :form, :string,
    default: nil,
    doc: "the form attribute for the hidden input"

  attr :form_event, :string,
    default: nil,
    doc: "override the custom event used to sync form values"

  attr :allow_custom_value, :boolean,
    doc: "`true` to allow custom values that do not match any item in the list."

  attr :autoalign, :boolean, doc: "Specify whether auto align functionality should be applied"

  attr :clear_selection_label, :string,
    doc: "The `aria-label` attribute for the icon to clear selection.",
    default: "Clear selection"

  attr :direction, :string,
    doc: "Specify the direction of the dropdown. Can be either top or bottom.",
    values: ["top", "bottom"],
    default: "bottom"

  attr :disabled, :boolean, doc: "`true` if this dropdown should be disabled."
  attr :helper_text, :string, doc: "The helper text."
  attr :hide_label, :boolean, doc: "Specify whether the title text should be hidden or not"
  attr :input_label, :string, doc: "The `aria-label` attribute for the `<input>` for filtering."
  attr :invalid, :boolean, doc: "`true` to show the UI of the invalid state."
  attr :invalid_text, :string, doc: "Message which is displayed if the value is invalid."

  attr :label, :string,
    doc: "Generic label that will be used as the textual representation of what this field is for"

  attr :name, :string, doc: "Name for the dropdown in the `FormData`"
  attr :open, :boolean, doc: "`true` if this dropdown should be open."
  attr :read_only, :boolean, doc: "Whether or not the Dropdown is readonly"
  attr :required, :boolean, doc: "`true` if the value is required."

  attr :required_validity_message, :string,
    doc: "The special validity message for `required`.",
    default: "Please fill out this field."

  attr :rest, :global

  attr :should_filter_item, :any,
    doc:
      "Provide custom filtering behavior. This attribute will be ignored if\n`typeahead` is enabled and will default to `true`"

  attr :size, :string, doc: "Dropdown size.", values: ["sm", "md", "lg"], default: "md"

  attr :title_text, :string,
    doc: "Provide the title text that will be read by a screen reader when visiting this control"

  attr :toggle_label_closed, :string,
    doc: "The `aria-label` attribute for the UI indicating the closed state."

  attr :toggle_label_open, :string,
    doc: "The `aria-label` attribute for the UI indicating the open state."

  attr :type, :string,
    doc: "`true` if this dropdown should use the inline UI variant.",
    values: ["", "inline"],
    default: ""

  attr :typeahead, :boolean,
    doc: "**Experimental**: will enable autocomplete and typeahead for the input field."

  attr :validity_message, :string, doc: "The validity message."
  attr :value, :string, doc: "The value of the selected item."
  attr :warn, :boolean, doc: "Specify whether the control is currently in warning state"

  attr :warn_text, :string,
    doc: "Provide the text that is displayed when the control is in warning state"

  slot :inner_block

  def combo_box(assigns) do
    assigns =
      form_input_assigns(assigns, name: :combo_box, mode: :value, event: "cds-combo-box-selected")

    component_assigns = Map.drop(assigns, [:input_id, :input_value, :component_assigns, :id])
    assigns = assign(assigns, :component_assigns, component_assigns)

    ~H"""
    <input type="hidden" id={@input_id} name={@name} value={@input_value} form={@form} />
    {CoreComponents.combo_box(@component_assigns)}
    <.form_bridge_hook />
    """
  end

  @doc """
  Component `<cds-multi-select>` from `./src/components/multi-select/multi-select.ts`

  Multi select.

  ## Events

  * `cds-multi-select-beingselected` - The custom event fired before a multi select item is selected upon a user gesture.
  Cancellation of this event stops changing the user-initiated selection.
  * `cds-multi-select-selected` - The custom event fired after a multi select item is selected upon a user gesture.
  * `cds-multi-select-beingtoggled` - The custom event fired before the open state of this multi select is toggled upon a user gesture.
  Cancellation of this event stops the user-initiated toggling.
  * `cds-multi-select-toggled` - The custom event fired after the open state of this multi select is toggled upon a user gesture.
  * `input` - Undocumented
  * `cds-dropdown-beingselected` - The custom event fired before a dropdown item is selected upon a user gesture.
  Cancellation of this event stops changing the user-initiated selection.
  * `cds-dropdown-beingtoggled` - The custom event fired before the open state of this dropdown is toggled upon a user gesture.
  Cancellation of this event stops the user-initiated toggling.
  * `cds-dropdown-selected` - The custom event fired after a dropdown item is selected upon a user gesture.
  * `cds-dropdown-toggled` - The custom event fired after the open state of this dropdown is toggled upon a user gesture.
  * `invalid` - Undocumented


  ## Attributes

  * `autoalign` (`:boolean`) - Specify whether auto align functionality should be applied. Defaults to `false`.
  * `clear_selection_description` (`:string`) - Specify the text that should be read for screen readers that describes total items selected. Defaults to `"Total items selected: "`.
  * `clear_selection_label` (`:string`) - The `aria-label` attribute for the icon to clear selection. Defaults to `nil`.
  * `clear_selection_text` (`:string`) - Specify the text that should be read for screen readers to clear selection. Defaults to `"To clear selection, press Delete or Backspace."`.
  * `direction` (`:string`) - Specify the direction of the dropdown. Can be either top or bottom. Defaults to `"bottom"`. Must be one of `"top"`, or `"bottom"`.
  * `disabled` (`:boolean`) - `true` if this dropdown should be disabled. Defaults to `false`.
  * `filterable` (`:any`) - Defaults to `nil`.
  * `helper_text` (`:string`) - The helper text. Defaults to `nil`.
  * `hide_label` (`:boolean`) - Specify whether the title text should be hidden or not. Defaults to `false`.
  * `invalid` (`:boolean`) - `true` to show the UI of the invalid state. Defaults to `false`.
  * `invalid_text` (`:string`) - Message which is displayed if the value is invalid. Defaults to `nil`.
  * `label` (`:string`) - Generic label that will be used as the textual representation of what this field is for. Defaults to `nil`.
  * `locale` (`:string`) - Specify the locale of the control. Used for the default compareItems used for sorting the list of items in the control. Defaults to `"en"`.
  * `name` (`:string`) - Name for the dropdown in the `FormData`. Defaults to `nil`.
  * `open` (`:boolean`) - `true` if this dropdown should be open. Defaults to `false`.
  * `read_only` (`:boolean`) - Whether or not the Dropdown is readonly. Defaults to `false`.
  * `required` (`:boolean`) - `true` if the value is required. Defaults to `false`.
  * `required_validity_message` (`:string`) - The special validity message for `required`. Defaults to `"Please fill out this field."`.
  * `select_all` (`:boolean`) - Enables rendering of a “Select all” multi-select-item. Defaults to `false`.
  * `selection_feedback` (`:string`) - Specify feedback (mode) of the selection.
    `top`: selected item jumps to top
    `fixed`: selected item stays at it's position
    `top-after-reopen`: selected item jump to top after reopen dropdown

    Defaults to `"top-after-reopen"`. Must be one of `"fixed"`, `"top"`, or `"top-after-reopen"`.
  * `size` (`:string`) - Dropdown size. Defaults to `"md"`. Must be one of `"sm"`, `"md"`, or `"lg"`.
  * `title_text` (`:string`) - Provide the title text that will be read by a screen reader when visiting this control. Defaults to `nil`.
  * `toggle_label_closed` (`:string`) - The `aria-label` attribute for the UI indicating the closed state. Defaults to `nil`.
  * `toggle_label_open` (`:string`) - The `aria-label` attribute for the UI indicating the open state. Defaults to `nil`.
  * `type` (`:string`) - `true` if this dropdown should use the inline UI variant. Defaults to `""`. Must be one of `""`, or `"inline"`.
  * `validity_message` (`:string`) - The validity message. Defaults to `nil`.
  * `value` (`:string`) - The value of the selected item. Defaults to `nil`.
  * `warn` (`:boolean`) - Specify whether the control is currently in warning state. Defaults to `false`.
  * `warn_text` (`:string`) - Provide the text that is displayed when the control is in warning state. Defaults to `nil`.
  * Global attributes are accepted.
  ## Slots

  * `inner_block`


  Form-aware wrapper.
  """
  attr :field, Phoenix.HTML.FormField, doc: "a form field struct, for example: @form[:email]"

  attr :form, :string,
    default: nil,
    doc: "the form attribute for the hidden input"

  attr :form_event, :string,
    default: nil,
    doc: "override the custom event used to sync form values"

  attr :autoalign, :boolean, doc: "Specify whether auto align functionality should be applied"

  attr :clear_selection_description, :string,
    doc:
      "Specify the text that should be read for screen readers that describes total items selected",
    default: "Total items selected: "

  attr :clear_selection_label, :string,
    doc: "The `aria-label` attribute for the icon to clear selection."

  attr :clear_selection_text, :string,
    doc: "Specify the text that should be read for screen readers to clear selection.",
    default: "To clear selection, press Delete or Backspace."

  attr :direction, :string,
    doc: "Specify the direction of the dropdown. Can be either top or bottom.",
    values: ["top", "bottom"],
    default: "bottom"

  attr :disabled, :boolean, doc: "`true` if this dropdown should be disabled."
  attr :filterable, :any
  attr :helper_text, :string, doc: "The helper text."
  attr :hide_label, :boolean, doc: "Specify whether the title text should be hidden or not"
  attr :invalid, :boolean, doc: "`true` to show the UI of the invalid state."
  attr :invalid_text, :string, doc: "Message which is displayed if the value is invalid."

  attr :label, :string,
    doc: "Generic label that will be used as the textual representation of what this field is for"

  attr :locale, :string,
    doc:
      "Specify the locale of the control. Used for the default compareItems used for sorting the list of items in the control.",
    default: "en"

  attr :name, :string, doc: "Name for the dropdown in the `FormData`"
  attr :open, :boolean, doc: "`true` if this dropdown should be open."
  attr :read_only, :boolean, doc: "Whether or not the Dropdown is readonly"
  attr :required, :boolean, doc: "`true` if the value is required."

  attr :required_validity_message, :string,
    doc: "The special validity message for `required`.",
    default: "Please fill out this field."

  attr :rest, :global
  attr :select_all, :boolean, doc: "Enables rendering of a “Select all” multi-select-item"

  attr :selection_feedback, :string,
    doc:
      "Specify feedback (mode) of the selection.\n`top`: selected item jumps to top\n`fixed`: selected item stays at it's position\n`top-after-reopen`: selected item jump to top after reopen dropdown",
    values: ["fixed", "top", "top-after-reopen"],
    default: "top-after-reopen"

  attr :size, :string, doc: "Dropdown size.", values: ["sm", "md", "lg"], default: "md"

  attr :title_text, :string,
    doc: "Provide the title text that will be read by a screen reader when visiting this control"

  attr :toggle_label_closed, :string,
    doc: "The `aria-label` attribute for the UI indicating the closed state."

  attr :toggle_label_open, :string,
    doc: "The `aria-label` attribute for the UI indicating the open state."

  attr :type, :string,
    doc: "`true` if this dropdown should use the inline UI variant.",
    values: ["", "inline"],
    default: ""

  attr :validity_message, :string, doc: "The validity message."
  attr :value, :string, doc: "The value of the selected item."
  attr :warn, :boolean, doc: "Specify whether the control is currently in warning state"

  attr :warn_text, :string,
    doc: "Provide the text that is displayed when the control is in warning state"

  slot :inner_block

  def multi_select(assigns) do
    assigns =
      form_input_assigns(assigns,
        name: :multi_select,
        mode: :value,
        event: "cds-multi-select-selected"
      )

    component_assigns = Map.drop(assigns, [:input_id, :input_value, :component_assigns, :id])
    assigns = assign(assigns, :component_assigns, component_assigns)

    ~H"""
    <input type="hidden" id={@input_id} name={@name} value={@input_value} form={@form} />
    {CoreComponents.multi_select(@component_assigns)}
    <.form_bridge_hook />
    """
  end

  @doc """
  Component `<cds-date-picker>` from `./src/components/date-picker/date-picker.ts`

  Date picker.

  ## Events

  * `cds-date-picker-changed` - The custom event fired on this element when Flatpickr updates its value.
  * `cds-date-picker-flatpickr-error` - The name of the custom event when Flatpickr throws an error.


  ## Attributes

  * `allow_input` (`:boolean`) - flatpickr prop passthrough. Allows the user to enter a date directly into the input field. Defaults to `true`.
  * `close_on_select` (`:boolean`) - flatpickr prop passthrough. Controls whether the calendar dropdown closes upon selection. Defaults to `true`.
  * `date_format` (`:string`) - The date format to let Flatpickr use. Defaults to `nil`.
  * `disabled` (`:boolean`) - Controls the disabled state of the input. Defaults to `false`.
  * `enabled_range` (`:string`) - The date range that a user can pick in calendar dropdown. Defaults to `nil`.
  * `max_date` (`:string`) - The maximum date that a user can start picking from. Defaults to `nil`.
  * `min_date` (`:string`) - The minimum date that a user can start picking from. Defaults to `nil`.
  * `name` (`:string`) - Name for the input in the `FormData`. Defaults to `nil`.
  * `open` (`:boolean`) - `true` if the date picker should be open. Defaults to `false`.
  * `readonly` (`:boolean`) - Specify if the component should be read-only. Defaults to `false`.
  * `value` (`:string`) - The date(s) in ISO8601 format (date portion only), for range mode, '/' is used for separate start/end dates. Defaults to `nil`.
  * Global attributes are accepted.
  ## Slots

  * `inner_block`


  Form-aware wrapper.
  """
  attr :field, Phoenix.HTML.FormField, doc: "a form field struct, for example: @form[:email]"

  attr :form, :string,
    default: nil,
    doc: "the form attribute for the hidden input"

  attr :form_event, :string,
    default: nil,
    doc: "override the custom event used to sync form values"

  attr :allow_input, :boolean,
    doc:
      "flatpickr prop passthrough. Allows the user to enter a date directly into the input field",
    default: true

  attr :close_on_select, :boolean,
    doc:
      "flatpickr prop passthrough. Controls whether the calendar dropdown closes upon selection.",
    default: true

  attr :date_format, :string, doc: "The date format to let Flatpickr use."
  attr :disabled, :boolean, doc: "Controls the disabled state of the input"
  attr :enabled_range, :string, doc: "The date range that a user can pick in calendar dropdown."
  attr :max_date, :string, doc: "The maximum date that a user can start picking from."
  attr :min_date, :string, doc: "The minimum date that a user can start picking from."
  attr :name, :string, doc: "Name for the input in the `FormData`"
  attr :open, :boolean, doc: "`true` if the date picker should be open."
  attr :readonly, :boolean, doc: "Specify if the component should be read-only"
  attr :rest, :global

  attr :value, :string,
    doc:
      "The date(s) in ISO8601 format (date portion only), for range mode, '/' is used for separate start/end dates."

  slot :inner_block

  def date_picker(assigns) do
    assigns =
      form_input_assigns(assigns,
        name: :date_picker,
        mode: :value,
        event: "cds-date-picker-changed"
      )

    component_assigns = Map.drop(assigns, [:input_id, :input_value, :component_assigns, :id])
    assigns = assign(assigns, :component_assigns, component_assigns)

    ~H"""
    <input type="hidden" id={@input_id} name={@name} value={@input_value} form={@form} />
    {CoreComponents.date_picker(@component_assigns)}
    <.form_bridge_hook />
    """
  end

  @doc """
  Component `<cds-time-picker>` from `./src/components/time-picker/time-picker.ts`

  Time Picker component.

  ## Events

  * `change` - Undocumented
  * `invalid` - Undocumented


  ## Attributes

  * `disabled` (`:boolean`) - Specify whether the control is disabled. Defaults to `false`.
  * `hide_label` (`:boolean`) - Specify whether the label should be hidden. Defaults to `false`.
  * `invalid` (`:boolean`) - Specify whether the control is currently invalid. Defaults to `false`.
  * `invalid_text` (`:string`) - Provide the text that is displayed when the control is in an invalid state. Defaults to `"Invalid time format."`.
  * `max_length` (`:string`) - Specify the maximum length of the input value. Defaults to `"5"`.
  * `name` (`:string`) - Name for the input in FormData. Defaults to `nil`.
  * `pattern` (`:string`) - Pattern for input validation. Defaults to `"(1[012]|[1-9]):[0-5][0-9](\\\\s)?"`.
  * `placeholder` (`:string`) - Placeholder text for the input. Defaults to `"hh:mm"`.
  * `read_only` (`:boolean`) - Specify whether the control should be read-only. Defaults to `false`.
  * `required` (`:boolean`) - Whether the input is required. Defaults to `false`.
  * `required_validity_message` (`:string`) - Custom message for required validation. Defaults to `"Please fill out this field."`.
  * `size` (`:any`) - Size of the time picker. Defaults to `nil`.
  * `type` (`:string`) - Input type. Defaults to `"text"`.
  * `value` (`:string`) - Value of the input. Defaults to `nil`.
  * `warning` (`:boolean`) - Specify whether the control is in warning state. Defaults to `false`.
  * `warning_text` (`:string`) - Provide the text that is displayed when the control is in a warning state. Defaults to `"Warning message."`.
  * Global attributes are accepted.
  ## Slots

  * `label_text` - The label text. Accepts attributes:

    * `tag` (`:string`)
  * `time_picker_select` - Slot for time picker select components. Accepts attributes:

    * `tag` (`:string`)
  * `validity_message` - The validity message. If present and non-empty, this input shows the UI of its invalid state. Accepts attributes:

    * `tag` (`:string`)
  * `inner_block`


  Form-aware wrapper.
  """
  attr :field, Phoenix.HTML.FormField, doc: "a form field struct, for example: @form[:email]"

  attr :form, :string,
    default: nil,
    doc: "the form attribute for the hidden input"

  attr :form_event, :string,
    default: nil,
    doc: "override the custom event used to sync form values"

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

  attr :rest, :global
  attr :size, :any, doc: "Size of the time picker"
  attr :type, :string, doc: "Input type", default: "text"
  attr :value, :string, doc: "Value of the input"
  attr :warning, :boolean, doc: "Specify whether the control is in warning state"

  attr :warning_text, :string,
    doc: "Provide the text that is displayed when the control is in a warning state",
    default: "Warning message."

  slot :inner_block

  slot :label_text, doc: "The label text." do
    attr :tag, :string
  end

  slot :time_picker_select, doc: "Slot for time picker select components." do
    attr :tag, :string
  end

  slot :validity_message,
    doc:
      "The validity message. If present and non-empty, this input shows the UI of its invalid state." do
    attr :tag, :string
  end

  def time_picker(assigns) do
    assigns = form_input_assigns(assigns, name: :time_picker, mode: :value, event: "change")
    component_assigns = Map.drop(assigns, [:input_id, :input_value, :component_assigns, :id])
    assigns = assign(assigns, :component_assigns, component_assigns)

    ~H"""
    <input type="hidden" id={@input_id} name={@name} value={@input_value} form={@form} />
    {CoreComponents.time_picker(@component_assigns)}
    <.form_bridge_hook />
    """
  end
end
