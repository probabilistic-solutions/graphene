defmodule Storybook.CodeGen.CoreComponents.Containedlistdescription do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.contained_list_description/1,
    component_module: Graphene.CoreComponents,
    component_name: :contained_list_description
end
