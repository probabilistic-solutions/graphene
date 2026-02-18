defmodule DemoWeb.StorybookAssetsController do
  use DemoWeb, :controller

  def fonts(conn, _params) do
    redirect(conn, to: "/storybook/assets/css/phoenix_storybook_fonts.css")
  end
end
