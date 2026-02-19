defmodule Storybook.CodeGen.CoreComponents.Fileuploaderdropcontainer do
  use Graphene, [:html, :live]
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.Internal.CoreComponents.file_uploader_drop_container/1,
    component_module: Graphene.Internal.CoreComponents,
    component_name: :file_uploader_drop_container
end
