defmodule DemoWeb.ErrorHTML do
  @moduledoc false

  use DemoWeb, :html

  # Render a plain status message for all error templates.
  def render(template, _assigns) do
    Phoenix.Controller.status_message_from_template(template)
  end
end
