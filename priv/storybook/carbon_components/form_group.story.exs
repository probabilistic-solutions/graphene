defmodule Storybook.CarbonComponents.FormGroup do
  use PhoenixStorybook.Story, :component

  def function, do: &Graphene.CarbonComponents.form_group/1

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{legend_text: "Notification settings"},
        slots: [
          ~S|<Graphene.CarbonComponents.checkbox id="form-group-email" label_text="Email" />
<Graphene.CarbonComponents.checkbox id="form-group-sms" label_text="SMS" />|
        ]
      },
      %Variation{
        id: :with_message,
        attributes: %{legend_text: "Alerts", message: true, message_text: "Pick at least one"},
        slots: [
          ~S|<Graphene.CarbonComponents.checkbox id="form-group-product" label_text="Product updates" />
<Graphene.CarbonComponents.checkbox id="form-group-security" label_text="Security" />|
        ]
      },
      %Variation{
        id: :invalid,
        attributes: %{legend_text: "Required", invalid: true, message: true, message_text: "Select one option"},
        slots: [
          ~S|<Graphene.CarbonComponents.checkbox id="form-group-a" label_text="Option A" />
<Graphene.CarbonComponents.checkbox id="form-group-b" label_text="Option B" />|
        ]
      }
    ]
  end
end
