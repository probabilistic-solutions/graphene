defmodule Storybook.Foundations.Calligraphy do
  use PhoenixStorybook.Story, :page

  def doc do
    "Typography as craft: hierarchy, rhythm, and legibility for product UIs."
  end

  def render(assigns) do
    ~H"""
    <div class="psb-doc">
      <h1>Calligraphy (Typography)</h1>
      <p>
        Treat typography as a layout system, not a paint choice. In a Carbon-first UI, type carries
        hierarchy, scanability, and trust. If type is inconsistent, the whole product feels
        improvised.
      </p>

      <h2>Productive by default</h2>
      <ul>
        <li>
          For most application surfaces, choose productive type: compact, steady, and optimized for
          dense interfaces.
        </li>
        <li>
          Use expressive type sparingly as a “moment” (an onboarding page, a marketing-like empty
          state, or a long-form explanation).
        </li>
      </ul>

      <h2>Hierarchy without shouting</h2>
      <ul>
        <li>
          Prefer hierarchy through <strong>size + spacing</strong> over heavy weights. Weight is a
          strong signal; if everything is bold, nothing is.
        </li>
        <li>
          Keep headings short. If a heading needs two lines, it’s often a paragraph.
        </li>
        <li>
          Use sentence case for product UI. All-caps increases visual noise and harms scan speed.
        </li>
      </ul>

      <h2>Line length and density</h2>
      <ul>
        <li>
          Reading needs breathing room; scanning needs structure. Don’t run long paragraphs across
          very wide grids; split content into sections and tiles.
        </li>
        <li>
          Keep helper text truly helpful and truly secondary. If the helper text is essential, it’s
          the label.
        </li>
      </ul>

      <h2>Type in data-heavy UIs</h2>
      <ul>
        <li>
          Align numbers intentionally (especially in tables). Make units explicit and consistent.
        </li>
        <li>
          Use monospace for IDs, tokens, and machine strings (<code>&lt;.code_snippet&gt;</code>),
          but don’t overuse monospace in general UI copy.
        </li>
        <li>
          Avoid truncation without an escape hatch. When you must truncate, pair it with
          <code>&lt;.tooltip&gt;</code> or a drill-in details view.
        </li>
      </ul>

      <h2>A simple test</h2>
      <p>
        Screenshot your page and blur it. You should still be able to point to: the page title, the
        primary action, section boundaries, and the “main object” (table, form, or details) without
        reading.
      </p>
    </div>
    """
  end
end

