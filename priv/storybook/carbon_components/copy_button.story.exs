defmodule Storybook.CarbonComponents.CopyButton do
  use PhoenixStorybook.Story, :component

  defoverridable doc: 0

  def function, do: &Graphene.CarbonComponents.copy_button/1

  def doc do
    Storybook.Doc.markdown("""
Copy buttons provide a single-purpose control to copy text to the clipboard.
Use them next to read-only values like IDs, tokens, or URLs.

Pair .copy_button with .code_snippet or a read-only .text_input and provide
feedback via .toast_notification or .inline_notification.
""")
  end

  

  def variations do
    [
      %Variation{
        id: :default,
        slots: ["Copy"]
      },
      %Variation{
        id: :top_align,
        attributes: %{align: "top"},
        slots: ["Copy"]
      },
      %Variation{
        id: :disabled,
        attributes: %{disabled: true, feedback: "Copied"},
        slots: ["Copy"]
      }
    ]
  end
end
