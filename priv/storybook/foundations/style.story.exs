defmodule Storybook.Foundations.Style do
  use PhoenixStorybook.Story, :page

  def doc do
    "Carbon-first styling: quiet surfaces, meaningful contrast, and restrained accents."
  end

  def render(assigns) do
    ~H"""
    <div class="psb-doc">
      <h1>Style</h1>
      <p>
        Style in a Carbon-first system is not “branding.” It is a set of constraints that keeps the
        interface predictable across teams, pages, and years.
      </p>

      <h2>Surfaces: treat backgrounds as structure</h2>
      <ul>
        <li>
          Use the default surface as your baseline. Introduce new surfaces only when they explain
          grouping or hierarchy.
        </li>
        <li>
          Prefer separation by spacing and alignment first; then borders; then background changes.
          Background contrast is expensive and should buy you clarity.
        </li>
        <li>
          Use <code>&lt;.layer&gt;</code> to create depth in a controlled way (for example, a filter panel
          sitting “above” a table). Avoid stacking arbitrary shadows.
        </li>
      </ul>

      <h2>Color: reserve it for meaning</h2>
      <ul>
        <li>
          Status colors are a language. If everything is colored, nothing is. Use
          <code>&lt;.notification&gt;</code> to communicate success/warning/error without inventing new
          styles.
        </li>
        <li>
          Don’t use <code>danger</code> just to make an action feel important. Danger is for irreversible
          or destructive actions.
        </li>
        <li>
          When you need emphasis, elevate hierarchy through layout: put the important thing earlier,
          give it space, and label it clearly.
        </li>
      </ul>

      <h2>Iconography: functional, not decorative</h2>
      <ul>
        <li>
          Icons should reduce reading, not add interpretation. Pair icons with labels unless the icon
          is universally understood in your domain.
        </li>
        <li>
          Prefer <code>&lt;.icon_button&gt;</code> only when the action is obvious and frequent (toolbars,
          row actions). Otherwise, use labeled <code>&lt;.button&gt;</code>.
        </li>
      </ul>

      <h2>States are part of style</h2>
      <ul>
        <li>
          Disabled, loading, empty, and error states should look intentional. If you design only the
          “happy path,” the product will feel unfinished in real usage.
        </li>
        <li>
          Keep state styling consistent across components by choosing a density and size set
          deliberately (for example, <code>sm</code> controls in toolbars).
        </li>
      </ul>

      <h2>A practical rule</h2>
      <p>
        If you’re tempted to add a new style, ask: “Is this communicating a new state or a new
        hierarchy?” If not, it’s probably decoration.
      </p>
    </div>
    """
  end
end

