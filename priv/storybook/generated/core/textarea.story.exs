defmodule Storybook.CodeGen.CoreComponents.Textarea do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.textarea/1,
    component_module: Graphene.CoreComponents,
    component_name: :textarea
end
