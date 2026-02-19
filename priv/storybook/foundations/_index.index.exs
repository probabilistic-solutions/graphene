defmodule Storybook.FoundationsIndex do
  use PhoenixStorybook.Index

  def folder_name, do: "Foundations"
  def folder_icon, do: {:fa, "compass", :light, "psb-mr-1"}
  def folder_open?, do: true
  def folder_index, do: 1
end

