defmodule Graphene.SVG do
  use Phoenix.Component

  slot :inner_block,
    required: true,
    doc: "SVG content"

  attr :viewBox,
       :string,
       required: true,
       doc: "SVG rendering area"

  attr :"aria-label",
       :string,
       required: false,
       default: nil,
       doc: "The aria-label attribute defines a string value that labels an interactive element."

  attr :title,
       :string,
       required: false,
       default: nil

  attr :"aria-labelledby",
       :string,
       required: false,
       default: nil,
       doc:
         "The aria-labelledby attribute identifies the element (or elements) that labels the element it is applied to."

  attr :tabindex, :integer, required: false, default: nil
  attr :rest, :global, default: %{preserveAspectRatio: "xMidYMid meet", fill: "currentColor"}

  def svg(assigns) do
    defaults = defaults_for_svg(assigns)
    assigns = assign(assigns, :rest, Map.merge(defaults, assigns.rest))

    ~H"""
    <svg
      xmlns="http://www.w3.org/2000/svg"
      viewBox={@viewBox}
      aria-label={assigns[:"aria-label"]}
      aria-labelledby={assigns[:"aria-labelledby"]}
      tabindex={@tabindex}
      {@rest}
    >
      <%= if not is_nil(@title) do %>
        <title>{@title}</title>
      <% end %>
      {render_slot(@inner_block)}
    </svg>
    """
  end

  defp defaults_for_svg(assigns) do
    # just follow the carbon logic to provide these defaults
    # https://github.com/carbon-design-system/carbon/blob/6ef74406eda447bc80998ff2260beefe8a559048/packages/icon-helpers/src/getAttributes.ts#L38
    case assigns do
      %{"aria-label": nil, "aria-labelledby": nil, title: nil} ->
        %{role: nil, focusable: nil, "aria-hidden": true}

      %{tabindex: index, "aria-label": label, "aria-labelledby": labelledby, title: title}
      when not is_nil(index) and
             (not is_nil(label) or not is_nil(labelledby) or not is_nil(title)) ->
        %{role: "img", focusable: true, "aria-hidden": nil}

      _ ->
        %{role: "img", focusable: false, "aria-hidden": nil}
    end
  end
end
