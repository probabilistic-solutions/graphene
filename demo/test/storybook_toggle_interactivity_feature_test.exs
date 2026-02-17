defmodule Demo.StorybookToggleInteractivityFeatureTest do
  use ExUnit.Case, async: false
  use Wallaby.Feature

  import Wallaby.Query, only: [css: 1, css: 2]

  @moduletag :wallaby

  setup do
    {:ok, session} = Wallaby.start_session()
    on_exit(fn -> Wallaby.end_session(session) end)
    {:ok, session: session}
  end

  feature "toggle interactivity updates state", %{session: session} do
    session =
      session
      |> visit("/carbon_components/toggle/interactivity")
      |> assert_has(css("cds-toggle"))
      |> assert_has(css("li", text: "Checked: false"))

    session = session |> click(css("input[type='checkbox'][name='checked']"))

    assert_has(session, css("li", text: "Checked: true"))
  end
end
