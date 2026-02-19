defmodule Storybook.Foundations.ContentDensity do
  use PhoenixStorybook.Story, :page

  def doc do
    "Content density principles: when to go compact, when to breathe, and how to stay readable."
  end

  def render(assigns) do
    ~H"""
    <div class="psb-doc">
      <h1>Content Density</h1>
      <p>
        Density is a product decision, not a styling preference. It affects speed, accuracy,
        confidence, and fatigue. A dense UI is not automatically “professional,” and a spacious UI is
        not automatically “easy.”
      </p>

      <h2>Choose density based on the task</h2>
      <ul>
        <li>
          <strong>Scanning many items:</strong> compact tables, compact toolbars, consistent row
          heights.
        </li>
        <li>
          <strong>Making decisions:</strong> give options room; reduce simultaneous choices; group by
          outcome.
        </li>
        <li>
          <strong>Filling forms:</strong> comfort beats compression. Make labels and errors easy to
          read.
        </li>
      </ul>

      <h2>How to increase density without losing clarity</h2>
      <ul>
        <li>
          Reduce padding before reducing type size. Tiny type is a tax on every user.
        </li>
        <li>
          Use consistent <code>size</code> across related controls (for example, <code>sm</code> search,
          buttons, and selects in a toolbar).
        </li>
        <li>
          Replace “always visible” secondary actions with <code>&lt;.overflow_menu&gt;</code>.
          Density improves when you remove rarely used choices from the primary reading path.
        </li>
      </ul>

      <h2>Progressive disclosure is the density superpower</h2>
      <ul>
        <li>
          Use <code>&lt;.accordion&gt;</code>, <code>&lt;.tabs&gt;</code>, and panels to keep the primary
          view focused while still offering depth.
        </li>
        <li>
          Teach, don’t clutter: <code>&lt;.toggletip&gt;</code> for guidance, <code>&lt;.tooltip&gt;</code>
          for short clarifications.
        </li>
      </ul>

      <h2>Keep hit targets humane</h2>
      <p>
        Compact should still be usable. If density causes mis-clicks, the UI becomes slower and more
        frustrating than a spacious alternative.
      </p>
    </div>
    """
  end
end

