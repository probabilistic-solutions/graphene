defmodule Storybook.CodeGen.CoreComponents.Sidenavdivider do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.side_nav_divider/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :side_nav_divider
end
