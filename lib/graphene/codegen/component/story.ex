defmodule Graphene.CodeGen.Component.Story do
  defmacro __using__(opts) do
    func = Keyword.fetch!(opts, :func)
    extra_variations = Keyword.get(opts, :extra_variations, [])

    quote do
      if Code.ensure_loaded?(PhoenixStorybook.Story) do
        use PhoenixStorybook.Story, :component
      else
        raise "PhoenixStorybook is required to use Graphene.CodeGen.Component.Story"
      end

      @func unquote(func)

      @info Keyword.take(Function.info(@func), [:module, :name])

      def function, do: @func

      def variations do
        component = @info[:module].__components__()[@info[:name]]
        base_variations = Graphene.CodeGen.Component.Story.variations(component)
        Enum.concat(base_variations, unquote(extra_variations))
      end
    end
  end

  defp variation(attrs) do
    struct!(PhoenixStorybook.Stories.Variation, attrs)
  end

  defp variation_group(attrs) do
    struct!(PhoenixStorybook.Stories.VariationGroup, attrs)
  end

  defp attr_value_key(value) do
    if is_nil(value), do: "nil", else: to_string(value)
  end

  defp slot_content(:"s-icon") do
    ~S|<:s-icon><Graphene.Icons.icon fit="width" name="analytics"/></:s-icon>|
  end

  defp slot_content(:inner_block) do
    "Inner"
  end

  defp slot_content(slot) do
    content =
      slot
      |> to_string
      |> String.replace_prefix("s-", "")
      |> String.capitalize()

    "<:#{slot}>#{content}</:#{slot}>"
  end

  defp attr_variation_groups(attr) do
    case {attr.type, Keyword.get(Map.get(attr, :opts, []), :values)} do
      {_, values} when not is_nil(values) ->
        values = Enum.uniq_by(values, &attr_value_key/1)

        variation_group(%{
          id: attr.name,
          description: Map.get(attr, :doc, to_string(attr.name)),
          variations:
            for item <- values do
              # those ids are not garbage collected, but they
              # are trusted to not have infinite combinations
              variation(%{
                id: String.to_atom("#{attr.name}-#{attr_value_key(item)}"),
                attributes: %{attr.name => item},
                slots: ["Inner"]
              })
            end
        })

      {:boolean, _} ->
        variation_group(%{
          id: attr.name,
          description: Map.get(attr, :doc, to_string(attr.name)),
          variations: [
            variation(%{
              id: String.to_atom("#{attr.name}-true"),
              attributes: %{attr.name => true},
              slots: ["Inner"]
            }),
            variation(%{
              id: String.to_atom("#{attr.name}-false"),
              attributes: %{attr.name => false},
              slots: ["Inner"]
            })
          ]
        })

      _ ->
        nil
    end
  end

  defp attr_variations(component) do
    Map.get(component, :attrs, [])
    |> Stream.map(&attr_variation_groups/1)
    |> Enum.reject(&is_nil/1)
    |> List.flatten()
  end

  defp slot_variations(component) do
    slots = Map.get(component, :slots, [])

    for {comb, i} <- Enum.with_index(:lib_combin.cnr_all(slots)) do
      variation(%{
        id: String.to_atom("slots-#{i}"),
        slots:
          for s <- comb do
            slot_content(s.name)
          end
      })
    end
  end

  def variations(component) do
    [variation(%{id: :default, slots: ["Inner"]})] ++
      attr_variations(component) ++ slot_variations(component)
  end
end
