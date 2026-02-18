defmodule Storybook.CodeGen.CoreComponents.Toastnotification do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.toast_notification/1,
    component_module: Graphene.CoreComponents,
    component_name: :toast_notification
end
