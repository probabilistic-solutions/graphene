defmodule Storybook.CodeGen.CoreComponents.Datepicker do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.date_picker/1,
    component_module: Graphene.CoreComponents,
    component_name: :date_picker
end
