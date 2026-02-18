defmodule Storybook.CodeGen.CoreComponents.Timepicker do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.time_picker/1,
    component_module: Graphene.CoreComponents,
    component_name: :time_picker
end
