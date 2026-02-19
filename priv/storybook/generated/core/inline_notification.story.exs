defmodule Storybook.CodeGen.CoreComponents.Inlinenotification do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.inline_notification/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :inline_notification
end
