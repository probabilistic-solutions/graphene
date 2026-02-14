defmodule DemoWeb.ErrorJSON do
  @moduledoc false

  # For API errors we keep the default JSON status message.
  def render(template, _assigns) do
    %{errors: %{detail: Phoenix.Controller.status_message_from_template(template)}}
  end
end
