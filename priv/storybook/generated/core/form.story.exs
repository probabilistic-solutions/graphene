defmodule Storybook.CodeGen.CoreComponents.Form do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.StorybookAliases.core_form/1,
    component_module: Graphene.CoreComponents,
    component_name: :form
end
