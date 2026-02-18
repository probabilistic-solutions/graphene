defmodule Storybook.CodeGen.CoreComponents.Modalfooter do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.modal_footer/1,
    component_module: Graphene.CoreComponents,
    component_name: :modal_footer
end
