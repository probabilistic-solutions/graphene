defmodule Storybook.CodeGen.CoreComponents.Chatbutton do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.chat_button/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :chat_button
end
