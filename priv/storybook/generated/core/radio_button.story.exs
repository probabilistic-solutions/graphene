defmodule Storybook.CodeGen.CoreComponents.Radiobutton do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.radio_button/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :radio_button
end
