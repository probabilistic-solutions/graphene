defmodule Storybook.CodeGen.CoreComponents.Multiselect do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.multi_select/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :multi_select
end
