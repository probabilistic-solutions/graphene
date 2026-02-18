defmodule <%= @module %> do
  @moduledoc false

  use Phoenix.Component

  def version(), do: ~S|<%= @version %>|

  <%= for component <- @components do %>
  <%= Graphene.CodeGen.Component.display component %>
  <% end %>

  def available_components() do
    [<%= for component <- @components do %><%= inspect(component.componentname) %>, <% end %>]
  end
end
