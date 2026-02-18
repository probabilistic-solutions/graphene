defmodule Storybook.CodeGen.CoreComponents.Tooltipcontent do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.tooltip_content/1,
    component_module: Graphene.CoreComponents,
    component_name: :tooltip_content
end
