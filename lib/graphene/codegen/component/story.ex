if Code.ensure_loaded?(PhoenixStorybook) do
  defmodule Graphene.CodeGen.Component.Story do
    alias PhoenixStorybook.Stories.{Variation, VariationGroup}

    defmacro __using__(opts) do
      func = Keyword.fetch!(opts, :func)
      extra_variations = Keyword.get(opts, :extra_variations, [])

      quote do
        use PhoenixStorybook.Story, :component

        @func unquote(func)

        @info Keyword.take(Function.info(@func), [:module, :name])

        def function, do: @func

        def variations do
          component = @info[:module].__components__[@info[:name]]
          base_variations = Graphene.CodeGen.Component.Story.variations(component)
          Enum.concat(base_variations, unquote(extra_variations))
        end
      end
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
          %VariationGroup{
            id: attr.name,
            description: Map.get(attr, :doc, to_string(attr.name)),
            variations:
              for item <- values do
                # those ids are not garbage collected, but they
                # are trusted to not have infinite combinations
                %Variation{
                  id: String.to_atom("#{attr.name}-#{item}"),
                  attributes: %{attr.name => item},
                  slots: ["Inner"]
                }
              end
          }

        {:boolean, _} ->
          %VariationGroup{
            id: attr.name,
            description: Map.get(attr, :doc, to_string(attr.name)),
            variations: [
              %Variation{
                id: String.to_atom("#{attr.name}-true"),
                attributes: %{attr.name => true},
                slots: ["Inner"]
              },
              %Variation{
                id: String.to_atom("#{attr.name}-false"),
                attributes: %{attr.name => false},
                slots: ["Inner"]
              }
            ]
          }

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
        %Variation{
          id: String.to_atom("slots-#{i}"),
          slots:
            for s <- comb do
              slot_content(s.name)
            end
        }
      end
    end

    def variations(component) do
      [%Variation{id: :default, slots: ["Inner"]}] ++
        attr_variations(component) ++ slot_variations(component)
    end
  end
end
