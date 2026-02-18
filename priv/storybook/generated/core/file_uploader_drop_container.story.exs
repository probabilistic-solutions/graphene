defmodule Storybook.CodeGen.CoreComponents.Fileuploaderdropcontainer do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.file_uploader_drop_container/1,
    component_module: Graphene.CoreComponents,
    component_name: :file_uploader_drop_container
end
