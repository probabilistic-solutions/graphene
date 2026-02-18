defmodule Storybook.CodeGen.CoreComponents.Tooltip do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.tooltip/1,
    component_module: Graphene.CoreComponents,
    component_name: :tooltip
end
