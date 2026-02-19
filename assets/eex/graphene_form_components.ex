defmodule <%= assigns[:module] %> do
  @moduledoc false

  use Phoenix.Component

  alias Graphene.Internal.CoreComponents

  <%= assigns[:helpers] %>

  <%= assigns[:wrappers] %>
end
