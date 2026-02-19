defmodule Storybook.CodeGen.CoreComponents.Dropdownskeleton do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.dropdown_skeleton/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :dropdown_skeleton
end
