defmodule Storybook.CodeGen.CoreComponents.Fileuploader do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.file_uploader/1,
    component_module: Graphene.CoreComponents,
    component_name: :file_uploader
end
