defmodule Storybook.CodeGen.CoreComponents.Calloutnotification do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.callout_notification/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :callout_notification
end
