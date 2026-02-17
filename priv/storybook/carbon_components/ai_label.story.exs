defmodule Storybook.CarbonComponents.AILabel do
  use PhoenixStorybook.Story, :component

  def function, do: &Graphene.CarbonComponents.ai_label/1

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{alignment: "bottom-start"},
        slots: [
          ~S|<:body_text>
  <p class="secondary">AI Explained</p>
  <h2 class="ai-label-heading">84%</h2>
  <p class="secondary bold">Confidence score</p>
  <p class="secondary">Model type: Foundation</p>
</:body_text>
<:action_button>View details</:action_button>|
        ]
      },
      %Variation{
        id: :inline,
        attributes: %{kind: "inline", ai_text: "AI-generated", ai_text_label: "Status"},
        slots: [
          ~S|<:body_text>
  <p class="secondary">Inline AI summary</p>
  <p class="secondary">Updated 2 mins ago</p>
</:body_text>
<:action_button>Review</:action_button>|
        ]
      },
      %VariationGroup{
        id: :sizes,
        variations:
          for size <- ~w(sm md lg) do
            %Variation{
              id: String.to_atom(size),
              attributes: %{size: size, alignment: "bottom-start"},
              slots: [
                ~S|<:body_text>
  <p class="secondary">Model summary</p>
  <h2 class="ai-label-heading">76%</h2>
  <p class="secondary bold">Confidence</p>
</:body_text>
<:action_button>Open</:action_button>|
              ]
            }
          end
      }
    ]
  end
end
