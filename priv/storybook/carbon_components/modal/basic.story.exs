defmodule Storybook.CarbonComponents.Modal.Basic do
  use PhoenixStorybook.Story, :component

  def function, do: &Graphene.CarbonComponents.modal/1

  def variations do
    [
      %Variation{
        id: :small,
        attributes: %{open: true, size: "sm", label: "Optional label", heading: "Modal heading"},
        slots: [
          ~S|<:body>Add your modal content here. Use descriptive text to explain next steps.</:body>
<:footer_button kind="secondary">Cancel</:footer_button>
<:footer_button kind="primary">Submit</:footer_button>|
        ]
      },
      %Variation{
        id: :large,
        attributes: %{open: true, size: "lg", label: "Large modal", heading: "Modal heading"},
        slots: [
          ~S|<:body>Large modal content with additional context.</:body>
<:footer_button kind="secondary">Back</:footer_button>
<:footer_button kind="primary">Continue</:footer_button>|
        ]
      },
      %Variation{
        id: :danger,
        attributes: %{open: true, size: "sm", label: "Danger", heading: "Delete item"},
        slots: [
          ~S|<:body>Are you sure you want to delete this item?</:body>
<:footer_button kind="secondary">Cancel</:footer_button>
<:footer_button kind="danger">Delete</:footer_button>|
        ]
      }
    ]
  end
end
