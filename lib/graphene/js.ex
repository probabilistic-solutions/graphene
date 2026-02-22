defmodule Graphene.JS do
  @moduledoc """
  Helpers for wiring custom DOM events to LiveView hooks and Phoenix.JS commands.

  This module returns attribute maps that you can splat into components:

      <Product.tearsheet
        id="ts-1"
        {Graphene.JS.events(
          on: %{
            "c4p-tearsheet-closed" => [
              push: "tearsheet:closed",
              payload: :detail,
              js: JS.remove_attribute("open", to: "#ts-1")
            ]
          }
        )}
      />
  """

  alias Phoenix.LiveView.JS, as: LVJS

  @type event_name :: String.t() | atom()
  @type payload_spec ::
          :detail
          | :target
          | :all
          | {:merge, list()}
          | map()
          | list()

  @doc """
  Builds attributes for the `GrapheneCustomEvents` hook.

  ## Options

    * `:id` - Optional DOM id. Required by LiveView when `phx-hook` is present.
      If you already set `id` on the element, you can omit it here.
    * `:target` - CSS selector for the elements emitting events. Defaults to the hooked element.
    * `:on` - A list of event names or a map of event name => options.
      When a list is given, top-level `:push`, `:payload`, and `:js` apply to all events.
    * `:push` - Event name to push to the server.
    * `:payload` - Dynamic payload strategy (`:detail`, `:target`, `:all`, or `{:merge, [...]}`).
    * `:js` - `Phoenix.LiveView.JS` pipeline to run client-side before push.
    * `:push_target` / `:phx_target` - Optional target for `pushEventTo`.
  """
  @spec events(map() | keyword()) :: map()
  def events(opts) when is_list(opts) or is_map(opts) do
    opts = normalize_opts(opts)
    on = fetch_opt(opts, :on) || fetch_opt(opts, :events) || []

    defaults = %{
      push: fetch_opt(opts, :push),
      payload: fetch_opt(opts, :payload),
      js: fetch_opt(opts, :js),
      push_target: fetch_opt(opts, :push_target) || fetch_opt(opts, :phx_target)
    }

    events =
      on
      |> normalize_on(defaults)
      |> Jason.encode!()

    attrs =
      %{
        "phx-hook" => "GrapheneCustomEvents",
        "data-events" => events
      }
      |> maybe_put("id", fetch_opt(opts, :id))
      |> maybe_put("data-target-selector", normalize_dom_target(fetch_opt(opts, :target)))

    attrs
  end

  defp normalize_opts(opts) when is_list(opts), do: Map.new(opts)
  defp normalize_opts(opts) when is_map(opts), do: opts

  defp fetch_opt(opts, key) when is_map(opts) do
    Map.get(opts, key) || Map.get(opts, Atom.to_string(key))
  end

  defp normalize_on(on, defaults) when is_list(on) and on != [] do
    if Keyword.keyword?(on) do
      Enum.map(on, fn {event, event_opts} -> build_event(event, event_opts, defaults) end)
    else
      Enum.map(on, fn event -> build_event(event, %{}, defaults) end)
    end
  end

  defp normalize_on(on, defaults) when is_map(on) do
    Enum.map(on, fn {event, event_opts} -> build_event(event, event_opts, defaults) end)
  end

  defp normalize_on(_on, _defaults), do: []

  defp build_event(event, event_opts, defaults) do
    event_opts = normalize_event_opts(event_opts)
    merged = Map.merge(defaults, event_opts)

    %{}
    |> Map.put("name", normalize_event_name(event))
    |> maybe_put("push", normalize_event_name(fetch_opt(merged, :push)))
    |> maybe_put("payload", normalize_payload(fetch_opt(merged, :payload)))
    |> maybe_put("js", encode_js(fetch_opt(merged, :js)))
    |> maybe_put("push_target", normalize_push_target(fetch_opt(merged, :push_target)))
  end

  defp normalize_event_opts(nil), do: %{}
  defp normalize_event_opts(opts) when is_list(opts), do: Map.new(opts)
  defp normalize_event_opts(opts) when is_map(opts), do: opts
  defp normalize_event_opts(_opts), do: %{}

  defp normalize_event_name(nil), do: nil
  defp normalize_event_name(event) when is_atom(event), do: Atom.to_string(event)
  defp normalize_event_name(event) when is_binary(event), do: event
  defp normalize_event_name(event), do: to_string(event)

  defp normalize_payload(nil), do: nil

  defp normalize_payload({:merge, list}) when is_list(list),
    do: %{merge: Enum.map(list, &normalize_payload/1)}

  defp normalize_payload(list) when is_list(list),
    do: Enum.map(list, &normalize_payload/1)

  defp normalize_payload(payload) when is_atom(payload), do: Atom.to_string(payload)
  defp normalize_payload(payload) when is_map(payload), do: payload
  defp normalize_payload(payload), do: payload

  defp normalize_dom_target(nil), do: nil
  defp normalize_dom_target(:self), do: nil
  defp normalize_dom_target(target) when is_binary(target), do: target
  defp normalize_dom_target(target) when is_atom(target), do: Atom.to_string(target)
  defp normalize_dom_target(target), do: to_string(target)

  defp normalize_push_target(nil), do: nil
  defp normalize_push_target(target) when is_binary(target), do: target
  defp normalize_push_target(target) when is_integer(target), do: target
  defp normalize_push_target(target), do: to_string(target)

  defp encode_js(nil), do: nil
  defp encode_js(%LVJS{} = js) do
    js
    |> Phoenix.HTML.Safe.to_iodata()
    |> IO.iodata_to_binary()
  end
  defp encode_js(js) when is_binary(js), do: js
  defp encode_js(js) when is_list(js), do: Jason.encode!(js)
  defp encode_js(js), do: Phoenix.HTML.safe_to_string(js)

  defp maybe_put(map, _key, nil), do: map
  defp maybe_put(map, key, value), do: Map.put(map, key, value)
end
