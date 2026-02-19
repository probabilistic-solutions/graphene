defmodule Storybook.BasicComponents.Input do
  use PhoenixStorybook.Story, :component
  use Graphene, [:html, :live]

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
        id: :color,
        attributes: %{name: "favorite_color", type: "color", label: "Color", value: "#0f62fe"}
      },
      %Variation{
        id: :date,
        attributes: %{name: "date", type: "date", label: "Date", value: "2024-12-31"}
      },
      %Variation{
        id: :datetime_local,
        attributes: %{
          name: "meeting",
          type: "datetime-local",
          label: "Datetime",
          value: "2024-12-31T09:30"
        }
      },
      %Variation{
        id: :tel,
        attributes: %{name: "phone", type: "tel", label: "Phone", value: "+1 555 123 4567"}
      },
      %Variation{
        id: :url,
        attributes: %{
          name: "website",
          type: "url",
          label: "Website",
          value: "https://example.com"
        }
      },
      %Variation{
        id: :time,
        attributes: %{name: "time", type: "time", label: "Time", value: "13:45"}
      },
      %Variation{
        id: :week,
        attributes: %{name: "week", type: "week", label: "Week", value: "2024-W52"}
      },
      %Variation{
        id: :file,
        attributes: %{
          name: "attachment",
          type: "file",
          label: "Upload CV",
          prompt: "PDF or DOCX",
          accept: ".pdf,.doc,.docx",
          errors: ["Please choose a file"]
        }
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
