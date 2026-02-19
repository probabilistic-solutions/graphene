defmodule Storybook.CodeGen.CoreComponents.Unorderedlist do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.unordered_list/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :unordered_list
end
