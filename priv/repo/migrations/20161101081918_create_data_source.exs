defmodule DevQuotes.Repo.Migrations.CreateDataSource do
  use Ecto.Migration

  def change do
    create table(:data_sources) do
      add :type, :string
      add :key, :string
      add :data, :string

      timestamps()
    end

  end
end
