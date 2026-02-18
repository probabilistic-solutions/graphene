defmodule Storybook.CodeGen.CoreComponents.Tablebatchactions do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.table_batch_actions/1,
    component_module: Graphene.CoreComponents,
    component_name: :table_batch_actions
end
