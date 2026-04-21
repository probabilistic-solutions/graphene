defmodule Graphene.FormComponentsTest do
  use ExUnit.Case, async: true

  import Phoenix.LiveViewTest

  defp form(value) do
    Phoenix.Component.to_form(%{"enabled" => value}, as: :settings)
  end

  test "text_input renders form-associated tag" do
    html =
      render_component(&Graphene.Internal.FormComponents.text_input/1, %{id: "name", name: "name"})

    assert html =~ "<cds-text-input-form"
    refute html =~ "type=\"hidden\""
  end

  test "checkbox renders form-associated tag" do
    html =
      render_component(&Graphene.Internal.FormComponents.checkbox/1, %{id: "terms", name: "terms"})

    assert html =~ "<cds-checkbox-form"
    refute html =~ "type=\"hidden\""
  end

  test "checkbox uses the form field value when checked is not explicitly given" do
    html =
      render_component(&Graphene.Internal.FormComponents.checkbox/1, %{
        field: form(true)[:enabled]
      })

    assert html =~ "<cds-checkbox-form"
    assert html =~ " checked"
  end

  test "checkbox respects an explicit checked override with a form field" do
    html =
      render_component(&Graphene.Internal.FormComponents.checkbox/1, %{
        field: form(true)[:enabled],
        checked: false
      })

    refute html =~ " checked"
  end

  test "toggle uses the form field value when toggled is not explicitly given" do
    html =
      render_component(&Graphene.Internal.FormComponents.toggle/1, %{field: form(true)[:enabled]})

    assert html =~ "<cds-toggle-form"
    assert html =~ " checked"
    assert html =~ " toggled"
  end

  test "toggle respects an explicit toggled override with a form field" do
    html =
      render_component(&Graphene.Internal.FormComponents.toggle/1, %{
        field: form(true)[:enabled],
        toggled: false
      })

    refute html =~ " checked"
    refute html =~ " toggled"
  end
end
