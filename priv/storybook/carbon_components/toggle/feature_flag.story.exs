defmodule Storybook.CarbonComponents.Toggle.FeatureFlag do
  use PhoenixStorybook.Story, :component

  def function, do: &Graphene.CarbonComponents.feature_flags/1

  def variations do
    [
      %Variation{
        id: :single,
        slots: [
          ~S|<Graphene.CarbonComponents.toggle label_text="Label" label_a="On" label_b="Off" toggled={true} />|
        ]
      },
      %Variation{
        id: :multiple,
        slots: [
          ~S|<Graphene.CarbonComponents.toggle label_text="Feature A" label_a="On" label_b="Off" toggled={true} />
<Graphene.CarbonComponents.toggle label_text="Feature B" label_a="On" label_b="Off" />|
        ]
      },
      %Variation{
        id: :disabled,
        slots: [
          ~S|<Graphene.CarbonComponents.toggle label_text="Disabled" label_a="On" label_b="Off" disabled={true} />|
        ]
      }
    ]
  end
end
