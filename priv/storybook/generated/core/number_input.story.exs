defmodule Storybook.CodeGen.CoreComponents.Numberinput do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.number_input/1,
    component_module: Graphene.CoreComponents,
    component_name: :number_input
end
