defmodule Storybook.CodeGen.CoreComponents.Contentswitcher do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.content_switcher/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :content_switcher
end
