defmodule Storybook.CodeGen.CoreComponents.Selectabletag do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.selectable_tag/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :selectable_tag
end
