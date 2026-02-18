defmodule Storybook.CodeGen.CoreComponents.Heading do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.heading/1,
    component_module: Graphene.CoreComponents,
    component_name: :heading
end
