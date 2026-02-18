defmodule Storybook.CodeGen.CoreComponents.Fileuploaderbutton do
  use Graphene.CodeGen.Component.Story,
    func: &Graphene.CoreComponents.file_uploader_button/1,
    component_module: Graphene.CoreComponents,
    component_name: :file_uploader_button
end
