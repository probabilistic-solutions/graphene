defmodule Storybook.CodeGen.CoreComponents.Orderedlist do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.ordered_list/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :ordered_list
end
