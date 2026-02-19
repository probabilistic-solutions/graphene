defmodule Storybook.CodeGen.CoreComponents.Fileuploaderitem do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.file_uploader_item/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :file_uploader_item
end
