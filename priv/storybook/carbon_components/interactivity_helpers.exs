defmodule Storybook.CarbonComponents.InteractivityHelpers do
  use Phoenix.Component

  def custom_event_attrs(events, opts \\ []) do
    attrs = %{
      "phx-hook" => "StorybookCustomEvents",
      "data-events" => Jason.encode!(List.wrap(events)),
      "data-target-selector" => Keyword.get(opts, :target_selector)
    }

    attrs
    |> Enum.reject(fn {_key, value} -> is_nil(value) or value == "" end)
    |> Map.new()
  end

  def assign_event(socket, event, payload) do
    Phoenix.Component.assign(socket, :last_event, %{event: event, payload: payload})
  end

  def assign_payload_state(socket, payload) do
    detail = payload["detail"] || %{}

    value = first_present(payload, detail, ["value"])
    checked = first_present(payload, detail, ["checked", "toggled"])

    socket
    |> maybe_assign(:value, value)
    |> maybe_assign(:checked, checked)
  end

  defp maybe_assign(socket, _key, nil), do: socket
  defp maybe_assign(socket, key, value), do: Phoenix.Component.assign(socket, key, value)

  defp first_present(payload, detail, keys) do
    case fetch_first(payload, keys) do
      {:found, value} ->
        value

      :not_found ->
        case fetch_first(detail, keys) do
          {:found, value} -> value
          :not_found -> nil
        end
    end
  end

  defp fetch_first(map, keys) do
    Enum.reduce_while(keys, :not_found, fn key, acc ->
      if is_map(map) and Map.has_key?(map, key) do
        {:halt, {:found, Map.get(map, key)}}
      else
        {:cont, acc}
      end
    end)
  end

  attr :state, :map, default: %{}
  attr :last_event, :map, default: nil
  attr :title, :string, default: "State"
  attr :pretty, :boolean, default: false

  def event_panel(assigns) do
    assigns =
      assign(assigns, :inspect_opts,
        if(assigns.pretty, do: [pretty: true, limit: :infinity], else: [])
      )

    ~H"""
    <div class="psb-interactivity-panel">
      <h4>{@title}</h4>
      <pre class="psb-event-state"><%= inspect(@state, @inspect_opts) %></pre>
      <%= if @last_event do %>
        <h4>Last event</h4>
        <pre class="psb-event-log"><%= inspect(@last_event, @inspect_opts) %></pre>
      <% end %>
    </div>
    """
  end
end
