defmodule DemoWeb.ComponentCatalogLive do
  use DemoWeb, :live_view

  alias Graphene.Icons

  @impl true
  def mount(_params, _session, socket) do
    components = build_component_list()
    default_component = default_component(components)

    {:ok,
     assign(socket,
       active_page: :components,
       page_title: "Component Catalog · Nimbus Cloud",
       components: components,
        selected_name: Atom.to_string(default_component.name),
        query: "",
        filter_form: to_form(%{"query" => ""}, as: :filter)
     )}
  end

  @impl true
  def handle_event("filter", %{"filter" => %{"query" => query}}, socket) do
    {:noreply,
     assign(socket,
       query: query,
       filter_form: to_form(%{"query" => query}, as: :filter)
     )}
  end

  def handle_event("select_component", %{"name" => name}, socket) do
    {:noreply, assign(socket, :selected_name, name)}
  end

  @impl true
  def render(assigns) do
    filtered = filter_components(assigns.components, assigns.query)
    selected =
      Enum.find(filtered, fn component ->
        Atom.to_string(component.name) == assigns.selected_name
      end) || List.first(filtered)

    assigns =
      assigns
      |> assign(:filtered_components, filtered)
      |> assign(:component_count, length(filtered))
      |> assign(:selected_component, selected)

    ~H"""
    <.grid full_width>
      <:column span="16">
        <.page_header>
          <:breadcrumb>
            <.breadcrumb>
              <:item href={~p"/demo"} text="Cloud Admin" />
              <:item text="Component Catalog" />
            </.breadcrumb>
          </:breadcrumb>
          <:content title="Component Catalog">
            <.tag type="cool-gray">Carbon</.tag>
          </:content>
          <:content_text subtitle="Rendered coverage for every Carbon wrapper in Graphene." />
        </.page_header>
      </:column>

      <:column span="16">
        <div class="demo-section demo-card">
          <div class="demo-page-grid">
            <div>
              <p class="demo-muted">
                Showing {@component_count} components. Use the filter to narrow the list.
              </p>
              <.form for={@filter_form} phx-change="filter">
                <.search
                  field={@filter_form[:query]}
                  label_text="Filter components"
                  placeholder="Search by name"
                />
              </.form>
              <div class="demo-section demo-component-list">
                <%= for component <- @filtered_components do %>
                  <.button
                    kind={
                      if Atom.to_string(component.name) == @selected_name,
                        do: "primary",
                        else: "ghost"
                    }
                    size="sm"
                    type="button"
                    phx-click="select_component"
                    phx-value-name={component.name}
                  >
                    {component.label}
                  </.button>
                <% end %>
              </div>
            </div>
            <div :if={@selected_component}>
              <div class="demo-component-header">
                <h4>{@selected_component.label}</h4>
                <.tag type="cool-gray">:<%= @selected_component.name %></.tag>
              </div>
              <div class="demo-component-preview">
                <%= component_preview(@selected_component) %>
              </div>
            </div>
          </div>
        </div>
      </:column>

      <:column span="16">
        <div class="demo-section demo-card demo-shell-note">
          <Icons.icon name="document" size={16} />
          <span>
            This catalog uses generated defaults to render each component once for visual QA.
          </span>
        </div>
      </:column>
    </.grid>
    """
  end

  defp build_component_list do
    Graphene.CarbonComponents.__components__()
    |> Enum.map(fn {name, meta} ->
      label = humanize(name)

      %{
        name: name,
        label: label,
        label_downcase: String.downcase(label),
        meta: meta
      }
    end)
    |> Enum.sort_by(& &1.label)
  end

  defp default_component(components) do
    Enum.find(components, fn component -> component.name == :button end) || List.first(components)
  end

  defp filter_components(components, query) do
    query = query |> to_string() |> String.trim() |> String.downcase()

    if query == "" do
      components
    else
      Enum.filter(components, fn component ->
        String.contains?(component.label_downcase, query) or
          String.contains?(Atom.to_string(component.name), query)
      end)
    end
  end

  defp component_preview(%{name: name, meta: meta}) do
    assigns = build_assigns(name, meta)
    apply(Graphene.CarbonComponents, name, [assigns])
  end

  defp build_assigns(:data_table, meta) do
    base = build_assigns_base(:data_table, meta)

    rows = [
      %{id: "row-1", name: "Aurora", status: "Healthy", owner: "Platform"},
      %{id: "row-2", name: "Helix", status: "Degraded", owner: "Experience"}
    ]

    cols = [
      %{label: "Name", inner_block: fn _changed, row -> row.name end},
      %{label: "Status", inner_block: fn _changed, row -> row.status end},
      %{label: "Owner", inner_block: fn _changed, row -> row.owner end}
    ]

    base
    |> Map.put(:id, "catalog-data-table")
    |> Map.put(:rows, rows)
    |> Map.put(:col, cols)
  end

  defp build_assigns(name, meta) do
    build_assigns_base(name, meta)
  end

  defp build_assigns_base(name, meta) do
    base = %{__changed__: %{}}

    base =
      if Enum.any?(meta.attrs, &(&1.name == :rest)) do
        Map.put(base, :rest, %{})
      else
        base
      end

    base =
      Enum.reduce(meta.attrs, base, fn attr, acc ->
        if attr.required do
          Map.put(acc, attr.name, attr_value(attr, name, nil, 1))
        else
          acc
        end
      end)

    base =
      base
      |> maybe_put_named_attr(:name, meta, name)
      |> maybe_put_named_attr(:id, meta, name)

    Enum.reduce(meta.slots, base, fn slot, acc ->
      Map.put(acc, slot.name, slot_entries(slot, name))
    end)
  end

  defp maybe_put_named_attr(assigns, attr_name, meta, component_name) do
    attr =
      Enum.find(meta.attrs, fn meta_attr ->
        meta_attr.name == attr_name
      end)

    cond do
      is_nil(attr) -> assigns
      Map.has_key?(assigns, attr_name) -> assigns
      true -> Map.put(assigns, attr_name, attr_value(attr, component_name, nil, 1))
    end
  end

  defp slot_entries(slot, component_name) do
    [build_slot_entry(slot, component_name, 1)]
  end

  defp build_slot_entry(slot, component_name, index) do
    slot_attrs =
      Enum.reduce(slot.attrs, %{}, fn attr, acc ->
        if attr.required or attr.name in [:label, :text, :title, :value, :name, :href] do
          Map.put(acc, attr.name, attr_value(attr, component_name, slot.name, index))
        else
          acc
        end
      end)

    Map.merge(slot_attrs, %{
      inner_block: slot_inner_block(slot, component_name, index),
      __slot__: slot.name
    })
  end

  defp slot_inner_block(slot, component_name, index) do
    label = "#{humanize(slot.name)} #{index}"

    fn _changed, _argument ->
      case {component_name, slot.name} do
        {:breadcrumb, :item} -> label
        _ -> label
      end
    end
  end

  defp attr_value(%{opts: opts} = attr, component_name, slot_name, index) do
    with values when is_list(values) <- Keyword.get(opts, :values),
         value when not is_nil(value) <- Enum.find(values, &(!is_nil(&1))) do
      value
    else
      _ ->
        case Keyword.get(opts, :default) do
          nil ->
            case {component_name, attr.name, slot_name} do
              {:icon, :name, _} ->
                Icons.available_icons() |> List.first() || "cloud"

              {_, :name, :icon} ->
                Icons.available_icons() |> List.first() || "cloud"

              _ ->
                case attr.name do
                  :id -> "demo-#{component_name}"
                  :rows -> [%{id: "row-1", name: "Row 1"}]
                  :href -> "#"
                  :name -> "#{component_name}-#{slot_name || "attr"}-#{index}"
                  :value -> "value-#{index}"
                  :label -> "#{humanize(slot_name || component_name)} #{index}"
                  :title -> "#{humanize(component_name)} #{index}"
                  :text -> "#{humanize(component_name)}"
                  :placeholder -> "#{humanize(component_name)}"
                  _ -> fallback_attr_value(attr, index)
                end
            end

          default ->
            default
        end
    end
  end

  defp fallback_attr_value(%{type: :boolean}, _index), do: true
  defp fallback_attr_value(%{type: :integer}, index), do: index
  defp fallback_attr_value(%{type: :float}, _index), do: 0.5
  defp fallback_attr_value(%{type: :list}, _index), do: []
  defp fallback_attr_value(%{type: :map}, _index), do: %{}
  defp fallback_attr_value(%{type: :any}, _index), do: "demo"
  defp fallback_attr_value(%{type: :string}, _index), do: "demo"
  defp fallback_attr_value(_attr, _index), do: "demo"

  defp humanize(value) when is_atom(value) do
    value
    |> Atom.to_string()
    |> humanize()
  end

  defp humanize(value) when is_binary(value) do
    value
    |> String.replace("_", " ")
    |> String.split()
    |> Enum.map(&String.capitalize/1)
    |> Enum.join(" ")
  end
end
