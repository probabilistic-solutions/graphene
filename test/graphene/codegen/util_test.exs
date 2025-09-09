defmodule Graphene.CodeGen.UtilTest do
  use ExUnit.Case

  alias Graphene.CodeGen.Util

  describe "snake2kebab/1" do
    test "converts snake_case to kebab-case" do
      assert Util.snake2kebab("snake_case_example") == "snake-case-example"
    end
  end

  describe "kebab2camel/1" do
    test "converts kebab-case to camelCase" do
      assert Util.kebab2camel("kebab-case-example") == "kebabCaseExample"
    end
  end

  describe "camel2snake/1" do
    test "converts camelCase to snake_case" do
      assert Util.camel2snake("camelCaseExample") == "camel_case_example"
    end
  end

  describe "camel2kebab/1" do
    test "converts camelCase to kebab-case" do
      assert Util.camel2kebab("camelCaseExample") == "camel-case-example"
    end
  end

  describe "kebab2snake/1" do
    test "converts kebab-case to snake_case" do
      assert Util.kebab2snake("kebab-case-example") == "kebab_case_example"
    end
  end
end
