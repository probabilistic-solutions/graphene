defmodule Storybook.CodeGen.CoreComponents.Containedlist do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.contained_list/1,
    component_module: Graphene.CoreComponents,
    component_name: :contained_list
end
