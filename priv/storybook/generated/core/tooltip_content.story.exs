defmodule Storybook.CodeGen.CoreComponents.Tooltipcontent do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.tooltip_content/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :tooltip_content
end
