Code.require_file(Path.expand("interactivity_helpers.exs", __DIR__))

defmodule Storybook.CarbonComponents.FormComponents do
  use PhoenixStorybook.Story, :example

  import Graphene.Internal.FormComponents
  import Graphene.CarbonComponents, only: [button: 1]
  import Storybook.CarbonComponents.InteractivityHelpers
  alias Phoenix.LiveView.JS

  alias Graphene.Internal.CoreComponents

  def doc do
    "All form-aware components with a live form state preview."
  end

  @impl true
  def mount(_params, _session, socket) do
    form =
      Phoenix.Component.to_form(
        %{
          "subscribe" => true,
          "feature" => false,
          "plan" => "starter",
          "quantity" => "2",
          "fluid_quantity" => "4",
          "name" => "Ada Lovelace",
          "title" => "Engineer",
          "password" => "password",
          "bio" => "Inventor of the first algorithm.",
          "notes" => "Prefers a concise summary.",
          "search" => "Ada",
          "fluid_search" => "",
          "select" => "option-1",
          "fluid_select" => "option-2",
          "dropdown" => "option-1",
          "combo" => "option-2",
          "multi" => "option-1",
          "date" => "2024-01-10",
          "time" => "09:30",
          "slo" => "65",
          "attachments" => ""
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
              <.toggle field={@form[:feature]} label_a="On" label_b="Off">
                <:label_text>Enable feature</:label_text>
              </.toggle>
            </div>

            <div style="display: grid; gap: 0.75rem;">
              <h3>Radio group</h3>
              <.radio_button_group field={@form[:plan]} legend_text="Choose a plan">
                <CoreComponents.radio_button value="starter" label_text="Starter" />
                <CoreComponents.radio_button value="pro" label_text="Pro" />
                <CoreComponents.radio_button value="enterprise" label_text="Enterprise" />
              </.radio_button_group>
            </div>

            <div style="display: grid; gap: 0.75rem;">
              <h3>Numbers</h3>
              <.number_input field={@form[:quantity]} min="0" max="Infinity">
                <:label_text>Quantity</:label_text>
              </.number_input>
              <.fluid_number_input field={@form[:fluid_quantity]} min="0" max="Infinity">
                <:label_text>Fluid quantity</:label_text>
              </.fluid_number_input>
              <.slider
                field={@form[:slo]}
                id={@form[:slo].id}
                name={@form[:slo].name}
                value={@form[:slo].value}
                min="0"
                max="100"
                step="5"
              >
                <:label_text>Utilization target</:label_text>
              </.slider>
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
              <.select field={@form[:select]}>
                <:label_text>Select option</:label_text>
                <:item value="option-1">Option 1</:item>
                <:item value="option-2">Option 2</:item>
                <:item value="option-3">Option 3</:item>
              </.select>
              <.fluid_select field={@form[:fluid_select]}>
                <:label_text>Fluid select</:label_text>
                <:item value="option-1">Option 1</:item>
                <:item value="option-2">Option 2</:item>
                <:item value="option-3">Option 3</:item>
              </.fluid_select>
              <.dropdown field={@form[:dropdown]} label="Dropdown">
                <:item value="option-1">Option 1</:item>
                <:item value="option-2">Option 2</:item>
                <:item value="option-3">Option 3</:item>
              </.dropdown>
              <.combo_box field={@form[:combo]} label="Combo box">
                <:item value="option-1">Option 1</:item>
                <:item value="option-2">Option 2</:item>
                <:item value="option-3">Option 3</:item>
              </.combo_box>
              <.multi_select field={@form[:multi]} label="Multi select">
                <:item value="option-1">Option 1</:item>
                <:item value="option-2">Option 2</:item>
                <:item value="option-3">Option 3</:item>
              </.multi_select>
            </div>

            <div style="display: grid; gap: 0.75rem;">
              <h3>Date & time</h3>
              <.date_picker field={@form[:date]}>
                <CoreComponents.date_picker_input
                  label_text="Start date"
                  placeholder="mm/dd/yyyy"
                  kind="single"
                />
              </.date_picker>
              <.time_picker field={@form[:time]}>
                <:label_text>Select time</:label_text>
              </.time_picker>
            </div>

            <div style="display: grid; gap: 0.75rem;">
              <h3>File upload</h3>
              <.file_uploader field={@form[:attachments]} label_title="Upload evidence">
                <:button label="Add files" />
                <:item state="complete">audit-report.pdf</:item>
              </.file_uploader>
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

end
