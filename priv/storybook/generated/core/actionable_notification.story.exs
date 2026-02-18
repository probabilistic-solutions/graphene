defmodule Storybook.CodeGen.CoreComponents.Actionablenotification do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.actionable_notification/1,
    component_module: Graphene.CoreComponents,
    component_name: :actionable_notification
end
