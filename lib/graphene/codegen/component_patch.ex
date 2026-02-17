defmodule Graphene.CodeGen.ComponentPatches do
  @moduledoc """
  Known Patches for components code generation
  """
  alias Graphene.CodeGen.Component
  alias Graphene.CodeGen.Component.{Attr, Slot}

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
          htmltag: "cds-menu-item",
          componentname: componentname,
          docs: docs,
          source: "./src/components/menu/menu-item-selectable.ts"
        } = component
      ) do
    # in the documentation builder there is a bug with docs
    # realname is "cds-menu-item-selectable"
    # https://github.com/carbon-design-system/carbon/issues/21426
    %{
      component
      | htmltag: "cds-menu-item-selectable",
        componentname: componentname <> "_selectable",
        docs: String.replace(docs, "<cds-menu-item>", "<cds-menu-item-selectable>")
    }
  end

  def patch(
        %{
          htmltag: "cds-fluid-textarea",
          componentname: componentname,
          docs: docs,
          source: "./src/components/fluid-textarea/fluid-textarea-skeleton.ts"
        } = component
      ) do
    # in the documentation builder there is a bug with docs
    # realname is "cds-fluid-textarea-skeleton"
    # https://github.com/carbon-design-system/carbon/issues/21425
    %{
      component
      | htmltag: "cds-fluid-textarea-skeleton",
        componentname: componentname <> "_skeleton",
        docs: String.replace(docs, "<cds-fluid-textarea>", "<cds-fluid-textarea-skeleton>")
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

  def patch(%{htmltag: "cds-number-input"} = component) do
    set_step_default(component)
  end

  def patch(%{htmltag: "cds-fluid-number-input"} = component) do
    set_step_default(component)
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

  def patch(%{htmltag: "cds-table-row"} = component) do
    ensure_attr(
      component,
      %{
        "name" => "radio",
        "type" => "boolean",
        "default" => "false",
        "description" => "Specify whether the control should be a radio button or inline checkbox."
      }
    )
  end

  def patch(component), do: component

  @manual_components [
    %Component{
      htmltag: "cds-menu",
      componentname: "menu",
      source: "./src/components/menu/menu.ts",
      docs: """
      Component `<cds-menu>` from `./src/components/menu/menu.ts`

      Menu.
      """,
      attrs: [],
      slots: []
    }
  ]

  def append_missing_components(components) do
    Enum.reduce(@manual_components, components, fn component, acc ->
      if Enum.any?(acc, &(&1.htmltag == component.htmltag)) do
        acc
      else
        acc ++ [component]
      end
    end)
  end

  defp set_step_default(component) do
    %{component | attrs: Enum.map(component.attrs, &set_step_attr_default/1)}
  end

  defp ensure_attr(component, %{"name" => name} = attr) do
    exists? = Enum.any?(component.attrs, &(&1.htmlname == name))

    if exists? do
      component
    else
      %{component | attrs: component.attrs ++ [Attr.parse(attr)]}
    end
  end

  defp set_step_attr_default(%{htmlname: "step"} = attr) do
    %{attr | opts: Keyword.put(attr.opts, :default, "1")}
  end

  defp set_step_attr_default(attr), do: attr
end
