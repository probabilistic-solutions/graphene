defmodule Storybook.CodeGen.CoreComponents.Popover do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.popover/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :popover
end
