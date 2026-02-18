defmodule Storybook.CodeGen.CoreComponents.Calloutnotification do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.callout_notification/1,
    component_module: Graphene.CoreComponents,
    component_name: :callout_notification
end
