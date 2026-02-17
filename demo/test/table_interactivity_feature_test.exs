defmodule Demo.TableInteractivityFeatureTest do
  use ExUnit.Case, async: false
  use Wallaby.Feature

  import Wallaby.Query, only: [css: 2]

  @moduletag :wallaby

  setup do
    {:ok, session} = Wallaby.start_session()

    on_exit(fn ->
      Wallaby.end_session(session)
    end)

    {:ok, session: session}
  end

  @tag timeout: 120_000
  feature "data table selection and sorting stays interactive", %{session: session} do
    session
    |> visit("/carbon_components/data_table/interactivity")
    |> assert_has(css("#carbon-events-table cds-table-row", count: :any))
    |> click_simulator_button("#carbon-events-simulator", "Select row 2")
    |> assert_has(css("#carbon-events-log", text: "[row_selected]", count: :any))
    |> assert_has(
      css("#carbon-events-table cds-table-row[data-row-id='row-2'][selected]", count: :any)
    )
    |> click_simulator_button("#carbon-events-simulator", "Select all")
    |> assert_has(css("#carbon-events-log", text: "[row_all_selected]", count: :any))
    |> assert_has(css("#carbon-events-table cds-table-row[selected]", count: 6))
    |> click_simulator_button("#carbon-events-simulator", "Sort by name (desc)")
    |> assert_has(css("#carbon-events-log", text: "[sorted]", count: :any))
    |> assert_has(
      css(
        "#carbon-events-table cds-table-header-cell[data-col-index='0'][sort-direction='descending']",
        count: 1
      )
    )
    |> assert_has(css("#carbon-events-table cds-table-header-row", count: 1))
    |> click_simulator_button("#carbon-events-simulator", "Search 'Balancer 1'")
    |> assert_has(css("#carbon-events-log", text: "[search]", count: :any))
    |> assert_filtered_count("#carbon-events-table", 5)
    |> click_simulator_button("#carbon-events-simulator", "Clear search")
    |> assert_filtered_count("#carbon-events-table", 0)
  end

  defp click_simulator_button(session, simulator_selector, label) do
    click(session, css("#{simulator_selector} cds-button", text: label))
  end

  defp assert_filtered_count(session, table_selector, expected) do
    Wallaby.Browser.execute_script(
      session,
      """
      return Array.from(document.querySelectorAll('#{table_selector} cds-table-row'))
        .filter((row) => row.filtered || row.hasAttribute('filtered')).length;
      """,
      fn count -> assert count == expected end
    )
  end
end
