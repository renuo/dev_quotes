defmodule DevQuotes.User do
  use DevQuotes.Web, :model

  schema "users" do
    field :username, :string
    field :encrypted_password, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:username, :encrypted_password])
    |> validate_required([:username, :encrypted_password])
  end
end
