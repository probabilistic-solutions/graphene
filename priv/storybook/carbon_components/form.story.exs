defmodule Storybook.CarbonComponents.Form do
  use PhoenixStorybook.Story, :example

  import Graphene.CarbonComponents

  def doc do
    "Form."
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div style="display: grid; gap: 2rem;">
      <Graphene.CarbonComponents.form>
        <.text_input value="Ada Lovelace">
          <:s-label-text>Name</:s-label-text>
        </.text_input>
        <.text_input value="Engineer">
          <:s-label-text>Role</:s-label-text>
        </.text_input>
        <.button type="submit">Submit</.button>
      </Graphene.CarbonComponents.form>

      <Graphene.CarbonComponents.form>
        <.text_input value="ada@graphene.dev" type="email">
          <:s-label-text>Email</:s-label-text>
        </.text_input>
        <.password_input value="password">
          <:s-label-text>Password</:s-label-text>
        </.password_input>
        <.button kind="secondary" type="submit">Create account</.button>
      </Graphene.CarbonComponents.form>
    </div>
    """
  end
end
