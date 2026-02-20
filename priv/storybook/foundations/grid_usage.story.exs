defmodule Storybook.Foundations.GridUsage do
  use PhoenixStorybook.Story, :page

  def doc do
    "How to use the 2x grid effectively: alignment, gutters, and responsive structure."
  end

  def render(assigns) do
    ~H"""
    <div class="psb-doc">
      <h1>Effective Grid Usage</h1>
      <p>
        The grid is not a constraint for its own sake. It is how you make many components feel like
        one system. The user doesn’t see the grid explicitly; they feel the alignment, rhythm, and
        predictability it creates.
      </p>

      <h2>The 2x idea in practice</h2>
      <ul>
        <li>
          Think in multiples: 8px as a “mini unit,” and spacing steps built from it. Avoid arbitrary
          one-off spacing.
        </li>
        <li>
          Align text to the padding edge of containers. “Floating” type (offset from container edges
          without reason) is the fastest way to look unfinished.
        </li>
      </ul>

      <h2>Use columns to make alignment effortless</h2>
      <ul>
        <li>
          Build sections with <code>&lt;.grid&gt;</code> and <code>&lt;:column&gt;</code> so that page
          header, filters, and tables share the same left/right boundaries.
        </li>
        <li>
          Don’t mix column-aligned content with arbitrary widths in the same horizontal band.
          Consistency matters more than cleverness.
        </li>
      </ul>

      <h2>Gutters are meaning</h2>
      <ul>
        <li>
          A gutter is not “space”; it is a statement that two blocks are related but independent.
        </li>
        <li>
          For closely related content (label/value pairs, table + its toolbar), keep gutters tight or
          use a shared container. For separate concerns, give them room.
        </li>
      </ul>

      <h2>Nested grids: only when the page needs a second structure</h2>
      <ul>
        <li>
          Nesting is useful inside cards or panels, but keep the outer edges aligned to the main grid
          so the page still feels coherent.
        </li>
        <li>
          Avoid a “grid inside a grid inside a grid” unless you can explain the hierarchy in one
          sentence.
        </li>
      </ul>

      <h2>A practical rule</h2>
      <p>
        If your layout feels busy, don’t add more lines. Remove columns, simplify regions, and let
        the grid create quiet.
      </p>
    </div>
    """
  end
end

