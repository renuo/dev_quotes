defmodule DevQuotes.Repo.Migrations.AddFieldsToUsers do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :github_id, :string
      add :stackoverflow_id, :string
      add :twitter_id, :string
      add :blog_url, :string
    end
  end
end
