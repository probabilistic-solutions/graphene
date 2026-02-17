defmodule Storybook.CarbonComponents.FileUploader.Basic do
  use PhoenixStorybook.Story, :component

  def function, do: &Graphene.CarbonComponents.file_uploader/1

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{label_title: "Upload files", label_description: "Max file size 500mb"},
        slots: [
          ~S|<:button>Upload</:button>
<:item state="complete">report.pdf</:item>|
        ]
      },
      %Variation{
        id: :multiple,
        attributes: %{label_title: "Upload assets", label_description: "PNG or SVG"},
        slots: [
          ~S|<:button accept=".png .svg" multiple={true}>Add files</:button>
<:item state="uploading">logo.svg</:item>
<:item state="edit">banner.png</:item>|
        ]
      },
      %Variation{
        id: :disabled,
        attributes: %{label_title: "Disabled", label_description: "Uploads disabled", disabled: true},
        slots: [
          ~S|<:button disabled={true}>Upload</:button>|
        ]
      }
    ]
  end
end
