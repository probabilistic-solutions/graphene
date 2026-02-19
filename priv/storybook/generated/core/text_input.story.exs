defmodule Storybook.CodeGen.CoreComponents.Textinput do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.text_input/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :text_input
end
