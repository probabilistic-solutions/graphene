defmodule <%= assigns[:module] %> do
  @moduledoc """
  Form-aware wrappers for Carbon web components.

  These components bridge Carbon custom change events into native `change`
  events on a hidden input so Phoenix forms can use `phx-change` normally.
  """

  use Phoenix.Component

  alias Graphene.CoreComponents

  <%= assigns[:helpers] %>

  <%= assigns[:wrappers] %>
end
