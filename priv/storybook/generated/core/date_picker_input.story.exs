defmodule Storybook.CodeGen.CoreComponents.Datepickerinput do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.date_picker_input/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :date_picker_input
end
