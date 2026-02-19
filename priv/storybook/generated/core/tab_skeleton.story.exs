defmodule Storybook.CodeGen.CoreComponents.Tabskeleton do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.tab_skeleton/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :tab_skeleton
end
