defmodule Storybook.Foundations.Aesthetics do
  use PhoenixStorybook.Story, :page

  def doc do
    "Aesthetics in a Carbon-first product UI: rhythm, restraint, and coherence."
  end

  def render(assigns) do
    ~H"""
    <div class="psb-doc">
      <h1>Aesthetics</h1>
      <p>
        In product design, aesthetics is not ornament. It is the visible proof of invisible
        structure: alignment, hierarchy, and consistency. A Carbon-first UI looks “good” when it
        looks inevitable.
      </p>

      <h2>Make the system feel like one instrument</h2>
      <ul>
        <li>
          Repeat patterns. If two pages solve the same kind of problem, they should look like they’re
          from the same toolkit.
        </li>
        <li>
          Choose a density and keep it consistent across a page. Mixed densities read as accidental.
        </li>
      </ul>

      <h2>Use contrast with restraint</h2>
      <ul>
        <li>
          Strong contrast belongs to the primary action and the primary content.
        </li>
        <li>
          Reduce contrast for secondary information instead of hiding it. The goal is scanability,
          not invisibility.
        </li>
      </ul>

      <h2>Quiet surfaces, loud content</h2>
      <ul>
        <li>
          Make chrome quiet: avoid heavy borders and decorative backgrounds.
        </li>
        <li>
          Let the content carry meaning: names, statuses, numbers, and clear labels.
        </li>
      </ul>

      <h2>Whitespace is not empty</h2>
      <ul>
        <li>
          Whitespace is grouping. It tells users what belongs together without adding another line.
        </li>
        <li>
          Use whitespace to reduce decision fatigue: fewer competing elements per viewport.
        </li>
      </ul>

      <h2>A practical test</h2>
      <p>
        If your page still “needs something,” it often needs a clearer hierarchy, not a new visual
        element. Try removing half the chrome and making the remaining structure more consistent.
      </p>
    </div>
    """
  end
end

