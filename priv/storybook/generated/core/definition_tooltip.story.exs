defmodule Storybook.CodeGen.CoreComponents.Definitiontooltip do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.definition_tooltip/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :definition_tooltip
end
