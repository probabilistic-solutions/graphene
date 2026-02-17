defmodule Storybook.CarbonComponents.Modal.Basic do
  use PhoenixStorybook.Story, :example

  import Graphene.CarbonComponents

  def doc do
    "Modal sizes with controlled open state."
  end

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, open_modal: nil)}
  end

  @impl true
  def handle_event("open_modal", %{"id" => id}, socket) do
    {:noreply, assign(socket, open_modal: id)}
  end

  @impl true
  def handle_event("close_modal", _params, socket) do
    {:noreply, assign(socket, open_modal: nil)}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div style="display: grid; gap: 1rem;">
      <div style="display: flex; flex-wrap: wrap; gap: 0.75rem;">
        <.button kind="primary" phx-click="open_modal" phx-value-id="small">
          Open small modal
        </.button>
        <.button kind="secondary" phx-click="open_modal" phx-value-id="large">
          Open large modal
        </.button>
        <.button kind="danger--tertiary" phx-click="open_modal" phx-value-id="danger">
          Open danger modal
        </.button>
      </div>

      <.modal open={@open_modal == "small"} size="sm">
        <:label>Optional label</:label>
        <:heading>Modal heading</:heading>
        <:body>Add your modal content here. Use descriptive text to explain next steps.</:body>
        <:footer_button kind="secondary" attrs={%{"phx-click" => "close_modal"}}>Cancel</:footer_button>
        <:footer_button kind="primary" attrs={%{"phx-click" => "close_modal"}}>Submit</:footer_button>
      </.modal>

      <.modal open={@open_modal == "large"} size="lg">
        <:label>Large modal</:label>
        <:heading>Modal heading</:heading>
        <:body>Large modal content with additional context.</:body>
        <:footer_button kind="secondary" attrs={%{"phx-click" => "close_modal"}}>Back</:footer_button>
        <:footer_button kind="primary" attrs={%{"phx-click" => "close_modal"}}>Continue</:footer_button>
      </.modal>

      <.modal open={@open_modal == "danger"} size="sm">
        <:label>Danger</:label>
        <:heading>Delete item</:heading>
        <:body>Are you sure you want to delete this item?</:body>
        <:footer_button kind="secondary" attrs={%{"phx-click" => "close_modal"}}>Cancel</:footer_button>
        <:footer_button kind="danger" attrs={%{"phx-click" => "close_modal"}}>Delete</:footer_button>
      </.modal>
    </div>
    """
  end
end
