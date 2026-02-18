defmodule Storybook.CodeGen.CoreComponents.Popover do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.popover/1,
    component_module: Graphene.CoreComponents,
    component_name: :popover
end
