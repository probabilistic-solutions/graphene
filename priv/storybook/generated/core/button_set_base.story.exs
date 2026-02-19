defmodule Storybook.CodeGen.CoreComponents.Buttonsetbase do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.button_set_base/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :button_set_base
end
