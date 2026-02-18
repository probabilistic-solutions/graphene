defmodule Storybook.CodeGen.CoreComponents.Featureflags do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.feature_flags/1,
    component_module: Graphene.CoreComponents,
    component_name: :feature_flags
end
