defmodule Storybook.CodeGen.CoreComponents.Switcherdivider do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.switcher_divider/1,
    component_module: Graphene.CoreComponents,
    component_name: :switcher_divider
end
