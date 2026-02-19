defmodule Storybook.CodeGen.CoreComponents.Numberinputskeleton do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.number_input_skeleton/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :number_input_skeleton
end
