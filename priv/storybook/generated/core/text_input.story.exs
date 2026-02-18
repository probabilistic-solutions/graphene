defmodule Storybook.CodeGen.CoreComponents.Textinput do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.text_input/1,
    component_module: Graphene.CoreComponents,
    component_name: :text_input
end
