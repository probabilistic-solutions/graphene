defmodule Storybook.CodeGen.CoreComponents.Tablebatchactions do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.table_batch_actions/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :table_batch_actions
end
