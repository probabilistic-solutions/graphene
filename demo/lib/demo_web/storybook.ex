defmodule DemoWeb.Storybook do
  use PhoenixStorybook,
    otp_app: :demo_web,
    content_path: Path.join(:code.priv_dir(:graphene), "storybook"),
    # assets path are remote path, not local file-system paths
    css_path: "/assets/css/storybook.css",
    js_path: "/assets/js/storybook.js",
    # NOTE: this is useful for class autoprefixer, unused so far
    sandbox_class: "demo-sandbox"
end
