defmodule Storybook.Foundations.ApplicationOutline do
  use PhoenixStorybook.Story, :page

  def doc do
    "A repeatable application page outline: how to compose Graphene into real product pages."
  end

  def render(assigns) do
    ~H"""
    <div class="psb-doc">
      <h1>Application Page Outline</h1>
      <p>
        A design system becomes truly useful when it produces repeatable page structures. These
        outlines are meant to reduce “blank page design” and keep your product consistent across
        teams.
      </p>

      <h2>1) Index / List pages (tables, catalogs, logs)</h2>
      <ul>
        <li>
          <strong>Orientation:</strong> <code>&lt;.page_header&gt;</code> with a clear title, optional
          subtitle, and one primary action.
        </li>
        <li>
          <strong>Controls:</strong> search + filters close to the results. Use
          <code>&lt;.data_table&gt;</code> toolbar patterns instead of building bespoke filter strips.
        </li>
        <li>
          <strong>Results:</strong> <code>&lt;.data_table&gt;</code> with meaningful empty states, loading
          skeletons, and batch actions only when selection is a real task.
        </li>
        <li>
          <strong>Scale:</strong> <code>&lt;.pagination&gt;</code> for large sets; avoid infinite scroll
          for operational content where people need location and repeatability.
        </li>
      </ul>

      <h2>2) Detail pages (one thing, many attributes)</h2>
      <ul>
        <li>
          Lead with identity: name, status, and the actions that change the object.
        </li>
        <li>
          Use <code>&lt;.tabs&gt;</code> when the object has distinct “sub-areas” (activity, settings,
          permissions). Avoid tabs when sections are just short; scrolling is fine.
        </li>
        <li>
          Keep metadata scannable: a grid of label/value pairs beats a paragraph of prose.
        </li>
      </ul>

      <h2>3) Forms (create/edit flows)</h2>
      <ul>
        <li>
          Group by decision: use <code>&lt;.form_group&gt;</code> to cluster fields that belong to the
          same mental step.
        </li>
        <li>
          Validation should teach. Prefer “how to fix it” over “what went wrong.”
        </li>
        <li>
          Put the primary submit where the user expects it, and keep it stable. If you move it, users
          will hunt.
        </li>
      </ul>

      <h2>4) Dashboards (overview, monitoring, status)</h2>
      <ul>
        <li>
          Use <code>&lt;.grid&gt;</code> to align cards and charts; keep a consistent rhythm between
          sections.
        </li>
        <li>
          Prefer a few high-signal metrics over a wall of numbers. Make the “next click” obvious.
        </li>
        <li>
          Density is a dial: dashboards can be denser than forms, but avoid compressing labels to the
          point of decoding.
        </li>
      </ul>

      <h2>Cross-cutting patterns</h2>
      <ul>
        <li>
          Use <code>&lt;.modal&gt;</code> for destructive or high-impact actions; keep the default page
          calm.
        </li>
        <li>
          Use <code>&lt;.notification&gt;</code> for system-level outcomes; use inline errors for
          field-level problems.
        </li>
      </ul>
    </div>
    """
  end
end

