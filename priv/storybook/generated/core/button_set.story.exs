defmodule Storybook.CodeGen.CoreComponents.Buttonset do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.button_set/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :button_set
end
