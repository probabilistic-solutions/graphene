defmodule Storybook.CodeGen.CoreComponents.Treenode do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.tree_node/1,
    component_module: Graphene.CoreComponents,
    component_name: :tree_node
end
