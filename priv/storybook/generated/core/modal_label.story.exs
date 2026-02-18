defmodule Storybook.CodeGen.CoreComponents.Modallabel do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.modal_label/1,
    component_module: Graphene.CoreComponents,
    component_name: :modal_label
end
