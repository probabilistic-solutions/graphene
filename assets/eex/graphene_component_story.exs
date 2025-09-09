defmodule Storybook.CodeGen.<%= @module %>.<%= Graphene.CodeGen.Util.snake2pascal @component %> do
  use Graphene.CodeGen.Component.Story, func: &Graphene.<%= @module %>.<%= @component %>/1
end
