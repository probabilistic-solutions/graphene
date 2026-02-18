defmodule Storybook.CodeGen.CoreComponents.Slugactionbutton do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.slug_action_button/1,
    component_module: Graphene.CoreComponents,
    component_name: :slug_action_button
end
