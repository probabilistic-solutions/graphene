defmodule <%= assigns[:module] %> do
  @moduledoc false

  use Phoenix.Component

  alias Graphene.CoreComponents

  <%= assigns[:helpers] %>

  <%= assigns[:wrappers] %>
end
