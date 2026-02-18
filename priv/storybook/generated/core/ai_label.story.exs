defmodule Storybook.CodeGen.CoreComponents.Ailabel do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.ai_label/1,
    component_module: Graphene.CoreComponents,
    component_name: :ai_label
end
