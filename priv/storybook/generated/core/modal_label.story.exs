defmodule Storybook.CodeGen.CoreComponents.Modallabel do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.modal_label/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :modal_label
end
