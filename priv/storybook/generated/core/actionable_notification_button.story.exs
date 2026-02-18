defmodule Storybook.CodeGen.CoreComponents.Actionablenotificationbutton do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.actionable_notification_button/1,
    component_module: Graphene.CoreComponents,
    component_name: :actionable_notification_button
end
