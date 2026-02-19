defmodule Storybook.CodeGen.CoreComponents.Timepickerselect do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.time_picker_select/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :time_picker_select
end
