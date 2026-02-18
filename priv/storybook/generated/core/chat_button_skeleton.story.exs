defmodule Storybook.CodeGen.CoreComponents.Chatbuttonskeleton do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.chat_button_skeleton/1,
    component_module: Graphene.CoreComponents,
    component_name: :chat_button_skeleton
end
