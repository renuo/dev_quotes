defmodule DevQuotes.User do
  use DevQuotes.Web, :model

  schema "users" do
    field :email, :string
    field :encrypted_password, :string
    field :github_id, :string
    field :stackoverflow_id, :string
    field :twitter_id, :string
    field :blog_url, :string
    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:email, :encrypted_password, :github_id, :stackoverflow_id,
                      :twitter_id, :blog_url])
    |> validate_required([:email, :encrypted_password])
  end
end
