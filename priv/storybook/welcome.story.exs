defmodule Storybook.MyPage do
  # See https://hexdocs.pm/phoenix_storybook/PhoenixStorybook.Story.html for full story
  # documentation.
  use PhoenixStorybook.Story, :page
  use Graphene, [:html, :live]

  def doc, do: "Your very first steps into using Phoenix Storybook"

  # Declare an optional tab-based navigation in your page:
  def navigation do
    [
      {:welcome, "Welcome", {:fa, "hand-wave", :thin}},
      {:components, "Components", {:fa, "toolbox", :thin}},
      {:sandboxing, "Sandboxing", {:fa, "box-check", :thin}},
      {:icons, "Icons", {:fa, "icons", :thin}}
    ]
  end

  # This is a dummy fonction that you should replace with your own HEEx content.
  def render(assigns = %{tab: :welcome}) do
    ~H"""
    <div>
      <p>
        We generated your storybook with an example of a page and a component.
        Explore the generated <code>*.story.exs</code>
        files in your <code>/storybook</code>
        directory. When you're ready to add your own, just drop your new story & index files into the same directory and refresh your storybook.
      </p>

      <p>
        Explore the live demo console here:
        <a href="/demo">Nimbus Cloud demo</a>
      </p>

      <section class="psb-doc">
        <!-- GRAPHENE_INSTALL:START -->
        <%= Phoenix.HTML.raw(~S'''
        <h2>
        Install in a Phoenix app</h2>
        <ol>
          <li>
        Add the Elixir dependency:  </li>
        </ol>
        <pre class="psb highlight psb:p-2 psb:md:p-3 psb:border psb:border-slate-800 psb:text-xs psb:md:text-sm
        psb:rounded-md psb:bg-slate-800! psb:whitespace-pre-wrap psb:break-normal"><code class="language-elixir"><span class="kd">defp</span><span class="w"> </span><span class="nf">deps</span><span class="w"> </span><span class="k" data-group-id="0830078535-1">do</span><span class="w">
          </span><span class="p" data-group-id="0830078535-2">[</span><span class="w">
            </span><span class="p" data-group-id="0830078535-3">{</span><span class="ss">:graphene</span><span class="p">,</span><span class="w"> </span><span class="s">"~&gt; 2.47.0"</span><span class="p" data-group-id="0830078535-3">}</span><span class="w">
          </span><span class="p" data-group-id="0830078535-2">]</span><span class="w">
        </span><span class="k" data-group-id="0830078535-1">end</span></code></pre>
        <ol start="2">
          <li>
        Serve Graphene’s vendored assets from your endpoint:  </li>
        </ol>
        <pre class="psb highlight psb:p-2 psb:md:p-3 psb:border psb:border-slate-800 psb:text-xs psb:md:text-sm
        psb:rounded-md psb:bg-slate-800! psb:whitespace-pre-wrap psb:break-normal"><code class="language-elixir"><span class="n">plug</span><span class="w"> </span><span class="nc">Plug.Static</span><span class="p">,</span><span class="w">
          </span><span class="ss">at</span><span class="p">:</span><span class="w"> </span><span class="s">"/graphene"</span><span class="p">,</span><span class="w">
          </span><span class="ss">from</span><span class="p">:</span><span class="w"> </span><span class="ss">:graphene</span><span class="p">,</span><span class="w">
          </span><span class="ss">gzip</span><span class="p">:</span><span class="w"> </span><span class="no">false</span><span class="p">,</span><span class="w">
          </span><span class="ss">only</span><span class="p">:</span><span class="w"> </span><span class="sx">~w(assets)</span></code></pre>
        <ol start="3">
          <li>
        Include Graphene’s CSS + JS in your root layout:  </li>
        </ol>
        <pre class="psb highlight psb:p-2 psb:md:p-3 psb:border psb:border-slate-800 psb:text-xs psb:md:text-sm
        psb:rounded-md psb:bg-slate-800! psb:whitespace-pre-wrap psb:break-normal"><code class="language-heex"><span class="p" data-group-id="5219821928-out-1">&lt;</span><span class="nt">link</span><span class="w"> </span><span class="na">rel</span><span class="o">=</span><span class="s">"stylesheet"</span><span class="w"> </span><span class="na">href</span><span class="o">=</span><span class="p" data-group-id="5219821928-1">{</span><span class="sx">~p"/graphene/assets/graphene.css"</span><span class="p" data-group-id="5219821928-1">}</span><span class="s"> </span><span class="p" data-group-id="5219821928-out-1">/&gt;</span><span class="w">
        </span><span class="p" data-group-id="5219821928-out-2">&lt;</span><span class="nt">script</span><span class="w"> </span><span class="na">type</span><span class="o">=</span><span class="s">"module"</span><span class="p" data-group-id="5219821928-out-2">&gt;</span><span class="s">
          import * as Graphene from "</span><span class="p" data-group-id="5219821928-2">&lt;%=</span><span class="w"> </span><span class="sx">~p"/graphene/assets/index.js"</span><span class="w"> </span><span class="p" data-group-id="5219821928-2">%&gt;</span><span class="s">";
          window.Graphene = Graphene;
        </span><span class="p" data-group-id="5219821928-out-3">&lt;/</span><span class="nt">script</span><span class="p" data-group-id="5219821928-out-3">&gt;</span></code></pre>
        <ol start="4">
          <li>
        Wire Graphene into your LiveView entrypoint (<code class="inline">assets/js/app.js</code> or <code class="inline">assets/js/app.ts</code>):  </li>
        </ol>
        <pre class="psb highlight psb:p-2 psb:md:p-3 psb:border psb:border-slate-800 psb:text-xs psb:md:text-sm
        psb:rounded-md psb:bg-slate-800! psb:whitespace-pre-wrap psb:break-normal"><code class="language-typescript"><span class="kr">import</span><span class="w"> </span><span class="p" data-group-id="4015694342-1">{</span><span class="w"> </span><span class="n">LiveSocket</span><span class="w"> </span><span class="p" data-group-id="4015694342-1">}</span><span class="w"> </span><span class="kr">from</span><span class="w"> </span><span class="s">"phoenix_live_view"</span><span class="p">;</span><span class="w">
        </span><span class="kr">import</span><span class="w"> </span><span class="p" data-group-id="4015694342-2">{</span><span class="w"> </span><span class="n">Socket</span><span class="w"> </span><span class="p" data-group-id="4015694342-2">}</span><span class="w"> </span><span class="kr">from</span><span class="w"> </span><span class="s">"phoenix"</span><span class="p">;</span><span class="w">
        
        </span><span class="kd">const</span><span class="w"> </span><span class="p" data-group-id="4015694342-3">{</span><span class="w"> </span><span class="n">WebComponentManager</span><span class="p">,</span><span class="w"> </span><span class="n">Hooks</span><span class="p">,</span><span class="w"> </span><span class="n">mergeWebComponentsAttrs</span><span class="w"> </span><span class="p" data-group-id="4015694342-3">}</span><span class="w"> </span><span class="o">=</span><span class="w"> </span><span class="nb">window</span><span class="p">.</span><span class="n">Graphene</span><span class="p">;</span><span class="w">
        </span><span class="kd">const</span><span class="w"> </span><span class="n">componentManager</span><span class="w"> </span><span class="o">=</span><span class="w"> </span><span class="ow">new</span><span class="w"> </span><span class="nf">WebComponentManager</span><span class="p" data-group-id="4015694342-4">(</span><span class="p" data-group-id="4015694342-4">)</span><span class="p">;</span><span class="w">
        </span><span class="n">componentManager</span><span class="p">.</span><span class="nf">connect</span><span class="p" data-group-id="4015694342-5">(</span><span class="p" data-group-id="4015694342-5">)</span><span class="p">;</span><span class="w">
        
        </span><span class="kd">const</span><span class="w"> </span><span class="n">liveSocket</span><span class="w"> </span><span class="o">=</span><span class="w"> </span><span class="ow">new</span><span class="w"> </span><span class="nf">LiveSocket</span><span class="p" data-group-id="4015694342-6">(</span><span class="s">"/live"</span><span class="p">,</span><span class="w"> </span><span class="n">Socket</span><span class="p">,</span><span class="w"> </span><span class="p" data-group-id="4015694342-7">{</span><span class="w">
          </span><span class="n">hooks</span><span class="o">:</span><span class="w"> </span><span class="n">Hooks</span><span class="p">,</span><span class="w">
          </span><span class="n">dom</span><span class="o">:</span><span class="w"> </span><span class="p" data-group-id="4015694342-8">{</span><span class="w"> </span><span class="n">onBeforeElUpdated</span><span class="o">:</span><span class="w"> </span><span class="n">mergeWebComponentsAttrs</span><span class="w"> </span><span class="p" data-group-id="4015694342-8">}</span><span class="w">
        </span><span class="p" data-group-id="4015694342-7">}</span><span class="p" data-group-id="4015694342-6">)</span><span class="p">;</span><span class="w">
        
        </span><span class="n">liveSocket</span><span class="p">.</span><span class="nf">connect</span><span class="p" data-group-id="4015694342-9">(</span><span class="p" data-group-id="4015694342-9">)</span><span class="p">;</span></code></pre>
        <ol start="5">
          <li>
        Expose Graphene components in your app:  </li>
        </ol>
        <pre class="psb highlight psb:p-2 psb:md:p-3 psb:border psb:border-slate-800 psb:text-xs psb:md:text-sm
        psb:rounded-md psb:bg-slate-800! psb:whitespace-pre-wrap psb:break-normal"><code class="language-elixir"><span class="kd">defmodule</span><span class="w"> </span><span class="nc">MyAppWeb.Components</span><span class="w"> </span><span class="k" data-group-id="3783259727-1">do</span><span class="w">
          </span><span class="kn">use</span><span class="w"> </span><span class="nc">Phoenix.Component</span><span class="w">
          </span><span class="kn">use</span><span class="w"> </span><span class="nc">Graphene.Components</span><span class="w">
        </span><span class="k" data-group-id="3783259727-1">end</span></code></pre>
        <p>
        Notes:</p>
        <ul>
          <li>
        Graphene ships Carbon styles + IBM Plex fonts inside <code class="inline">priv/static/assets</code>, so no Carbon-related npm packages are required.  </li>
          <li>
        When developing this repo locally (the <code class="inline">demo</code> app), run <code class="inline">mix assets.build</code> at the repo root to refresh vendored Graphene assets.  </li>
          <li>
        Optional (reduce flicker): preload Graphene’s CSS + a couple of IBM Plex font files. Use the helper to avoid hardcoding hashed filenames:  </li>
        </ul>
        <pre class="psb highlight psb:p-2 psb:md:p-3 psb:border psb:border-slate-800 psb:text-xs psb:md:text-sm
        psb:rounded-md psb:bg-slate-800! psb:whitespace-pre-wrap psb:break-normal"><code class="language-heex"><span class="p" data-group-id="6755798831-out-1">&lt;</span><span class="nt">link</span><span class="w"> </span><span class="na">rel</span><span class="o">=</span><span class="s">"preload"</span><span class="w"> </span><span class="na">as</span><span class="o">=</span><span class="s">"style"</span><span class="w"> </span><span class="na">href</span><span class="o">=</span><span class="p" data-group-id="6755798831-1">{</span><span class="sx">~p"/graphene/assets/graphene.css"</span><span class="p" data-group-id="6755798831-1">}</span><span class="s"> </span><span class="p" data-group-id="6755798831-out-1">/&gt;</span><span class="w">
        </span><span class="p" data-group-id="6755798831-out-2">&lt;</span><span class="nt">link</span><span class="w"> </span><span class="na">rel</span><span class="o">=</span><span class="s">"stylesheet"</span><span class="w"> </span><span class="na">href</span><span class="o">=</span><span class="p" data-group-id="6755798831-2">{</span><span class="sx">~p"/graphene/assets/graphene.css"</span><span class="p" data-group-id="6755798831-2">}</span><span class="s"> </span><span class="p" data-group-id="6755798831-out-2">/&gt;</span><span class="w">
        </span><span class="p" data-group-id="6755798831-3">&lt;%=</span><span class="w"> </span><span class="k">if</span><span class="w"> </span><span class="n">path</span><span class="w"> </span><span class="o">=</span><span class="w"> </span><span class="nc">Graphene.Font</span><span class="o">.</span><span class="n">path</span><span class="p" data-group-id="6755798831-ex-1">(</span><span class="s">"Regular"</span><span class="p">,</span><span class="w"> </span><span class="s">"Latin1"</span><span class="p" data-group-id="6755798831-ex-1">)</span><span class="w"> </span><span class="k" data-group-id="6755798831-ex-2">do</span><span class="w"> </span><span class="p" data-group-id="6755798831-3">%&gt;</span><span class="w">
          </span><span class="p" data-group-id="6755798831-out-3">&lt;</span><span class="nt">link</span><span class="w"> </span><span class="na">rel</span><span class="o">=</span><span class="s">"preload"</span><span class="w"> </span><span class="na">as</span><span class="o">=</span><span class="s">"font"</span><span class="w"> </span><span class="na">type</span><span class="o">=</span><span class="s">"font/woff2"</span><span class="w"> </span><span class="na">crossorigin</span><span class="w"> </span><span class="na">href</span><span class="o">=</span><span class="p" data-group-id="6755798831-4">{</span><span class="n">path</span><span class="p" data-group-id="6755798831-4">}</span><span class="s"> </span><span class="p" data-group-id="6755798831-out-3">/&gt;</span><span class="w">
        </span><span class="p" data-group-id="6755798831-5">&lt;%</span><span class="w"> </span><span class="k" data-group-id="6755798831-ex-2">end</span><span class="w"> </span><span class="p" data-group-id="6755798831-5">%&gt;</span><span class="w">
        </span><span class="p" data-group-id="6755798831-6">&lt;%=</span><span class="w"> </span><span class="k">if</span><span class="w"> </span><span class="n">path</span><span class="w"> </span><span class="o">=</span><span class="w"> </span><span class="nc">Graphene.Font</span><span class="o">.</span><span class="n">path</span><span class="p" data-group-id="6755798831-ex-3">(</span><span class="s">"SemiBold"</span><span class="p">,</span><span class="w"> </span><span class="s">"Latin1"</span><span class="p" data-group-id="6755798831-ex-3">)</span><span class="w"> </span><span class="k" data-group-id="6755798831-ex-4">do</span><span class="w"> </span><span class="p" data-group-id="6755798831-6">%&gt;</span><span class="w">
          </span><span class="p" data-group-id="6755798831-out-4">&lt;</span><span class="nt">link</span><span class="w"> </span><span class="na">rel</span><span class="o">=</span><span class="s">"preload"</span><span class="w"> </span><span class="na">as</span><span class="o">=</span><span class="s">"font"</span><span class="w"> </span><span class="na">type</span><span class="o">=</span><span class="s">"font/woff2"</span><span class="w"> </span><span class="na">crossorigin</span><span class="w"> </span><span class="na">href</span><span class="o">=</span><span class="p" data-group-id="6755798831-7">{</span><span class="n">path</span><span class="p" data-group-id="6755798831-7">}</span><span class="s"> </span><span class="p" data-group-id="6755798831-out-4">/&gt;</span><span class="w">
        </span><span class="p" data-group-id="6755798831-8">&lt;%</span><span class="w"> </span><span class="k" data-group-id="6755798831-ex-4">end</span><span class="w"> </span><span class="p" data-group-id="6755798831-8">%&gt;</span></code></pre>
        ''') %>
        <!-- GRAPHENE_INSTALL:END -->
      </section>

      <p>
        Here are a few docs you might be interested in:
      </p>

      <.description_list items={[
        {"Create a new Story", doc_link("Story")},
        {"Display components using Variations", doc_link("Stories.Variation")},
        {"Group components using VariationGroups", doc_link("Stories.VariationGroup")},
        {"Organize the sidebar with Index files", doc_link("Index")}
      ]} />

      <p>
        This should be enough to get you started, but you can use the tabs in the upper-right corner of this page to <strong>check out advanced usage guides</strong>.
      </p>
    </div>
    """
  end

  def render(assigns = %{tab: guide}) when guide in ~w(components sandboxing icons)a do
    assigns =
      assign(assigns,
        guide: guide,
        guide_content: PhoenixStorybook.Guides.markup("#{guide}.md")
      )

    ~H"""
    <p>
      <a href={"https://hexdocs.pm/phoenix_storybook/#{@guide}.html"} target="_blank">
        This and other guides are also available on HexDocs.
      </a>
    </p>
    <div>
      <%= Phoenix.HTML.raw(@guide_content) %>
    </div>
    """
  end

  defp description_list(assigns) do
    ~H"""
    <div>
      <div>
        <dl>
          <%= for {dt, link} <- @items do %>
            <div>
              <dt>
                <%= dt %>
              </dt>
              <dd>
                <a href={link} target="_blank">
                  <%= link %>
                </a>
              </dd>
            </div>
          <% end %>
        </dl>
      </div>
    </div>
    """
  end

  defp doc_link(page) do
    "https://hexdocs.pm/phoenix_storybook/PhoenixStorybook.#{page}.html"
  end

end
