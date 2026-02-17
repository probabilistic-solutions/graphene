import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
port = String.to_integer(System.get_env("TEST_PORT") || "40000")
config :demo, DemoWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: port],
  secret_key_base: "yNinMFWPy68JYjd02Z17LGgYs0Zgc7zTzKPzEdV0a01HlighxwHNCXp6j8VI7mjS",
  server: true

config :wallaby,
  otp_app: :demo,
  driver: Wallaby.Chrome

config :wallaby, :chromedriver,
  headless: true

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime

config :phoenix_live_view,
  # Enable helpful, but potentially expensive runtime checks
  enable_expensive_runtime_checks: true
