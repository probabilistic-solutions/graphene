defmodule Storybook.CodeGen.CoreComponents.Copybutton do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.copy_button/1,
    component_module: Graphene.CoreComponents,
    component_name: :copy_button
end
