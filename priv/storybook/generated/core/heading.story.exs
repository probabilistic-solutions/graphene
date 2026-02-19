defmodule Storybook.CodeGen.CoreComponents.Heading do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.heading/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :heading
end
