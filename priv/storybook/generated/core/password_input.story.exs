defmodule Storybook.CodeGen.CoreComponents.Passwordinput do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.password_input/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :password_input
end
