defmodule Storybook.CodeGen.CoreComponents.Textinputskeleton do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.text_input_skeleton/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :text_input_skeleton
end
