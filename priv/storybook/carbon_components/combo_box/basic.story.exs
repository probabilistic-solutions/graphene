defmodule Storybook.CarbonComponents.ComboBox.Basic do
  use PhoenixStorybook.Story, :component

  def function, do: &Graphene.CarbonComponents.combo_box/1

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{name: "combo-box-default", title_text: "Choose an option", label: "Combo box"},
        slots: [
          ~S|<:item value="all">All</:item>
<:item value="cloud">Cloud</:item>
<:item value="edge">Edge</:item>|
        ]
      },
      %Variation{
        id: :inline,
        attributes: %{name: "combo-box-inline", title_text: "Inline combo", label: "Inline", type: "inline"},
        slots: [
          ~S|<:item value="ibm">IBM</:item>
<:item value="redhat">Red Hat</:item>
<:item value="hashicorp">HashiCorp</:item>|
        ]
      },
      %VariationGroup{
        id: :sizes,
        variations:
          for size <- ~w(sm md lg) do
            %Variation{
              id: String.to_atom(size),
              attributes: %{
                name: "combo-box-#{size}",
                title_text: "Size #{size}",
                label: "#{String.upcase(size)}",
                size: size
              },
              slots: [
                ~S|<:item value="one">One</:item>
<:item value="two">Two</:item>|
              ]
            }
          end
      }
    ]
  end
end
