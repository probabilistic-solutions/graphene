defmodule Storybook.CodeGen.CoreComponents.Tabs do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.tabs/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :tabs
end
