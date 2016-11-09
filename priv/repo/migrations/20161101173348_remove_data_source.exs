defmodule DevQuotes.Repo.Migrations.RemoveDataSource do
  use Ecto.Migration

  def change do
    drop table(:data_sources)
  end
end
