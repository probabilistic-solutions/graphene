defmodule Storybook.CodeGen.CoreComponents.Inlineloading do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.inline_loading/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :inline_loading
end
