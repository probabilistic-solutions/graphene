defmodule Storybook.CodeGen.CoreComponents.Formitem do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.form_item/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :form_item
end
