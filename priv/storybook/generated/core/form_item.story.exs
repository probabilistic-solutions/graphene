defmodule Storybook.CodeGen.CoreComponents.Formitem do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.form_item/1,
    component_module: Graphene.CoreComponents,
    component_name: :form_item
end
