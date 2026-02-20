defmodule Storybook.Foundations.Sentiment do
  use PhoenixStorybook.Story, :page

  def doc do
    "The tone Graphene aims for: calm, capable, and quietly confident."
  end

  def render(assigns) do
    ~H"""
    <div class="psb-doc">
      <h1>Sentiment</h1>
      <p>
        Graphene is designed for product UIs where users are doing real work: diagnosing, deciding,
        correcting, shipping. The “emotional tone” should therefore be steady and factual, not
        celebratory or performative.
      </p>

      <h2>What “good” feels like</h2>
      <ul>
        <li>
          <strong>Calm:</strong> nothing shouts, but everything is easy to find. Visual noise is treated
          as a bug.
        </li>
        <li>
          <strong>Capable:</strong> the UI behaves like a precise tool. It anticipates the next step and
          makes state obvious.
        </li>
        <li>
          <strong>Confident:</strong> typography, spacing, and alignment create authority. You don't need
          decoration to look premium.
        </li>
      </ul>

      <h2>How to express tone through components</h2>
      <ul>
        <li>
          Use <code>&lt;.page_header&gt;</code> to set context with a crisp title and a short, truthful
          description. Avoid long marketing copy in product headers.
        </li>
        <li>
          Treat <code>&lt;.button kind="primary"&gt;</code> as a scarce resource: one per view.
          Everything else should compete less for attention (<code>secondary</code>, <code>tertiary</code>,
          <code>ghost</code>, or <code>&lt;.overflow_menu&gt;</code>).
        </li>
        <li>
          Use color for meaning, not decoration: status, emphasis, and selection. If you need “more
          energy,” increase hierarchy (layout + type), not saturation.
        </li>
        <li>
          Prefer “quiet clarity” over cleverness: <code>&lt;.tooltip&gt;</code> explains; it should not
          surprise. <code>&lt;.toggletip&gt;</code> teaches; it should not block.
        </li>
      </ul>

      <h2>Micro-decisions that accumulate into trust</h2>
      <ul>
        <li>
          <strong>Labels are verbs.</strong> A button named “Run” is clearer than “Execution”.
        </li>
        <li>
          <strong>Errors are actionable.</strong> “Invalid input” is useless; “Enter a CIDR like
          10.0.0.0/24” is helpful.
        </li>
        <li>
          <strong>Progress is honest.</strong> Use skeletons for “content is coming” and inline loading
          for “this control is working.”
        </li>
      </ul>

      <h2>Sentiment checklist</h2>
      <p>When a page feels off, it’s usually one of these:</p>
      <ul>
        <li>Too many “primary” moments (actions, colors, strong headings).</li>
        <li>Inconsistent density (tight table next to airy form, mismatched sizes).</li>
        <li>Layout without clear reading order (content is present but not guided).</li>
        <li>UI chrome is louder than the content (borders, backgrounds, icons overused).</li>
      </ul>
    </div>
    """
  end
end

