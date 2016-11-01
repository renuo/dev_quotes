defmodule DevQuotes.Repo.Migrations.CreateQuote do
  use Ecto.Migration

  def change do
    create table(:quotes) do
      add :text, :string
      add :source, :string
      add :user_id, references(:users, on_delete: :delete_all)

      timestamps()
    end
    create index(:quotes, [:user_id])

  end
end
