defmodule Storybook.CodeGen.CoreComponents.Formgroup do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.form_group/1,
    component_module: Graphene.CoreComponents,
    component_name: :form_group
end
