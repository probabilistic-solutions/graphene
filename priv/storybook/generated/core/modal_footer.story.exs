defmodule Storybook.CodeGen.CoreComponents.Modalfooter do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.modal_footer/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :modal_footer
end
