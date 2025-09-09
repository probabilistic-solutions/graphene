defmodule Graphene.CodeGen.Component.SlotTest do
  alias Graphene.CodeGen.Component.Slot
  use ExUnit.Case, async: true

  describe "Parsing" do
    test "simple" do
      data = %{
        "name" => "title-icon",
        "description" => "The icon."
      }

      res = Slot.parse(data)

      assert %Slot{name: "title-icon", atomname: ":\"s-title-icon\"", opts: [{:doc, "The icon."}]} =
               res
    end

    test "no doc" do
      data = %{
        "name" => "title-icon"
      }

      res = Slot.parse(data)
      assert %Slot{name: "title-icon", atomname: ":\"s-title-icon\"", opts: []} = res
    end
  end

  describe "Code Gen" do
    setup do
      [
        slot: %Slot{
          name: "title-icon",
          htmlname: "title-icon",
          atomname: ":\"title-icon\"",
          opts: [doc: "Info"]
        }
      ]
    end

    test "display def", %{slot: slot} do
      res = Slot.display_def(slot)
      assert res == ~S|slot :"title-icon", doc: "Info", do: attr(:tag, :string)|
    end

    test "display use", %{slot: slot} do
      res = Slot.display_use(slot)

      assert res ==
               ~S|<.dynamic_tag :for={s <- assigns[:"title-icon"]} name={Map.get(s, :tag, "div")} slot="title-icon"><%= render_slot(s) %></.dynamic_tag>|
    end
  end
end
