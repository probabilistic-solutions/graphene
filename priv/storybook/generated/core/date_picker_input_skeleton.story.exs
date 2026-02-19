defmodule Storybook.CodeGen.CoreComponents.Datepickerinputskeleton do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.date_picker_input_skeleton/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :date_picker_input_skeleton
end
