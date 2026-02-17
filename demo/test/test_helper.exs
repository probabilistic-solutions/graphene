chrome_bin =
  System.get_env("CHROME_BIN") ||
    System.find_executable("google-chrome") ||
    System.find_executable("chromium") ||
    System.find_executable("chromium-browser")

chromedriver_bin =
  System.get_env("CHROMEDRIVER_BIN") ||
    System.find_executable("chromedriver")

chrome_ready? = is_binary(chrome_bin) and is_binary(chromedriver_bin)
storybook_js = Path.join(:code.priv_dir(:demo), "static/assets/js/storybook.js")
storybook_assets_ready? = File.exists?(storybook_js)

wallaby_enabled? = chrome_ready? and storybook_assets_ready?

ExUnit.start(exclude: if(wallaby_enabled?, do: [], else: [wallaby: true]))

if wallaby_enabled? do
  config = Application.get_env(:wallaby, :chromedriver, [])

  Application.put_env(:wallaby, :chromedriver,
    config
    |> Keyword.put_new(:binary, chrome_bin)
    |> Keyword.put_new(:path, chromedriver_bin)
  )

  {:ok, _} = Application.ensure_all_started(:demo)

  http_config = DemoWeb.Endpoint.config(:http) || []
  port = Keyword.get(http_config, :port, 40000)
  Application.put_env(:wallaby, :base_url, "http://localhost:#{port}")

  {:ok, _} = Application.ensure_all_started(:wallaby)
else
  missing =
    []
    |> then(fn acc ->
      if chrome_ready?,
        do: acc,
        else: ["Chrome/Chromedriver not found. Set CHROME_BIN and CHROMEDRIVER_BIN to enable browser tests." | acc]
    end)
    |> then(fn acc ->
      if storybook_assets_ready?,
        do: acc,
        else: ["Storybook assets are required at #{storybook_js}. Run `cd demo && mix assets.build`." | acc]
    end)
    |> Enum.reverse()

  IO.puts("""
  Wallaby disabled:
  #{Enum.join(missing, "\n")}
  """)
end
