defmodule Storybook.Foundations.Feel do
  use PhoenixStorybook.Story, :page

  def doc do
    "Interaction feel: feedback, motion, and state handling that makes the UI feel solid."
  end

  def render(assigns) do
    ~H"""
    <div class="psb-doc">
      <h1>Feel</h1>
      <p>
        “Feel” is the tactile layer of an interface: how it responds, how it transitions, how it
        behaves under latency, and how clearly it communicates state changes.
      </p>

      <h2>Feedback should be immediate and proportionate</h2>
      <ul>
        <li>
          Every action should produce a visible response within a moment: a pressed state, a spinner,
          a notification, or a content change.
        </li>
        <li>
          Use <code>&lt;.inline_loading&gt;</code> inside buttons or rows for localized work.
          Use page-level loading sparingly.
        </li>
        <li>
          Prefer <code>&lt;.skeleton_*&gt;</code> for content that is arriving and will occupy the same
          structure (tables, cards). A skeleton is a promise of layout continuity.
        </li>
      </ul>

      <h2>Motion is for continuity, not decoration</h2>
      <ul>
        <li>
          Animate when it helps the user understand what changed (opening a panel, expanding a row,
          inserting a new item). Avoid motion that calls attention to itself.
        </li>
        <li>
          Keep durations short and consistent. The product should feel responsive, not theatrical.
        </li>
      </ul>

      <h2>Make state visible in the right place</h2>
      <ul>
        <li>
          Errors belong near the source (field validation), and also at the outcome level
          (<code>&lt;.notification&gt;</code>) if the operation affects the broader system.
        </li>
        <li>
          Disabled states should explain themselves when possible (tooltips, helper text). A disabled
          control without context feels like a bug.
        </li>
      </ul>

      <h2>Design for “unhappy paths” on purpose</h2>
      <ul>
        <li>Slow network, partial failures, permission-denied, empty results, and conflicts.</li>
        <li>
          A professional UI feels calm precisely because it has a plan for these moments.
        </li>
      </ul>
    </div>
    """
  end
end

