defmodule Storybook.CodeGen.CoreComponents.Actionablenotification do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.actionable_notification/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :actionable_notification
end
