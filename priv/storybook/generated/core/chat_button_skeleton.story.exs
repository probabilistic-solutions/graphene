defmodule Storybook.CodeGen.CoreComponents.Chatbuttonskeleton do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.chat_button_skeleton/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :chat_button_skeleton
end
