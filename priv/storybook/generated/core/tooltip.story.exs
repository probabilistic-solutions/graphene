defmodule Storybook.CodeGen.CoreComponents.Tooltip do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.tooltip/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :tooltip
end
