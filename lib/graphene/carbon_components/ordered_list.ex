defmodule Graphene.CarbonComponents.OrderedList do
  @moduledoc false

  use Phoenix.Component

  alias Graphene.Internal.CoreComponents

  @doc """
  Component `<cds-ordered-list>` from `./src/components/list/ordered-list.ts`

  Ordered list.


  """
  attr :is_expressive, :boolean, doc: "`true` if expressive theme enabled."

  attr :native, :boolean,
    doc:
      "Specify whether the ordered list should use native list styles instead of\ncustom counter"

  attr :nested, :boolean, doc: "Specify whether the list is nested, or not"
  attr :rest, :global

  slot :item do
    attr :attrs, :map
  end

  slot :inner_block

  def ordered_list(%{item: [_ | _]} = assigns) do
    assigns =
      assigns
      |> assign_new(:is_expressive, fn -> false end)
      |> assign_new(:native, fn -> false end)
      |> assign_new(:nested, fn -> false end)

    ~H"""
    <CoreComponents.ordered_list
      is_expressive={@is_expressive}
      native={@native}
      nested={@nested}
      {@rest}
    >
      <%= for item <- @item do %>
        <CoreComponents.list_item {item[:attrs] || %{}}>
          {render_slot(item)}
        </CoreComponents.list_item>
      <% end %>
      {render_slot(@inner_block)}
    </CoreComponents.ordered_list>
    """
  end

  def ordered_list(assigns) do
    CoreComponents.ordered_list(assigns)
  end
end
