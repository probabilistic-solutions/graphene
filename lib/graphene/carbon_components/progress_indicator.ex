defmodule Graphene.CarbonComponents.ProgressIndicator do
  @moduledoc false

  use Phoenix.Component

  alias Graphene.Internal.CoreComponents

  @doc """
  Component `<cds-progress-indicator>` from `./src/components/progress-indicator/progress-indicator.ts`

  Progress indicator.

  ## Events

  * `change` - Undocumented
  * `onChange` - Undocumented

  """
  attr :current_index, :string,
    doc: "Optionally specify the current step array index.",
    default: "0"

  attr :space_equally, :boolean,
    doc:
      "Specify whether the progress steps should be split equally in size in the\ncontainer (horizontal only)."

  attr :vertical, :boolean,
    doc: "Determines whether or not the progress indicator should be rendered\nvertically."

  attr :rest, :global

  slot :step do
    attr :label, :string
    attr :description, :string
    attr :secondary_label, :string
    attr :secondary_label_text, :string
    attr :complete, :boolean
    attr :current, :boolean
    attr :disabled, :boolean
    attr :invalid, :boolean
    attr :icon_label, :string
    attr :clickable, :boolean
  end

  slot :inner_block

  def progress_indicator(%{step: [_ | _]} = assigns) do
    assigns =
      assigns
      |> assign_new(:space_equally, fn -> false end)
      |> assign_new(:vertical, fn -> false end)

    ~H"""
    <CoreComponents.progress_indicator
      current_index={@current_index}
      space_equally={@space_equally}
      vertical={@vertical}
      {@rest}
    >
      <%= for step <- @step do %>
        <CoreComponents.progress_step
          label={step[:label]}
          description={step[:description]}
          secondary_label={step[:secondary_label]}
          complete={step[:complete]}
          current={step[:current]}
          disabled={step[:disabled]}
          invalid={step[:invalid]}
          icon_label={step[:icon_label]}
          clickable={step[:clickable]}
        >
          <%= if step[:secondary_label_text] do %>
            <span slot="secondary-label-text">{step[:secondary_label_text]}</span>
          <% end %>
        </CoreComponents.progress_step>
      <% end %>
    </CoreComponents.progress_indicator>
    """
  end

  def progress_indicator(assigns) do
    CoreComponents.progress_indicator(assigns)
  end

  @doc """
  Component `<cds-progress-indicator-skeleton>` from `./src/components/progress-indicator/progress-indicator-skeleton.ts`

  Progress indicator skeleton.

  """
  attr :vertical, :boolean, doc: "`true` to render the vertical variant."
  attr :rest, :global
  slot :inner_block

  def progress_indicator_skeleton(assigns) do
    CoreComponents.progress_indicator_skeleton(assigns)
  end
end
