defmodule <%= @module %> do
  @moduledoc false

  use Phoenix.Component

  def version(), do: ~S|<%= @version %>|

  <%= for component <- @components do %>
  <%= Graphene.CodeGen.Component.display component %>
  <% end %>

  defp merge_rest_class(assigns, class_name) do
    rest = Map.get(assigns, :rest, %{})
    class_value = merge_class_value(Map.get(rest, :class), class_name)
    rest = Map.put(rest, :class, class_value)
    assign(assigns, :rest, rest)
  end

  defp merge_rest_class_if(assigns, condition, class_name) do
    if condition, do: merge_rest_class(assigns, class_name), else: assigns
  end

  defp merge_class_value(nil, class_name), do: class_name
  defp merge_class_value("", class_name), do: class_name

  defp merge_class_value(class_value, class_name) when is_list(class_value) do
    class_value
    |> Enum.map(&to_string/1)
    |> Enum.join(" ")
    |> merge_class_value(class_name)
  end

  defp merge_class_value(class_value, class_name) when is_binary(class_value) do
    if String.contains?(class_value, class_name) do
      class_value
    else
      class_value <> " " <> class_name
    end
  end

  defp merge_class_value(_class_value, class_name), do: class_name

  def available_components() do
    [<%= for component <- @components do %><%= inspect(component.componentname) %>, <% end %>]
  end
end
