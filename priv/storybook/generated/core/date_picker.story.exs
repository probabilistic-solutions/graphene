defmodule Storybook.CodeGen.CoreComponents.Datepicker do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.date_picker/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :date_picker
end
