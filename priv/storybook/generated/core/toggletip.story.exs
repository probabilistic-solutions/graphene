defmodule Storybook.CodeGen.CoreComponents.Toggletip do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.toggletip/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :toggletip
end
