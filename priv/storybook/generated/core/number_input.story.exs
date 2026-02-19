defmodule Storybook.CodeGen.CoreComponents.Numberinput do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.number_input/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :number_input
end
