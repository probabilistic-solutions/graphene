defmodule Demo.StorybookRenderingTest do
  use ExUnit.Case, async: false
  use Wallaby.Feature

  import Wallaby.Query, only: [css: 1]

  @moduletag :wallaby

  setup do
    {:ok, session} = Wallaby.start_session()
    on_exit(fn -> Wallaby.end_session(session) end)
    {:ok, session: session}
  end

  feature "renders button component story", %{session: session} do
    session
    |> visit("/components/button")
    |> assert_has(css("cds-button"))
  end
end
