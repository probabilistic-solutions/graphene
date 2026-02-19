defmodule Graphene.CarbonComponents.Pagination do
  @moduledoc false

  use Phoenix.Component

  alias Graphene.Internal.CoreComponents

  @doc """
  Component `<cds-pagination>` from `./src/components/pagination/pagination.ts`

  Pagination UI.

  ## Events

  * `cds-pagination-changed-current` - The custom event fired after the current page is changed from `<cds-pages-select>`.
  * `cds-page-sizes-select-changed` - The custom event fired after the number of rows per page is changed from `<cds-page-sizes-select>`.

  """
  attr :backward_text, :string,
    doc: "The assistive text for the button to go to previous page.",
    default: "Previous page"

  attr :disabled, :boolean, doc: "`true` if the pagination UI should be disabled."

  attr :forward_text, :string,
    doc: "The assistive text for the button to go to next page.",
    default: "Next page"

  attr :is_last_page, :boolean, doc: "`true` to explicitly state that user is at the last page."

  attr :items_per_page_text, :string,
    doc: "The translatable text indicating the number of items per page.",
    default: "Items per page:"

  attr :page, :string, doc: "The current page", default: "1"

  attr :page_input_disabled, :boolean,
    doc: "true if the select box to change the page should be disabled."

  attr :page_size, :string, doc: "Number of items per page.", default: "10"

  attr :page_size_input_disabled, :any,
    doc: "true if the select box to change the items per page should be disabled."

  attr :page_size_label_text, :string, doc: "The label text for the UI to select page size."
  attr :pages_unknown, :boolean, doc: "true if the total number of items is unknown."

  attr :size, :string,
    doc: "Specify the size of the Pagination.",
    values: ["sm", "md", "lg"],
    default: "md"

  attr :start, :string,
    doc: "The row number where current page start with, index that starts with zero.",
    default: "0"

  attr :total_items, :string, doc: "The number of total items."
  attr :total_pages, :string, doc: "The number of total pages.", default: "1"
  attr :rest, :global
  slot :page_sizes_select, doc: "Where to put in the `<page-sizes-select>`."
  slot :inner_block

  def pagination(assigns) do
    CoreComponents.pagination(assigns)
  end
end
