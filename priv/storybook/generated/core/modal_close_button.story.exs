defmodule Storybook.CodeGen.CoreComponents.Modalclosebutton do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.modal_close_button/1,
    component_module: Graphene.CoreComponents,
    component_name: :modal_close_button
end
