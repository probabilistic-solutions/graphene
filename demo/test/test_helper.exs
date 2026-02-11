chrome_bin =
  System.get_env("CHROME_BIN") ||
    System.find_executable("google-chrome") ||
    System.find_executable("chromium") ||
    System.find_executable("chromium-browser")

chromedriver_bin =
  System.get_env("CHROMEDRIVER_BIN") ||
    System.find_executable("chromedriver")

wallaby_enabled? = is_binary(chrome_bin) and is_binary(chromedriver_bin)

ExUnit.start(exclude: if(wallaby_enabled?, do: [], else: [wallaby: true]))

if wallaby_enabled? do
  config = Application.get_env(:wallaby, :chromedriver, [])

  Application.put_env(:wallaby, :chromedriver,
    config
    |> Keyword.put_new(:binary, chrome_bin)
    |> Keyword.put_new(:path, chromedriver_bin)
  )

  {:ok, _} = Application.ensure_all_started(:wallaby)
else
  IO.puts("""
  Wallaby disabled: Chrome/Chromedriver not found.
  Set CHROME_BIN and CHROMEDRIVER_BIN to enable browser tests.
  """)
end
