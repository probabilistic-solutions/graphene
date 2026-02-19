defmodule Storybook.CodeGen.CoreComponents.Slugactionbutton do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.slug_action_button/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :slug_action_button
end
