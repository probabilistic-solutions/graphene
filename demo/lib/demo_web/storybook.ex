defmodule DemoWeb.Storybook do
  use PhoenixStorybook,
    otp_app: :demo,
    content_path: Path.join(:code.priv_dir(:graphene), "storybook"),
    js_script_type: "module",
    # NOTE: this is useful for class autoprefixer, unused so far
    sandbox_class: "demo-sandbox"
end
