defmodule Storybook.CodeGen.CoreComponents.Chatbutton do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.chat_button/1,
    component_module: Graphene.CoreComponents,
    component_name: :chat_button
end
