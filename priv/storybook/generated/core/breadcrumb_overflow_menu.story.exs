defmodule Storybook.CodeGen.CoreComponents.Breadcrumboverflowmenu do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.breadcrumb_overflow_menu/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :breadcrumb_overflow_menu
end
