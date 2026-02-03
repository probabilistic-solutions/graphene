defmodule Graphene.IconsTest do
  use ExUnit.Case, async: true
  import Phoenix.Component
  import Phoenix.LiveViewTest
  import Graphene.Icons, only: [icon: 1]

  defp assert_icon_attributes(html, expected_attrs) do
    # Parse the SVG opening tag
    svg_start = html |> String.split("\n") |> hd()

    # Extract all attributes from the SVG tag
    attrs =
      svg_start
      |> String.replace_prefix("<svg ", "")
      |> String.replace_suffix(">", "")
      |> String.split(~r/\s+/, trim: true)
      |> Enum.map(&String.split(&1, "=", parts: 2))
      |> Map.new(fn
        [key] -> {key, true}
        [key, value] -> {key, String.trim(value, "\"")}
      end)

    # Check each expected attribute
    Enum.each(expected_attrs, fn {key, expected_value} ->
      actual_value = attrs[key]

      cond do
        is_boolean(expected_value) ->
          assert Map.has_key?(attrs, key) == expected_value,
                 "Expected attribute #{key} to #{if expected_value, do: "be present", else: "not be present"}"

        is_binary(expected_value) ->
          assert actual_value == expected_value,
                 "Expected attribute #{key} to be #{inspect(expected_value)}, got #{inspect(actual_value)}"
      end
    end)
  end

  test "icon template" do
    assigns = %{}

    html = rendered_to_string(~H"""
    <.icon name="3d-cursor" />
    """)

    assert html =~ "<svg"
    assert html =~ "viewBox=\"0 0 32 32\""
    assert_icon_attributes(html, %{
      "xmlns" => "http://www.w3.org/2000/svg",
      "width" => "24px",
      "height" => "24px",
      "aria-hidden" => true,
      "fill" => "currentColor",
    })
  end

  test "icon sizes" do
    assigns = %{}

    html_16 = rendered_to_string(~H"""
    <.icon name="3d-cursor" size={16} />
    """)

    assert_icon_attributes(html_16, %{
      "width" => "16px",
      "height" => "16px"
    })

    html_20 = rendered_to_string(~H"""
    <.icon name="3d-cursor" size={20} />
    """)

    assert_icon_attributes(html_20, %{
      "width" => "20px",
      "height" => "20px"
    })

    html_24 = rendered_to_string(~H"""
    <.icon name="3d-cursor" size={24} />
    """)

    assert_icon_attributes(html_24, %{
      "width" => "24px",
      "height" => "24px"
    })

    html_32 = rendered_to_string(~H"""
    <.icon name="3d-cursor" size={32} />
    """)

    assert_icon_attributes(html_32, %{
      "width" => "32px",
      "height" => "32px"
    })
  end

  test "icon custom size" do
    assigns = %{}

    html = rendered_to_string(~H"""
    <.icon name="3d-cursor" width="auto" height="auto" />
    """)

    assert_icon_attributes(html, %{
      "width" => "auto",
      "height" => "auto"
    })
  end

  test "icon custom attributes" do
    assigns = %{}

    html = rendered_to_string(~H"""
    <.icon name="3d-cursor" aria-hidden="false" class="icon" />
    """)

    assert_icon_attributes(html, %{
      "aria-hidden" => "false",
      "class" => "icon"
    })
  end

  test "icon aria label should set role img and remove aria-hidden" do
    assigns = %{}

    html = rendered_to_string(~H"""
    <.icon name="3d-cursor" aria-label="my-label" class="icon" />
    """)

    assert_icon_attributes(html, %{
      "aria-label" => "my-label",
      "class" => "icon",
      "role" => "img",
      "aria-hidden" => false
    })
  end

  test "icon tab index without labels does not set anything else" do
    assigns = %{}

    html = rendered_to_string(~H"""
    <.icon name="3d-cursor" tabindex="0" />
    """)

    assert_icon_attributes(html, %{
      "tabindex" => "0",
      "aria-hidden" => true,
      "role" => false,
      "focusable" => false
    })
  end

  test "icon tab index with labels sets role img other attrs" do
    assigns = %{}

    html = rendered_to_string(~H"""
    <.icon name="3d-cursor" tabindex="0" aria-label="my-label" />
    """)

    assert_icon_attributes(html, %{
      "tabindex" => "0",
      "aria-label" => "my-label",
      "role" => "img",
      "focusable" => true,
      "aria-hidden" => false
    })
  end

  test "icon title element" do
    assigns = %{}

    html = rendered_to_string(~H"""
    <.icon name="3d-cursor" tabindex="0" title="my-label" />
    """)

    assert_icon_attributes(html, %{
      "tabindex" => "0",
      "role" => "img",
      "focusable" => true,
      "aria-hidden" => false
    })

    assert html =~ "<title>my-label</title>"
  end
end
