defmodule Storybook.Root do
  # See https://hexdocs.pm/phoenix_storybook/PhoenixStorybook.Index.html for full index
  # documentation.

  use PhoenixStorybook.Index

  def folder_icon, do: {:fa, "book-open", :light, "psb-mr-1"}
  def folder_name, do: "Storybook"

  def entry("welcome") do
    [
      name: "Welcome Page",
      icon: {:fa, "hand-wave", :thin}
    ]
  end
end

defmodule Storybook.Doc do
  @moduledoc false

  alias PhoenixStorybook.Rendering.MarkdownRenderer
  alias PhoenixStorybook.Stories.Doc

  def markdown(markdown) when is_binary(markdown) do
    markdown = String.trim(markdown)

    case String.split(markdown, "\n\n", parts: 2) do
      [header] ->
        %Doc{header: MarkdownRenderer.markdown_to_html(header)}

      [header, body] ->
        %Doc{
          header: MarkdownRenderer.markdown_to_html(header),
          body: MarkdownRenderer.markdown_to_html(body)
        }
    end
  end
end
