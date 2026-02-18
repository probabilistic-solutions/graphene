defmodule Storybook.CodeGen.CoreComponents.Dismissibletag do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.dismissible_tag/1,
    component_module: Graphene.CoreComponents,
    component_name: :dismissible_tag
end
