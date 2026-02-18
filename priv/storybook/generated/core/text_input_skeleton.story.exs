defmodule Storybook.CodeGen.CoreComponents.Textinputskeleton do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.text_input_skeleton/1,
    component_module: Graphene.CoreComponents,
    component_name: :text_input_skeleton
end
