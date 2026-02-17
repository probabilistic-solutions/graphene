defmodule Storybook.CarbonComponents.Modal.Basic do
  use PhoenixStorybook.Story, :component

  def function, do: &Graphene.CarbonComponents.modal/1

  def variations do
    [
      %Variation{
        id: :small,
        attributes: %{open: true, size: "sm"},
        slots: [
          ~S|<:label>Optional label</:label>
<:heading>Modal heading</:heading>
<:body>Add your modal content here. Use descriptive text to explain next steps.</:body>
<:footer_button kind="secondary">Cancel</:footer_button>
<:footer_button kind="primary">Submit</:footer_button>|
        ]
      },
      %Variation{
        id: :large,
        attributes: %{open: true, size: "lg"},
        slots: [
          ~S|<:label>Large modal</:label>
<:heading>Modal heading</:heading>
<:body>Large modal content with additional context.</:body>
<:footer_button kind="secondary">Back</:footer_button>
<:footer_button kind="primary">Continue</:footer_button>|
        ]
      },
      %Variation{
        id: :danger,
        attributes: %{open: true, size: "sm"},
        slots: [
          ~S|<:label>Danger</:label>
<:heading>Delete item</:heading>
<:body>Are you sure you want to delete this item?</:body>
<:footer_button kind="secondary">Cancel</:footer_button>
<:footer_button kind="danger">Delete</:footer_button>|
        ]
      }
    ]
  end
end
