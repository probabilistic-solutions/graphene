defmodule Graphene.Components do
  @moduledoc """
  Carbon-first component facade.

  Usage:

      use Graphene.Components
  """

  defmacro __using__(_opts) do
    quote do
      import Graphene.CarbonComponents
      alias Graphene.CarbonComponents
    end
  end
end
