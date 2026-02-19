defmodule Storybook.CodeGen.CoreComponents.Treenode do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.tree_node/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :tree_node
end
