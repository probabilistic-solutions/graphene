defmodule Storybook.MyPage do
  # See https://hexdocs.pm/phoenix_storybook/PhoenixStorybook.Story.html for full story
  # documentation.
  use PhoenixStorybook.Story, :page

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
