defmodule Storybook.CodeGen.CoreComponents.Passwordinputskeleton do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.password_input_skeleton/1,
    component_module: Graphene.CoreComponents,
    component_name: :password_input_skeleton
end
