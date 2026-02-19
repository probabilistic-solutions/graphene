defmodule Storybook.CodeGen.CoreComponents.Switcher do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.switcher/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :switcher
end
