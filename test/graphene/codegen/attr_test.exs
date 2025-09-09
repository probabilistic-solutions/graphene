defmodule Graphene.CodeGen.Component.AttrTest do
  alias Graphene.CodeGen.Component.Attr
  use ExUnit.Case, async: true

  describe "Parsing" do
    test "parse kebab case with empty default" do
      data = %{
        "default" => "\"\"",
        "description" => "The file types the file input should accept, separated by space.",
        "name" => "accept-kebab",
        "type" => "string"
      }

      res = Attr.parse(data)

      assert %Attr{
               name: "accept-kebab",
               htmlname: "accept-kebab",
               atomname: ":accept_kebab",
               type: :string,
               opts: [
                 {:default, nil},
                 {:doc, "The file types the file input should accept, separated by space."}
               ]
             } = res
    end

    test "parse camel case with empty default" do
      data = %{
        "default" => "\"\"",
        "description" => "The file types the file input should accept, separated by space.",
        "name" => "acceptCamel",
        "type" => "string"
      }

      res = Attr.parse(data)

      assert %Attr{
               name: "acceptCamel",
               htmlname: "acceptCamel",
               atomname: ":accept_camel",
               type: :string,
               opts: [
                 {:default, nil},
                 {:doc, "The file types the file input should accept, separated by space."}
               ]
             } = res
    end

    test "parse button" do
      data = %{
        "default" => "\"md\"",
        "description" => "Button size.",
        "name" => "size",
        "type" => "BUTTON_SIZE"
      }

      res = Attr.parse(data)

      assert %Attr{
               name: "size",
               type: :string,
               opts: [
                 {:default, "md"},
                 {:values, ["sm", "md", "lg", "xl", "2xl"]},
                 {:doc, "Button size."}
               ]
             } = res
    end

    test "without default" do
      data = %{
        "description" => "The file types the file input should accept, separated by space.",
        "name" => "acceptCamel",
        "type" => "string"
      }

      res = Attr.parse(data)

      assert %Attr{
               name: "acceptCamel",
               htmlname: "acceptCamel",
               atomname: ":accept_camel",
               type: :string,
               opts: [
                 {:default, nil},
                 {:doc, "The file types the file input should accept, separated by space."}
               ]
             } = res
    end
  end

  describe "code generation" do
    setup do
      attr = %Attr{
        name: "acceptCamel",
        htmlname: "acceptCamel",
        atomname: ~S|:accept_camel|,
        type: :string,
        opts: [
          {:default, nil},
          {:empty, ""},
          {:doc, "The file types the file input should accept, separated by space."}
        ]
      }

      [attr: attr]
    end

    test "example def", %{attr: attr} do
      assert Attr.display_def(attr) ==
               ~S|attr :accept_camel, :string, default: nil, empty: "", doc: "The file types the file input should accept, separated by space."|
    end

    test "example use", %{attr: attr} do
      assert Attr.display_use(attr) == ~S|acceptCamel={assigns[:accept_camel]}|
    end
  end
end
