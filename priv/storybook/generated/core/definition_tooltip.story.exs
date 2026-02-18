defmodule Storybook.CodeGen.CoreComponents.Definitiontooltip do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.definition_tooltip/1,
    component_module: Graphene.CoreComponents,
    component_name: :definition_tooltip
end
