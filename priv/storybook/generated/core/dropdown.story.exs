defmodule Storybook.CodeGen.CoreComponents.Dropdown do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.dropdown/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :dropdown
end
