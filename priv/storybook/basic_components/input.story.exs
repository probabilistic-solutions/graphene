defmodule Storybook.BasicComponents.Input do
  use PhoenixStorybook.Story, :component

  def function, do: &Graphene.BasicComponents.input/1

  def variations do
    [
      %Variation{
        id: :text,
        attributes: %{name: "name", label: "Name", value: "Ada"}
      },
      %Variation{
        id: :email,
        attributes: %{name: "email", type: "email", label: "Email", value: "ada@example.com"}
      },
      %Variation{
        id: :password,
        attributes: %{name: "password", type: "password", label: "Password", value: "secret"}
      },
      %Variation{
        id: :textarea,
        attributes: %{name: "bio", type: "textarea", label: "Bio", value: "I love Carbon."}
      },
      %Variation{
        id: :search,
        attributes: %{name: "query", type: "search", label: "Search", value: "Graphene"}
      },
      %Variation{
        id: :number,
        attributes: %{name: "count", type: "number", label: "Count", value: 3}
      },
      %Variation{
        id: :checkbox,
        attributes: %{
          name: "subscribe",
          type: "checkbox",
          label: "Subscribe",
          checked: true,
          value: true
        }
      },
      %Variation{
        id: :select,
        attributes: %{
          name: "role",
          type: "select",
          label: "Role",
          prompt: "Choose a role",
          options: [Admin: "admin", User: "user"],
          value: "admin"
        }
      },
      %Variation{
        id: :errors,
        attributes: %{name: "required", label: "Required", errors: ["can't be blank"]}
      }
    ]
  end
end
