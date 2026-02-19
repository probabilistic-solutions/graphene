defmodule Storybook.CodeGen.CoreComponents.Containedlist do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.contained_list/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :contained_list
end
