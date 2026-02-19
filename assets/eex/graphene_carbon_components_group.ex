defmodule <%= assigns[:module] %> do
  @moduledoc false

  use Phoenix.Component

<%= assigns[:aliases] %>

  <%= assigns[:wrappers] %>
end
