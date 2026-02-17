defmodule Storybook.CarbonComponents.PageHeader do
  use PhoenixStorybook.Story, :component

  def function, do: &Graphene.CarbonComponents.page_header/1

  def variations do
    [
      %Variation{
        id: :default,
        slots: [
          ~S|<:breadcrumb>
  <Graphene.CarbonComponents.breadcrumb>
    <:item href="#">Home</:item>
    <:item current>Page</:item>
  </Graphene.CarbonComponents.breadcrumb>
</:breadcrumb>
<:content title="Page title" />
<:content_text subtitle="Optional subtitle">
  This is a short supporting description for the page header.
</:content_text>|
        ]
      },
      %Variation{
        id: :with_actions,
        slots: [
          ~S|<:breadcrumb>
  <Graphene.CarbonComponents.breadcrumb>
    <:item href="#">Home</:item>
    <:item href="#">Workspace</:item>
    <:item current>Projects</:item>
  </Graphene.CarbonComponents.breadcrumb>
</:breadcrumb>
<:content title="Projects">
  <Graphene.CarbonComponents.button kind="ghost">New project</Graphene.CarbonComponents.button>
</:content>
<:content_text subtitle="Team projects">
  Manage shared initiatives for your team.
</:content_text>|
        ]
      },
      %Variation{
        id: :compact,
        slots: [
          ~S|<:breadcrumb border={false}>
  <Graphene.CarbonComponents.breadcrumb>
    <:item href="#">Home</:item>
    <:item current>Settings</:item>
  </Graphene.CarbonComponents.breadcrumb>
</:breadcrumb>
<:content title="Settings" />
<:content_text subtitle="Account">
  Update profile and security preferences.
</:content_text>|
        ]
      }
    ]
  end
end
