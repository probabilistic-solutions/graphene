defmodule Demo.CloudEvents do
  @moduledoc false

  @topic "cloud:activity"

  def subscribe do
    Phoenix.PubSub.subscribe(Demo.PubSub, @topic)
  end

  def broadcast(event) do
    Phoenix.PubSub.broadcast(Demo.PubSub, @topic, {:cloud_event, event})
  end

  def topic, do: @topic
end
