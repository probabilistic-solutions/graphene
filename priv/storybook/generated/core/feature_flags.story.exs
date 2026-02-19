defmodule Storybook.CodeGen.CoreComponents.Featureflags do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.feature_flags/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :feature_flags
end
