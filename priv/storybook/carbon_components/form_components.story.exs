Code.require_file(Path.expand("interactivity_helpers.exs", __DIR__))

defmodule Storybook.CarbonComponents.FormComponents do
  use PhoenixStorybook.Story, :example

  import Graphene.FormComponents
  import Graphene.CarbonComponents, only: [button: 1]
  import Storybook.CarbonComponents.InteractivityHelpers
  alias Phoenix.LiveView.JS

  alias Graphene.CoreComponents

  def doc do
    "All form-aware components with a live form state preview."
  end

  @impl true
  def mount(_params, _session, socket) do
    form =
      Phoenix.Component.to_form(
        %{
          subscribe: true,
          feature: false,
          plan: "starter",
          quantity: "2",
          fluid_quantity: "4",
          name: "Ada Lovelace",
          title: "Engineer",
          password: "password",
          bio: "Inventor of the first algorithm.",
          notes: "Prefers a concise summary.",
          search: "Ada",
          fluid_search: "",
          select: "option-1",
          fluid_select: "option-2",
          dropdown: "option-1",
          combo: "option-2",
          multi: "option-1",
          date: "2024-01-10",
          time: "09:30"
        },
        as: :form
      )

    {:ok,
     assign(socket,
       form: form,
       form_state: %{},
       submitted_state: %{},
       change_event: nil,
       submit_event: nil
     )}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div style="display: grid; gap: 2rem;">
      <div id="form-components-demo">
        <form id="form-components-form" phx-change="form_change" phx-submit="form_submit">
          <div style="display: grid; gap: 1.5rem;">
            <div style="display: grid; gap: 0.75rem;">
              <h3>Boolean inputs</h3>
              <.checkbox field={@form[:subscribe]} label_text="Receive updates" />
              <.toggle
                field={@form[:feature]}
                label_text="Enable feature"
                label_a="On"
                label_b="Off"
              />
            </div>

            <div style="display: grid; gap: 0.75rem;">
              <h3>Radio group</h3>
              <.form_radio_group field={@form[:plan]} legend_text="Choose a plan">
                <:choice value="starter" label="Starter" />
                <:choice value="pro" label="Pro" />
                <:choice value="enterprise" label="Enterprise" />
              </.form_radio_group>
            </div>

            <div style="display: grid; gap: 0.75rem;">
              <h3>Numbers</h3>
              <.number_input field={@form[:quantity]} min="0" max="Infinity">
                <:s-label-text>Quantity</:s-label-text>
              </.number_input>
              <.fluid_number_input field={@form[:fluid_quantity]} min="0" max="Infinity">
                <:s-label-text>Fluid quantity</:s-label-text>
              </.fluid_number_input>
            </div>

            <div style="display: grid; gap: 0.75rem;">
              <h3>Text</h3>
              <.text_input field={@form[:name]} label="Name" />
              <.fluid_text_input field={@form[:title]} label="Title" />
              <.password_input field={@form[:password]} label="Password" />
              <.textarea field={@form[:bio]} label="Bio" />
              <.fluid_textarea field={@form[:notes]} label="Notes" />
            </div>

            <div style="display: grid; gap: 0.75rem;">
              <h3>Search</h3>
              <.search field={@form[:search]} label_text="Search" />
              <.fluid_search field={@form[:fluid_search]} label_text="Fluid search" />
            </div>

            <div style="display: grid; gap: 0.75rem;">
              <h3>Selects</h3>
              <.form_select field={@form[:select]} label="Select option">
                <:choice value="option-1" label="Option 1" />
                <:choice value="option-2" label="Option 2" />
                <:choice value="option-3" label="Option 3" />
              </.form_select>
              <.form_fluid_select field={@form[:fluid_select]} label="Fluid select">
                <:choice value="option-1" label="Option 1" />
                <:choice value="option-2" label="Option 2" />
                <:choice value="option-3" label="Option 3" />
              </.form_fluid_select>
              <.form_dropdown field={@form[:dropdown]} label="Dropdown">
                <:choice value="option-1" label="Option 1" />
                <:choice value="option-2" label="Option 2" />
                <:choice value="option-3" label="Option 3" />
              </.form_dropdown>
              <.form_combo_box field={@form[:combo]} label="Combo box">
                <:choice value="option-1" label="Option 1" />
                <:choice value="option-2" label="Option 2" />
                <:choice value="option-3" label="Option 3" />
              </.form_combo_box>
              <.form_multi_select field={@form[:multi]} label="Multi select">
                <:choice value="option-1" label="Option 1" />
                <:choice value="option-2" label="Option 2" />
                <:choice value="option-3" label="Option 3" />
              </.form_multi_select>
            </div>

            <div style="display: grid; gap: 0.75rem;">
              <h3>Date & time</h3>
              <.form_date_picker field={@form[:date]} label_text="Start date" placeholder="mm/dd/yyyy" />
              <.time_picker field={@form[:time]} label_text="Select time" />
            </div>
          </div>

          <div style="margin-top: 1.5rem;">
            <.button
              type="button"
              phx-click={JS.dispatch("submit", to: "#form-components-form")}
            >
              Send form state
            </.button>
          </div>
        </form>
      </div>

      <div style="display: grid; gap: 1.5rem;">
        <.event_panel
          title="Form params (phx-change)"
          state={@form_state}
          last_event={@change_event}
          pretty={true}
        />
        <.event_panel
          title="Submitted params (phx-submit)"
          state={@submitted_state}
          last_event={@submit_event}
          pretty={true}
        />
      </div>
    </div>
    """
  end

  @impl true
  def handle_event("form_change", %{"form" => params} = payload, socket) do
    {:noreply,
     socket
     |> assign(form_state: params)
     |> assign(change_event: %{event: "form_change", payload: payload})}
  end

  @impl true
  def handle_event("form_submit", %{"form" => params} = payload, socket) do
    {:noreply,
     socket
     |> assign(submitted_state: params)
     |> assign(submit_event: %{event: "form_submit", payload: payload})}
  end

  attr :field, Phoenix.HTML.FormField
  attr :legend_text, :string, default: nil
  attr :name, :string, default: nil
  slot :choice do
    attr :label, :string
    attr :value, :string
    attr :checked, :boolean
    attr :disabled, :boolean
  end

  defp form_radio_group(assigns) do
    ~H"""
    <.radio_button_group field={@field} legend_text={@legend_text} name={@name}>
      <%= for choice <- @choice do %>
        <CoreComponents.radio_button
          label_text={choice[:label]}
          value={choice[:value]}
          checked={choice[:checked]}
          disabled={choice[:disabled]}
        />
      <% end %>
    </.radio_button_group>
    """
  end

  attr :field, Phoenix.HTML.FormField
  attr :label, :string, default: nil
  slot :choice do
    attr :label, :string
    attr :value, :string
    attr :selected, :boolean
    attr :disabled, :boolean
  end

  defp form_select(assigns) do
    ~H"""
    <.select field={@field} label={@label}>
      <%= for choice <- @choice do %>
        <CoreComponents.select_item
          value={choice[:value] || choice[:label]}
          selected={choice[:selected]}
          disabled={choice[:disabled]}
        >
          {choice[:label]}
        </CoreComponents.select_item>
      <% end %>
    </.select>
    """
  end

  attr :field, Phoenix.HTML.FormField
  attr :label, :string, default: nil
  slot :choice do
    attr :label, :string
    attr :value, :string
    attr :selected, :boolean
    attr :disabled, :boolean
  end

  defp form_fluid_select(assigns) do
    ~H"""
    <.fluid_select field={@field} label={@label}>
      <%= for choice <- @choice do %>
        <CoreComponents.select_item
          value={choice[:value] || choice[:label]}
          selected={choice[:selected]}
          disabled={choice[:disabled]}
        >
          {choice[:label]}
        </CoreComponents.select_item>
      <% end %>
    </.fluid_select>
    """
  end

  attr :field, Phoenix.HTML.FormField
  attr :label, :string, default: nil
  slot :choice do
    attr :label, :string
    attr :value, :string
    attr :disabled, :boolean
  end

  defp form_dropdown(assigns) do
    ~H"""
    <.dropdown field={@field} label={@label}>
      <%= for choice <- @choice do %>
        <CoreComponents.dropdown_item value={choice[:value] || choice[:label]} disabled={choice[:disabled]}>
          {choice[:label]}
        </CoreComponents.dropdown_item>
      <% end %>
    </.dropdown>
    """
  end

  attr :field, Phoenix.HTML.FormField
  attr :label, :string, default: nil
  slot :choice do
    attr :label, :string
    attr :value, :string
    attr :disabled, :boolean
  end

  defp form_combo_box(assigns) do
    ~H"""
    <.combo_box field={@field} label={@label}>
      <%= for choice <- @choice do %>
        <CoreComponents.combo_box_item value={choice[:value] || choice[:label]} disabled={choice[:disabled]}>
          {choice[:label]}
        </CoreComponents.combo_box_item>
      <% end %>
    </.combo_box>
    """
  end

  attr :field, Phoenix.HTML.FormField
  attr :label, :string, default: nil
  slot :choice do
    attr :label, :string
    attr :value, :string
    attr :disabled, :boolean
  end

  defp form_multi_select(assigns) do
    ~H"""
    <.multi_select field={@field} label={@label}>
      <%= for choice <- @choice do %>
        <CoreComponents.multi_select_item value={choice[:value] || choice[:label]} disabled={choice[:disabled]}>
          {choice[:label]}
        </CoreComponents.multi_select_item>
      <% end %>
    </.multi_select>
    """
  end

  attr :field, Phoenix.HTML.FormField
  attr :label_text, :string, default: nil
  attr :placeholder, :string, default: nil

  defp form_date_picker(assigns) do
    ~H"""
    <.date_picker field={@field}>
      <CoreComponents.date_picker_input
        label_text={@label_text}
        placeholder={@placeholder}
        kind="single"
      />
    </.date_picker>
    """
  end
end
