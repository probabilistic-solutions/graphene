defmodule Storybook.CodeGen.CoreComponents.Popovercontent do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.popover_content/1,
    component_module: Graphene.CoreComponents,
    component_name: :popover_content
end
