defmodule Storybook.CodeGen.CoreComponents.Modalfooterbutton do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.modal_footer_button/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :modal_footer_button
end
