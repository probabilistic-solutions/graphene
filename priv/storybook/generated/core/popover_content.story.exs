defmodule Storybook.CodeGen.CoreComponents.Popovercontent do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.popover_content/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :popover_content
end
