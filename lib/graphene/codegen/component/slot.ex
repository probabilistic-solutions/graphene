defmodule Graphene.CodeGen.Component.Slot do
  @enforce_keys [:name, :htmlname, :atomname]
  defstruct [:name, :htmlname, :atomname, opts: [], deprecated: false]

  alias Graphene.CodeGen.Util

  def parse(%{"name" => name} = data) do
    htmlname = Util.camel2kebab(name)

    opts =
      case Map.get(data, "description") do
        nil -> []
        doc -> [doc: doc]
      end

    struct(
      __MODULE__,
      name: name,
      htmlname: htmlname,
      atomname: Util.atom_repr("s-" <> htmlname),
      opts: opts
    )
  end

  @doc """
  Slot representation as a string when used within the Phoenix.Component module

  TODO: better handging of opts because some named opts (e.g. :"bad-name") may be represented incorrectly
  """
  def display_def(slot, opts \\ []) do
    template =
      ~S|slot <%= @slot.atomname %><%= for {name, opt} <- @slot.opts do %>, <%= to_string(name) %>: <%= inspect(opt, binaries: :as_strings) %><% end %>, do: attr(:tag, :string)|

    EEx.eval_string(template, [assigns: [slot: slot]], opts)
  end

  def display_use(slot, opts \\ []) do
    template =
      ~S|<.dynamic_tag :for={s <- assigns[<%= @slot.atomname %>]} tag_name={Map.get(s, :tag, "div")} slot=<%= inspect(@slot.htmlname) %>><%%= render_slot(s) %></.dynamic_tag>|

    EEx.eval_string(template, [assigns: [slot: slot]], opts)
  end
end
