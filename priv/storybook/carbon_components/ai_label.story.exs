defmodule Storybook.CarbonComponents.AILabel do
  use PhoenixStorybook.Story, :component

  defoverridable doc: 0

  def function, do: &Graphene.CarbonComponents.ai_label/1

  def doc do
    Storybook.Doc.markdown("""
The AI label marks AI-generated or AI-assisted content and provides a consistent
entry point for explainability. Use it whenever an interface includes AI output,
not as decoration or as a trigger for AI actions.

Pair .ai_label with .popover or .toggletip to explain the model or data sources,
and keep it adjacent to the content it annotates.
""")
  end

  

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
        description: "Scale variants",
        note: "Match the label size to surrounding content and keep a single size per surface.",
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
