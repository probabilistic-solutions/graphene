defmodule Storybook.CodeGen.CoreComponents.Passwordinput do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.password_input/1,
    component_module: Graphene.CoreComponents,
    component_name: :password_input
end
