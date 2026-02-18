defmodule Storybook.CodeGen.CoreComponents.Unorderedlist do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.unordered_list/1,
    component_module: Graphene.CoreComponents,
    component_name: :unordered_list
end
