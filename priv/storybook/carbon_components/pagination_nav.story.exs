defmodule Storybook.CarbonComponents.PaginationNav do
  use PhoenixStorybook.Story, :component

  def function, do: &Graphene.CarbonComponents.pagination_nav/1

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{total_items: "105", page_size: "10", page: "1"}
      },
      %Variation{
        id: :small,
        attributes: %{total_items: "42", page_size: "5", page: "2", size: "sm"}
      },
      %Variation{
        id: :unknown,
        attributes: %{pages_unknown: true, page_size: "10", page: "3", total_items: ""}
      }
    ]
  end
end
