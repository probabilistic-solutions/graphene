defmodule Storybook.CodeGen.CoreComponents.Operationaltag do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.operational_tag/1,
    component_module: Graphene.CoreComponents,
    component_name: :operational_tag
end
