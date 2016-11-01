defmodule DevQuotes.DataSource do
  use DevQuotes.Web, :model

  schema "data_sources" do
    field :type, :string
    field :key, :string
    field :data, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:type, :key, :data])
    |> validate_required([:type, :key, :data])
  end
end
