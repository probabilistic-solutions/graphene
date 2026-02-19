defmodule Storybook.CodeGen.CoreComponents.Timepicker do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.time_picker/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :time_picker
end
