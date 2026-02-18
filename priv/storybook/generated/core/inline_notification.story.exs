defmodule Storybook.CodeGen.CoreComponents.Inlinenotification do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.inline_notification/1,
    component_module: Graphene.CoreComponents,
    component_name: :inline_notification
end
