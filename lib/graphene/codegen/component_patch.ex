defmodule Graphene.CodeGen.ComponentPatches do
  @moduledoc """
  Known Patches for components code generation
  """
  alias Graphene.CodeGen.Component.Slot

  def patch(
        %{
          htmltag: "cds-checkbox",
          componentname: componentname,
          docs: docs,
          source: "./src/components/checkbox/checkbox-group.ts"
        } = component
      ) do
    # in the documentation builder there is a clush with checkbox
    # realname is "cds-checkbox-group"
    # https://github.com/carbon-design-system/carbon-for-ibm-dotcom/issues/11883
    %{
      component
      | htmltag: "cds-checkbox-group",
        componentname: componentname <> "_group",
        docs: String.replace(docs, "<cds-checkbox>", "<cds-checkbox-group>")
    }
  end

  def patch(
        %{
          htmltag: "cds-popover",
          componentname: componentname,
          docs: docs,
          source: "./src/components/popover/popover-content.ts"
        } = component
      ) do
    # in the documentation builder there is a clush with popover
    # realname is "cds-popover-content"
    # https://github.com/carbon-design-system/carbon-for-ibm-dotcom/issues/11884
    %{
      component
      | htmltag: "cds-popover-content",
        componentname: componentname <> "_content",
        docs: String.replace(docs, "<cds-popover>", "<cds-popover-content>")
    }
  end

  def patch(%{htmltag: "cds-copy"} = component) do
    %{component | import: "./src/components/copy/copy.js"}
  end

  def patch(%{htmltag: "cds-button", slots: []} = component) do
    %{component | slots: [Slot.parse(%{"name" => "icon", "description" => "Icon."})]}
  end

  def patch(%{htmltag: "cds-table", slots: []} = component) do
    %{
      component
      | slots: [
          Slot.parse(%{"name" => "title", "description" => "Title"}),
          Slot.parse(%{"name" => "description", "description" => "Description"}),
          Slot.parse(%{"name" => "toolbar", "description" => "Toolbar"})
        ]
    }
  end

  def patch(component), do: component
end
