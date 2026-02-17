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
        <.text_input id="form-name" name="name" value="Ada Lovelace">
          <:s-label-text>Name</:s-label-text>
        </.text_input>
        <.text_input id="form-role" name="role" value="Engineer">
          <:s-label-text>Role</:s-label-text>
        </.text_input>
        <.button type="submit">Submit</.button>
      </Graphene.CarbonComponents.form>

      <Graphene.CarbonComponents.form>
        <.text_input id="form-email" name="email" value="ada@graphene.dev" type="email">
          <:s-label-text>Email</:s-label-text>
        </.text_input>
        <.password_input id="form-password" name="password" value="password">
          <:s-label-text>Password</:s-label-text>
        </.password_input>
        <.button kind="secondary" type="submit">Create account</.button>
      </Graphene.CarbonComponents.form>
    </div>
    """
  end
end
