defmodule Storybook.CodeGen.CoreComponents.Featureflags do
  use Graphene.CodeGen.Component.Story, func: &Graphene.CoreComponents.feature_flags/1
end
