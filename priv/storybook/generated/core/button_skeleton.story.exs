defmodule Storybook.CodeGen.CoreComponents.Buttonskeleton do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.button_skeleton/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :button_skeleton
end
