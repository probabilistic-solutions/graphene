defmodule Storybook.CodeGen.CoreComponents.Checkboxgroup do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.checkbox_group/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :checkbox_group
end
