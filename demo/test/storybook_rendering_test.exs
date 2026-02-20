defmodule Demo.StorybookRenderingFeatureTest do
  use ExUnit.Case, async: false
  use Wallaby.Feature

  @moduletag :wallaby

  setup do
    {:ok, session} = Wallaby.start_session()
    on_exit(fn -> Wallaby.end_session(session) end)
    {:ok, session: session}
  end

  @tag timeout: 600_000
  feature "renders all storybook stories", %{session: session} do
    story_paths()
    |> Enum.reduce(session, fn path, session ->
      try do
        session = visit(session, path)
        # Let LiveView connect and hooks settle so JS errors surface before the next navigation.
        Process.sleep(50)

        session
        |> assert_story_renders(path)
      rescue
        error in Wallaby.JSError ->
          raise """
          Storybook JS error on #{path}:
          #{Exception.message(error)}
          """
        error in Wallaby.ExpectationNotMetError ->
          raise """
          Storybook failed to render sandbox on #{path}:
          #{Exception.message(error)}
          """
      end
    end)
  end

  defp assert_story_renders(session, path) do
    html = Wallaby.Browser.page_source(session)

    # All stories render inside a sandbox container. If it's missing, we likely hit a 500 or LV crash.
    unless html =~ "psb-sandbox" do
      raise """
      Storybook failed to render sandbox on #{path}:
      Missing .psb-sandbox in page source.
      """
    end

    assert_no_compile_errors_in_source(html, path)
    session
  end

  defp story_paths do
    storybook_root = Path.join(:code.priv_dir(:graphene), "storybook")

    storybook_root
    |> Path.join("**/*.story.exs")
    |> Path.wildcard()
    |> Enum.map(&storybook_path/1)
    |> Enum.reject(&String.starts_with?(&1, "/generated/"))
    |> Enum.sort()
  end

  defp storybook_path(file) do
    storybook_root = Path.join(:code.priv_dir(:graphene), "storybook")
    relative = Path.relative_to(file, storybook_root)
    "/" <> String.replace_suffix(relative, ".story.exs", "")
  end

  defp assert_no_compile_errors_in_source(html, path) do
    # These are the common error pages surfaced by Phoenix/Phoenix LiveView when a story crashes.
    error_markers = [
      "Compilation error",
      "CompileError",
      "Internal Server Error",
      # Avoid false-positives from story content by matching the Phoenix error heading.
      "<h1>Something went wrong</h1>"
    ]

    Enum.each(error_markers, fn marker ->
      if String.contains?(html, marker) do
        raise "Storybook error on #{path}: #{marker}"
      end
    end)
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
      |> live("/basic_components/table/basic")

    # If rendering fails (e.g., invalid DOM ids), LiveView exits and this assertion is never reached.
    assert html =~ "basic-table"
    assert html =~ "Load Balancer"
    assert html =~ "cds-table"
  end
end
