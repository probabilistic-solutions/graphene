defmodule Storybook.CodeGen.CoreComponents.Operationaltag do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.operational_tag/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :operational_tag
end
