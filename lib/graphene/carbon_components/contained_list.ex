defmodule Graphene.CarbonComponents.ContainedList do
  @moduledoc false

  use Phoenix.Component

  alias Graphene.Internal.CoreComponents

  @doc """
  Component `<cds-contained-list>` from `./src/components/contained-list/contained-list.ts`

  Contained list.


  """
  attr :is_inset, :boolean,
    doc: "Specify whether the dividing lines in between list items should be inset."

  attr :kind, :any, doc: "The kind of ContainedList you want to display"
  attr :size, :any, doc: "Specify the size of the contained list."
  attr :rest, :global
  slot :action, doc: "The action slot for interactive elements in header"
  slot :label, doc: "The label text"

  slot :item do
    attr :clickable, :boolean
    attr :disabled, :boolean
  end

  slot :inner_block

  def contained_list(%{item: [_ | _]} = assigns) do
    assigns =
      assigns
      |> assign_new(:is_inset, fn -> false end)
      |> assign_new(:kind, fn -> nil end)
      |> assign_new(:size, fn -> nil end)

    ~H"""
    <CoreComponents.contained_list
      is_inset={@is_inset}
      kind={@kind}
      size={@size}
      {@rest}
    >
      <.dynamic_tag :for={label <- @label} tag_name={Map.get(label, :tag, "div")} slot="label">
        {render_slot(label)}
      </.dynamic_tag>
      <.dynamic_tag :for={action <- @action} tag_name={Map.get(action, :tag, "div")} slot="action">
        {render_slot(action)}
      </.dynamic_tag>
      <%= for item <- @item do %>
        <CoreComponents.contained_list_item
          clickable={item[:clickable]}
          disabled={item[:disabled]}
        >
          {render_slot(item)}
        </CoreComponents.contained_list_item>
      <% end %>
    </CoreComponents.contained_list>
    """
  end

  def contained_list(assigns) do
    CoreComponents.contained_list(assigns)
  end

  @doc """
  Component `<cds-contained-list-description>` from `./src/components/contained-list/contained-list-description.ts`

  Contained list description text.


  """
  attr :rest, :global
  slot :inner_block

  def contained_list_description(assigns) do
    CoreComponents.contained_list_description(assigns)
  end

  @doc """
  Component `<cds-contained-list-item>` from `./src/components/contained-list/contained-list-item.ts`

  Contained list item.

  ## Events

  * `cds-contained-list-item-click` - Fires when clickable item is clicked

  """
  attr :clickable, :boolean, doc: "Whether this item is clickable"
  attr :disabled, :boolean, doc: "Whether this item is disabled."
  attr :rest, :global
  slot :action, doc: "The action slot for interactive elements"
  slot :icon, doc: "The icon slot for rendering an icon"
  slot :inner_block

  def contained_list_item(assigns) do
    CoreComponents.contained_list_item(assigns)
  end
end
