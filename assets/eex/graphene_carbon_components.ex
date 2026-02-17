defmodule <%= assigns[:module] %> do
  @moduledoc """
  High-level Carbon components built on top of Graphene.CoreComponents.

  These wrappers avoid direct use of <cds-*> tags and expose a single
  namespace for Carbon web components.
  """

  use Phoenix.Component

  alias Graphene.CoreComponents
  alias Graphene.CarbonComponents.DataTableComponent

  <%= assigns[:wrappers] %>

  <%= assigns[:custom_components] %>
end
