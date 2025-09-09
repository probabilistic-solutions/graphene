defmodule Graphene.Icons do
  @moduledoc """
  This module provides a thin wrapper over carbon icons.

  The default size for icons is 16 unless specified directly.

  ```heex
  <Graphene.Icons.icon name="3d-cursor" />
  ```

  To specify size (one of 16, 20, 24, 32), pass it as an attribute

  ```heex
  <Graphene.Icons.icon name="3d-cursor" size={20}>
  ```

  On missing size a compile error will be raised

  Passing arbitrary attributes (including size attributes) is also supported

  ```heex
  <Graphene.Icons.icon name="3d-cursor" width="20px" height="20px">
  ```

  In this case new attributes override the defaults coming from the original svg
  """

  use Phoenix.Component
  alias Graphene.SVG

  @available_icons (if Code.loaded?(Graphene.IconsRaw) do
                      Graphene.IconsRaw.available_icons()
                    else
                      ["not_compiled"]
                    end)

  defdelegate available_icons(), to: Graphene.IconsRaw

  defp autosize(%{fit: fit} = assigns) do
    {width, height} =
      case fit do
        "height" -> {nil, "auto"}
        "width" -> {"auto", nil}
        nil -> {"#{assigns.size}px", "#{assigns.size}px"}
      end

    assigns
    |> assign_new(:width, fn -> width end)
    |> assign_new(:height, fn -> height end)
  end

  @doc """
  Renders icons by name.

  ## Examples

  ```heex
  <Graphene.Icons.icon name="3d-cursor" title="cursor">
  ```

  Check avaliable icons with `Graphene.Icons.available_icons/1`
  """
  attr :name, :string, required: true, values: @available_icons

  attr :size, :integer,
    default: 24,
    values: [16, 20, 24, 32],
    doc: "Icon default size (24), but can be one of [16, 20, 24, 32]."

  attr :fit, :string,
    default: nil,
    doc: "Make size fit the container",
    values: [nil, "width", "height"]

  attr :height, :string, required: false, doc: "Overrides the height set by `size`"
  attr :width, :string, required: false, doc: "Overrides the width set by `size`"
  attr :rest, :global, doc: "Arbitrary HTML attributes for the svg container."

  def icon(assigns) do
    assigns = assign(assigns, Graphene.IconsRaw.icon_raw(assigns.name, assigns.size)) |> autosize

    ~H"""
    <SVG.svg width={@width} height={@height} viewBox={@viewBox} {@rest}>
      <%= {:safe, @content} %>
    </SVG.svg>
    """
  end
end
