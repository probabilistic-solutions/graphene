defmodule DemoWeb.CloudHelpers do
  @moduledoc false

  def format_money(amount) when is_integer(amount) do
    amount
    |> Integer.to_string()
    |> String.replace(~r/\B(?=(\d{3})+(?!\d))/, ",")
    |> then(&"$#{&1}")
  end

  def format_percent(value) when is_float(value) do
    value
    |> Float.round(2)
    |> :erlang.float_to_binary(decimals: 2)
    |> Kernel.<>("%")
  end

  def format_percent(value) when is_integer(value), do: "#{value}%"

  def status_kind("Healthy"), do: "green"
  def status_kind("Applied"), do: "green"
  def status_kind("Completed"), do: "green"
  def status_kind("Resolved"), do: "green"
  def status_kind("Monitoring"), do: "blue"
  def status_kind("Investigating"), do: "magenta"
  def status_kind("Degraded"), do: "red"
  def status_kind("Maintenance"), do: "warm-gray"
  def status_kind("Queued"), do: "cool-gray"
  def status_kind("Needs Review"), do: "orange"
  def status_kind("Passing"), do: "green"
  def status_kind(_), do: "gray"

  def severity_kind("Critical"), do: "red"
  def severity_kind("High"), do: "magenta"
  def severity_kind("Medium"), do: "orange"
  def severity_kind("Low"), do: "blue"
  def severity_kind("Info"), do: "cool-gray"
  def severity_kind(_), do: "gray"

  def delta_label(change) when is_number(change) and change >= 0 do
    "+#{Float.round(change, 1)}%"
  end

  def delta_label(change) when is_number(change) do
    "#{Float.round(change, 1)}%"
  end
end
