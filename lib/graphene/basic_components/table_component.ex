defmodule Graphene.BasicComponents.TableComponent do
  @moduledoc false

  use Phoenix.LiveComponent

  alias Graphene.CoreComponents

  @impl true
  def update(assigns, socket) do
    socket =
      socket
      |> assign(assigns)
      |> assign_new(:selected_ids, fn -> [] end)
      |> assign_new(:table_id, fn -> assigns.id end)
      |> assign_new(:selection_name, fn ->
        "#{Map.get(assigns, :table_id, assigns.id)}-selection"
      end)
      |> assign_new(:selection_label, fn -> "Select row" end)
      |> assign_new(:selectable, fn -> false end)
      |> assign_new(:sortable, fn -> false end)
      |> assign_new(:on_row_selected, fn -> nil end)
      |> assign_new(:on_row_all_selected, fn -> nil end)
      |> assign_new(:on_sorted, fn -> nil end)
      |> assign_new(:on_filtered, fn -> nil end)
      |> assign_new(:on_search, fn -> nil end)
      |> assign_new(:on_batch_cancel, fn -> nil end)
      |> assign_new(:row_item, fn -> &Function.identity/1 end)
      |> assign_new(:row_click, fn -> nil end)
      |> assign_new(:row_id, fn -> nil end)
      |> assign_new(:action, fn -> [] end)
      |> assign_new(:col, fn -> [] end)

    {:ok, socket}
  end

  @impl true
  def render(assigns) do
    assigns =
      assigns
      |> assign(:selected_set, selected_set(assigns.selected_ids))
      |> assign(:effective_selectable, effective_selectable?(assigns))
      |> assign(:effective_sortable, effective_sortable?(assigns))

    ~H"""
    <div id={@id}>
      <CoreComponents.table
        use_zebra_styles={true}
        is_selectable={@effective_selectable}
        is_sortable={@effective_sortable}
        phx-hook="BasicComponentsTable"
        phx-target={@myself}
      >
        <CoreComponents.table_head>
          <CoreComponents.table_header_row
            selection_name={@effective_selectable && @selection_name}
            selection_label={@effective_selectable && "Select all"}
          >
            <CoreComponents.table_header_cell
              :for={{col, index} <- Enum.with_index(@col)}
              is_sortable={@effective_sortable}
              data-col-index={index}
            >
              {col[:label]}
            </CoreComponents.table_header_cell>
            <CoreComponents.table_header_cell :if={@action != []}>
              <span class="sr-only">Actions</span>
            </CoreComponents.table_header_cell>
          </CoreComponents.table_header_row>
        </CoreComponents.table_head>
        <CoreComponents.table_body
          id={@table_id}
          phx-update={is_struct(@rows, Phoenix.LiveView.LiveStream) && "stream"}
        >
          <CoreComponents.table_row
            :for={{row, index} <- Enum.with_index(@rows)}
            id={row_dom_id(@row_id, row)}
            data-row-id={row_key_string(@row_id, row, index)}
            selected={row_selected?(@selected_set, @row_id, row, index)}
            selection_name={@effective_selectable && @selection_name}
            selection_value={@effective_selectable && row_key_string(@row_id, row, index)}
            selection_label={@effective_selectable && @selection_label}
          >
            <CoreComponents.table_cell
              :for={col <- @col}
              phx-click={@row_click && @row_click.(row)}
            >
              <CoreComponents.table_cell_content>
                {render_slot(col, @row_item.(row))}
              </CoreComponents.table_cell_content>
            </CoreComponents.table_cell>
            <CoreComponents.table_cell :if={@action != []}>
              <div>
                <%= for action <- @action do %>
                  {render_slot(action, @row_item.(row))}
                <% end %>
              </div>
            </CoreComponents.table_cell>
          </CoreComponents.table_row>
        </CoreComponents.table_body>
      </CoreComponents.table>
    </div>
    """
  end

  @impl true
  def handle_event("graphene:table-row-selected", payload, socket) do
    socket = maybe_update_selected(socket, payload)
    socket = apply_callback(socket, socket.assigns.on_row_selected, payload)
    {:noreply, socket}
  end

  @impl true
  def handle_event("graphene:table-row-all-selected", payload, socket) do
    socket = maybe_update_selected(socket, payload)
    socket = apply_callback(socket, socket.assigns.on_row_all_selected, payload)
    {:noreply, socket}
  end

  @impl true
  def handle_event("graphene:table-sorted", payload, socket) do
    socket = apply_callback(socket, socket.assigns.on_sorted, payload)
    {:noreply, socket}
  end

  @impl true
  def handle_event("graphene:table-filtered", payload, socket) do
    socket = apply_callback(socket, socket.assigns.on_filtered, payload)
    {:noreply, socket}
  end

  @impl true
  def handle_event("graphene:table-search-input", payload, socket) do
    socket = apply_callback(socket, socket.assigns.on_search, payload)
    {:noreply, socket}
  end

  @impl true
  def handle_event("graphene:table-batch-cancel", payload, socket) do
    socket =
      if effective_selectable?(socket.assigns) do
        assign(socket, :selected_ids, [])
      else
        socket
      end

    socket = apply_callback(socket, socket.assigns.on_batch_cancel, payload)
    {:noreply, socket}
  end

  defp effective_selectable?(assigns) do
    assigns.selectable ||
      assigns.selected_ids != [] ||
      is_function(assigns.on_row_selected) ||
      is_function(assigns.on_row_all_selected)
  end

  defp effective_sortable?(assigns) do
    assigns.sortable || is_function(assigns.on_sorted)
  end

  defp maybe_update_selected(socket, %{"selected_ids" => ids}) when is_list(ids) do
    if effective_selectable?(socket.assigns) do
      assign(socket, :selected_ids, Enum.map(ids, &to_string/1))
    else
      socket
    end
  end

  defp maybe_update_selected(socket, _payload), do: socket

  defp selected_set(ids) do
    ids
    |> Enum.map(&to_string/1)
    |> MapSet.new()
  end

  defp row_key(row_id_fun, row, index) do
    key =
      cond do
        is_function(row_id_fun, 1) -> row_id_fun.(row)
        true -> index
      end

    if is_nil(key), do: index, else: key
  end

  defp row_key_string(row_id_fun, row, index) do
    row_id_fun
    |> row_key(row, index)
    |> to_string()
  end

  defp row_dom_id(row_id_fun, row) do
    case row_id_fun do
      fun when is_function(fun, 1) ->
        case fun.(row) do
          nil -> nil
          value -> to_string(value)
        end

      _ ->
        nil
    end
  end

  defp row_selected?(selected_set, row_id_fun, row, index) do
    MapSet.member?(selected_set, row_key_string(row_id_fun, row, index))
  end

  defp apply_callback(socket, nil, _payload), do: socket

  defp apply_callback(socket, fun, payload) when is_function(fun, 2) do
    normalize_callback_result(fun.(payload, socket), socket)
  end

  defp apply_callback(socket, fun, payload) when is_function(fun, 1) do
    normalize_callback_result(fun.(payload), socket)
  end

  defp apply_callback(socket, _fun, _payload), do: socket

  defp normalize_callback_result({:noreply, %Phoenix.LiveView.Socket{} = sock}, _socket), do: sock
  defp normalize_callback_result(%Phoenix.LiveView.Socket{} = sock, _socket), do: sock
  defp normalize_callback_result(%{} = assigns, socket), do: assign(socket, assigns)
  defp normalize_callback_result(_, socket), do: socket
end
