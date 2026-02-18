defmodule Storybook.CodeGen.CoreComponents.Dropdown do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.dropdown/1,
    component_module: Graphene.CoreComponents,
    component_name: :dropdown
end
