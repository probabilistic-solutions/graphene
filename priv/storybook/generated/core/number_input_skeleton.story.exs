defmodule Storybook.CodeGen.CoreComponents.Numberinputskeleton do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.number_input_skeleton/1,
    component_module: Graphene.CoreComponents,
    component_name: :number_input_skeleton
end
