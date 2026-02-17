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
