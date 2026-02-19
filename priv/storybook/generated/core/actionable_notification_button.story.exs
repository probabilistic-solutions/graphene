defmodule Storybook.CodeGen.CoreComponents.Actionablenotificationbutton do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.actionable_notification_button/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :actionable_notification_button
end
