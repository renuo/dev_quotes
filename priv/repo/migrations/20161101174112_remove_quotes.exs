defmodule DevQuotes.Repo.Migrations.RemoveQuotes do
  use Ecto.Migration

  def change do
    drop table(:quotes)
  end
end
