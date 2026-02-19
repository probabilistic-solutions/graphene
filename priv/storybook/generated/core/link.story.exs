defmodule Storybook.CodeGen.CoreComponents.Link do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.StorybookAliases.core_link/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :link
end
