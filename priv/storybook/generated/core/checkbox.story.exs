defmodule Storybook.CodeGen.CoreComponents.Checkbox do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.checkbox/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :checkbox
end
