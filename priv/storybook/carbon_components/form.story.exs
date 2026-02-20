defmodule Storybook.CarbonComponents.Form do
  use PhoenixStorybook.Story, :example
  import Graphene.CarbonComponents
  def doc do
    """
Forms collect and submit related inputs. Keep fields grouped by intent and use
clear labels to reduce friction.

Combine .form with .form_group, .button, and validation helpers like
.inline_notification or field-level error text.
"""
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div style="display: grid; gap: 2rem;">
      <Graphene.CarbonComponents.form>
        <Graphene.CarbonComponents.text_input id="form-name" name="name" value="Ada Lovelace">
          <:label_text>Name</:label_text>
        </Graphene.CarbonComponents.text_input>
        <Graphene.CarbonComponents.text_input id="form-role" name="role" value="Engineer">
          <:label_text>Role</:label_text>
        </Graphene.CarbonComponents.text_input>
        <Graphene.CarbonComponents.button type="submit">Submit</Graphene.CarbonComponents.button>
      </Graphene.CarbonComponents.form>

      <Graphene.CarbonComponents.form>
        <Graphene.CarbonComponents.text_input id="form-email" name="email" value="ada@graphene.dev" type="email">
          <:label_text>Email</:label_text>
        </Graphene.CarbonComponents.text_input>
        <Graphene.CarbonComponents.password_input id="form-password" name="password" value="password">
          <:label_text>Password</:label_text>
        </Graphene.CarbonComponents.password_input>
        <Graphene.CarbonComponents.button kind="secondary" type="submit">Create account</Graphene.CarbonComponents.button>
      </Graphene.CarbonComponents.form>
    </div>
    """
  end
end
