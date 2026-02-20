defmodule Storybook.CarbonComponents.FileUploader.Basic do
  use PhoenixStorybook.Story, :component

  defoverridable doc: 0

  def function, do: &Graphene.CarbonComponents.file_uploader/1

  def doc do
    Storybook.Doc.markdown("""
File uploaders let users select one or more files to upload. Use them for
attachments and data imports, and support drag-and-drop when appropriate.

Combine .file_uploader with .inline_notification feedback and clear size or type
constraints in the label text.
""")
  end

  

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{
          id: "file-uploader-default",
          name: "file_uploader_default",
          label_title: "Upload files",
          label_description: "Max file size 500mb"
        },
        slots: [
          ~S|<:button>Upload</:button>
<:item state="complete">report.pdf</:item>|
        ]
      },
      %Variation{
        id: :multiple,
        attributes: %{
          id: "file-uploader-multiple",
          name: "file_uploader_multiple",
          label_title: "Upload assets",
          label_description: "PNG or SVG"
        },
        slots: [
          ~S|<:button accept=".png .svg" multiple={true}>Add files</:button>
<:item state="uploading">logo.svg</:item>
<:item state="edit">banner.png</:item>|
        ]
      },
      %Variation{
        id: :disabled,
        attributes: %{
          id: "file-uploader-disabled",
          name: "file_uploader_disabled",
          label_title: "Disabled",
          label_description: "Uploads disabled",
          disabled: true
        },
        slots: [
          ~S|<:button disabled={true}>Upload</:button>|
        ]
      }
    ]
  end
end
