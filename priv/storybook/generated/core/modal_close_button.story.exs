defmodule Storybook.CodeGen.CoreComponents.Modalclosebutton do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.modal_close_button/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :modal_close_button
end
