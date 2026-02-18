defmodule Storybook.CodeGen.CoreComponents.Headername do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.header_name/1,
    component_module: Graphene.CoreComponents,
    component_name: :header_name
end
