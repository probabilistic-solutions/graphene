defmodule Storybook.Foundations.Layout do
  use PhoenixStorybook.Story, :page

  def doc do
    "Layout principles for Graphene: hierarchy, rhythm, and predictable reading order."
  end

  def render(assigns) do
    ~H"""
    <div class="psb-doc">
      <h1>Layout</h1>
      <p>
        Layout is the first interaction. Before a user reads a label, they feel whether the page has
        an order: what’s important, what can wait, and what belongs together.
      </p>

      <h2>The page has an anatomy</h2>
      <ul>
        <li>
          <strong>Shell:</strong> global navigation, identity, and cross-app actions
          (<code>&lt;.ui_shell&gt;</code>).
        </li>
        <li>
          <strong>Page header:</strong> title, context, and the primary action
          (<code>&lt;.page_header&gt;</code>).
        </li>
        <li>
          <strong>Work area:</strong> content sections, each with a purpose (tables, forms, tiles,
          tabs).
        </li>
      </ul>

      <h2>Rhythm: keep vertical spacing deliberate</h2>
      <ul>
        <li>
          Pick a spacing cadence and stick to it. Don’t “eyeball” gaps between sections.
          Use <code>&lt;.stack gap="…"&gt;</code> to make spacing a decision, not an accident.
        </li>
        <li>
          Headings create rhythm too. If every section is an <code>h2</code>, nothing is.
          Reserve larger headings for true page-level structure.
        </li>
      </ul>

      <h2>Group by outcome, not by component type</h2>
      <ul>
        <li>
          Put filters next to the list they affect, not in a generic “controls” area.
        </li>
        <li>
          Put secondary actions where the user will need them (table toolbar, row actions, or page
          header), not in a separate “actions card.”
        </li>
      </ul>

      <h2>Make alignment do the work</h2>
      <ul>
        <li>
          Align the left edge of <code>&lt;.page_header&gt;</code>, the first column of
          <code>&lt;.data_table&gt;</code>, and section headings. Users track these invisible lines.
        </li>
        <li>
          Don’t center product layouts. Centering reduces scanability and makes edges ambiguous.
        </li>
      </ul>

      <h2>Useful compositions</h2>
      <ul>
        <li>
          <strong>Table pages:</strong> <code>&lt;.page_header&gt;</code> + <code>&lt;.data_table&gt;</code>
          + <code>&lt;.pagination&gt;</code> + <code>&lt;.modal&gt;</code> for destructive actions.
        </li>
        <li>
          <strong>Form pages:</strong> <code>&lt;.form&gt;</code> + <code>&lt;.form_group&gt;</code> +
          inline validation + “sticky” primary actions.
        </li>
        <li>
          <strong>Details pages:</strong> header + metadata grid + tabs for sub-areas, with a consistent
          “summary” section at the top.
        </li>
      </ul>
    </div>
    """
  end
end

