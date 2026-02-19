defmodule Storybook.CodeGen.CoreComponents.Formgroup do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.form_group/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :form_group
end
