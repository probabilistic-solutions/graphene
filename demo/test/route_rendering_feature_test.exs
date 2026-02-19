defmodule Demo.RouteRenderingFeatureTest do
  use ExUnit.Case, async: false
  use Wallaby.Feature

  import Wallaby.Query, only: [css: 2]

  @moduletag :wallaby

  setup do
    {:ok, session} = Wallaby.start_session()
    on_exit(fn -> Wallaby.end_session(session) end)
    {:ok, session: session}
  end

  @tag timeout: 180_000
  feature "renders all demo routes without compile errors", %{session: session} do
    demo_paths()
    |> Enum.reduce(session, fn path, session ->
      visit_and_assert(session, path)
    end)
  end

  defp visit_and_assert(session, path) do
    try do
      session
      |> visit(path)
      |> assert_has(css("#main-content", count: 1))
      |> assert_no_compile_errors()
    rescue
      error in Wallaby.JSError ->
        raise """
        Demo JS error on #{path}:
        #{Exception.message(error)}
        """
    end
  end

  defp assert_no_compile_errors(session) do
    refute has?(session, css("body", text: "Compilation error"))
    refute has?(session, css("body", text: "CompileError"))
    refute has?(session, css("body", text: "Internal Server Error"))
    refute has?(session, css("body", text: "Something went wrong"))
    session
  end

  defp demo_paths do
    DemoWeb.Router
    |> Phoenix.Router.routes()
    |> Enum.filter(&(&1.verb == :get))
    |> Enum.map(& &1.path)
    |> Enum.filter(&String.starts_with?(&1, "/demo"))
    |> Enum.reject(&String.contains?(&1, "assets"))
    |> Enum.uniq()
    |> Enum.sort()
  end
end
