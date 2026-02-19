defmodule Storybook.CodeGen.CoreComponents.Skiptocontent do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.skip_to_content/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :skip_to_content
end
