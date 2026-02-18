defmodule Storybook.CodeGen.CoreComponents.Datepickerinput do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.date_picker_input/1,
    component_module: Graphene.CoreComponents,
    component_name: :date_picker_input
end
