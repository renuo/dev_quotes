defmodule DevQuotes.Repo.Migrations.RenameUsernameToEmail do
  use Ecto.Migration

  def change do
    rename table(:users), :username, to: :email
  end
end
