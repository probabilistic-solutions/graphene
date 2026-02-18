defmodule Storybook.CodeGen.CoreComponents.Radiobuttonskeleton do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.radio_button_skeleton/1,
    component_module: Graphene.CoreComponents,
    component_name: :radio_button_skeleton
end
