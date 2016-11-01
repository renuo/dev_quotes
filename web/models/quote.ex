defmodule DevQuotes.Quote do
  use DevQuotes.Web, :model

  schema "quotes" do
    field :text, :string
    field :source, :string
    belongs_to :user, DevQuotes.User

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:text, :source])
    |> validate_required([:text, :source])
  end
end
