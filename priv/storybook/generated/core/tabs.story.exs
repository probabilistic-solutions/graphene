defmodule Storybook.CodeGen.CoreComponents.Tabs do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.tabs/1,
    component_module: Graphene.CoreComponents,
    component_name: :tabs
end
