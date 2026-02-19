defmodule Storybook.CodeGen.CoreComponents.Accordion do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.accordion/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :accordion
end
