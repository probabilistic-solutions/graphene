defmodule Storybook.CodeGen.CoreComponents.Selectabletag do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.selectable_tag/1,
    component_module: Graphene.CoreComponents,
    component_name: :selectable_tag
end
