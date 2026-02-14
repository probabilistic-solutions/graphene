defmodule Demo.StorybookRenderingFeatureTest do
  use ExUnit.Case, async: false
  use Wallaby.Feature

  import Wallaby.Query, only: [css: 1]

  @moduletag :wallaby

  setup do
    {:ok, session} = Wallaby.start_session()
    on_exit(fn -> Wallaby.end_session(session) end)
    {:ok, session: session}
  end

  feature "renders all storybook stories", %{session: session} do
    story_paths()
    |> Enum.reduce(session, fn path, session ->
      session
      |> visit(path)
      |> assert_has(css(".psb-sandbox"))
    end)
  end

  defp story_paths do
    storybook_root = Path.join(:code.priv_dir(:graphene), "storybook")

    storybook_root
    |> Path.join("**/*.story.exs")
    |> Path.wildcard()
    |> Enum.map(&storybook_path/1)
    |> Enum.sort()
  end

  defp storybook_path(file) do
    storybook_root = Path.join(:code.priv_dir(:graphene), "storybook")
    relative = Path.relative_to(file, storybook_root)
    "/" <> String.replace_suffix(relative, ".story.exs", "")
  end
end

defmodule Demo.StorybookRenderingServerTest do
  use ExUnit.Case, async: true
  import Phoenix.ConnTest
  import Phoenix.LiveViewTest

  @endpoint DemoWeb.Endpoint

  test "table story renders rows server-side" do
    {:ok, _view, html} =
      build_conn()
      |> live("/basic_components/table")

    # If rendering fails (e.g., invalid DOM ids), LiveView exits and this assertion is never reached.
    assert html =~ "BasicComponents table"
    assert html =~ "Ada Lovelace"
    assert html =~ "Grace Hopper"
    assert html =~ "cds-table"
  end
end
