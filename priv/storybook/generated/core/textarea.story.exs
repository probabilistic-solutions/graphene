defmodule Storybook.CodeGen.CoreComponents.Textarea do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.textarea/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :textarea
end
