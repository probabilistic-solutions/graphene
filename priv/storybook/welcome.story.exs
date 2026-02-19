defmodule Storybook.Welcome do
  use PhoenixStorybook.Story, :page

  def doc do
    "Start here: how to read Graphene Storybook and build Carbon-first UIs professionally."
  end

  def render(assigns) do
    component_example =
      ~S"""
      <.button kind="primary">Save</.button>
      <.data_table rows={[]} />
      """
      |> String.trim()

    e2e_commands =
      ~S"""
      cd demo && mix test test/route_rendering_feature_test.exs
      cd demo && mix test test/storybook_rendering_test.exs
      """
      |> String.trim()

    assigns =
      assign(assigns,
        component_example: component_example,
        e2e_commands: e2e_commands
      )

    ~H"""
    <div class="psb-doc">
      <h1>Welcome to Graphene</h1>
      <p>
        Graphene is a Carbon-first component facade for Phoenix LiveView. It wraps Carbon Web
        Components and gives you a consistent component API (slots, defaults, and patterns) so teams
        can ship complex, operational UIs without UI drift.
      </p>

      <h2>How to navigate this Storybook</h2>
      <ul>
        <li>
          <strong>Foundations</strong> explains the “why” behind sentiment, typography, grid, and
          density. Read this first if you’re composing real pages, not just rendering components.
        </li>
        <li>
          <strong>Carbon Components</strong> is the “how” for each building block. Each story includes
          a short usage note and variations that represent real states to validate.
        </li>
        <li>
          <strong>Examples</strong> shows realistic compositions you can adapt when building screens.
        </li>
        <li>
          The <a href="/demo">Nimbus Cloud demo</a> is a working application that exercises layout,
          density, and composition.
        </li>
      </ul>

      <h2>Component syntax (the “dot” style)</h2>
      <p>
        In your app, bring Graphene into scope with <code>use Graphene.Components</code> (typically in
        your <code>MyAppWeb.Components</code> module), then use the concise HEEx form:
      </p>

      <pre class="psb highlight psb:p-2 psb:md:p-3 psb:border psb:border-slate-800 psb:text-xs psb:md:text-sm psb:rounded-md psb:bg-slate-800! psb:whitespace-pre-wrap psb:break-normal">
        <code class="language-heex"><%= @component_example %></code>
      </pre>

      <p>
        In the docs, we refer to components using this <code>&lt;.component&gt;</code> style for
        brevity (for example, <code>.page_header</code>, <code>.grid</code>, <code>.modal</code>).
      </p>

      <h2>Read this first</h2>
      <ul>
        <li><a href="/foundations/sentiment">Sentiment</a></li>
        <li><a href="/foundations/style">Style</a></li>
        <li><a href="/foundations/layout">Layout</a></li>
        <li><a href="/foundations/feel">Feel</a></li>
        <li><a href="/foundations/calligraphy">Calligraphy (Typography)</a></li>
        <li><a href="/foundations/grid_usage">Effective Grid Usage</a></li>
        <li><a href="/foundations/application_outline">Application Page Outline</a></li>
        <li><a href="/foundations/aesthetics">Aesthetics</a></li>
        <li><a href="/foundations/content_density">Content Density</a></li>
      </ul>

      <h2>Get started</h2>
      <p>
        If you’re integrating Graphene into a Phoenix app, these steps are the minimal foundation:
      </p>

      <div class="psb-doc">
        <!-- GRAPHENE_INSTALL:START -->
        <%= Phoenix.HTML.raw(~S'''
        <p>Install instructions are unavailable. Check README.md.</p>
        ''') %>
        <!-- GRAPHENE_INSTALL:END -->
      </div>

      <h2>Always run the E2E checks</h2>
      <p>
        When you change stories, examples, or wrappers, validate that every route and every story
        still renders (and that no compile errors leak into the UI):
      </p>

      <pre class="psb highlight psb:p-2 psb:md:p-3 psb:border psb:border-slate-800 psb:text-xs psb:md:text-sm psb:rounded-md psb:bg-slate-800! psb:whitespace-pre-wrap psb:break-normal">
        <code class="language-bash"><%= @e2e_commands %></code>
      </pre>

      <h2>Generated code</h2>
      <p>
        Most Graphene wrappers and many Storybook stories are generated. If you need to change how a
        wrapper works or how stories are structured, prefer updating codegen templates/patches and
        re-running generators over editing generated modules directly.
      </p>
    </div>
    """
  end
end
