defmodule Storybook.CodeGen.CoreComponents.Treeview do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.tree_view/1,
    component_module: Graphene.CoreComponents,
    component_name: :tree_view
end
