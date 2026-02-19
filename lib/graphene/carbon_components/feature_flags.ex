defmodule Graphene.CarbonComponents.FeatureFlags do
  @moduledoc false

  use Phoenix.Component

  alias Graphene.Internal.CoreComponents

  @doc """
  Component `<feature-flags>` from `./src/components/feature-flags/index.ts`

  Undocumented


  """
  attr :enable_v12_toggle_reduced_label_spacing, :boolean,
    doc: "Enable reduced label spacing for v12 toggle."

  attr :rest, :global
  slot :inner_block

  def feature_flags(assigns) do
    CoreComponents.feature_flags(assigns)
  end
end
