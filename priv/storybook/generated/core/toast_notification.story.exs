defmodule Storybook.CodeGen.CoreComponents.Toastnotification do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.toast_notification/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :toast_notification
end
