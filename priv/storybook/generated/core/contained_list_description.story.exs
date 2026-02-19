defmodule Storybook.CodeGen.CoreComponents.Containedlistdescription do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.contained_list_description/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :contained_list_description
end
