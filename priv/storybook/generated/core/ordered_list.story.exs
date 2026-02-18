defmodule Storybook.CodeGen.CoreComponents.Orderedlist do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.ordered_list/1,
    component_module: Graphene.CoreComponents,
    component_name: :ordered_list
end
