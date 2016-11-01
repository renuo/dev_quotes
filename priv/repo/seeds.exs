# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     DevQuotes.Repo.insert!(%DevQuotes.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias DevQuotes.Repo
alias DevQuotes.User

  Repo.insert! %User{
    email: "josh1@josh.com",
    encrypted_password: "hakfjaf"
  }
  Repo.insert! %User{
    email: "josh2@josh.com",
    encrypted_password: "hakfjaf"
  }
  Repo.insert! %User{
    email: "josh3@josh.com",
    encrypted_password: "hakfjaf"
  }
