defmodule Storybook.CodeGen.CoreComponents.Inlineloading do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.inline_loading/1,
    component_module: Graphene.CoreComponents,
    component_name: :inline_loading
end
