defmodule Storybook.CarbonComponents.Toggle.FeatureFlag do
  use PhoenixStorybook.Story, :component

  defoverridable doc: 0

  def function, do: &Graphene.CarbonComponents.feature_flags/1

  def doc do
    Storybook.Doc.markdown("""
Feature flag toggles expose optional or experimental functionality. Use them for
controlled rollouts or user opt-ins.

Pair .toggle with .inline_notification or helper text to clarify consequences.
""")
  end

  

  def variations do
    [
      %Variation{
        id: :single,
        slots: [
          ~S|<Graphene.CarbonComponents.toggle name="feature-flag-single" label_a="On" label_b="Off" toggled={true}>
  <:label_text>Label</:label_text>
</Graphene.CarbonComponents.toggle>|
        ]
      },
      %Variation{
        id: :multiple,
        slots: [
          ~S|<Graphene.CarbonComponents.toggle name="feature-flag-a" label_a="On" label_b="Off" toggled={true}>
  <:label_text>Feature A</:label_text>
</Graphene.CarbonComponents.toggle>
<Graphene.CarbonComponents.toggle name="feature-flag-b" label_a="On" label_b="Off">
  <:label_text>Feature B</:label_text>
</Graphene.CarbonComponents.toggle>|
        ]
      },
      %Variation{
        id: :disabled,
        slots: [
          ~S|<Graphene.CarbonComponents.toggle name="feature-flag-disabled" label_a="On" label_b="Off" disabled={true}>
  <:label_text>Disabled</:label_text>
</Graphene.CarbonComponents.toggle>|
        ]
      }
    ]
  end
end
