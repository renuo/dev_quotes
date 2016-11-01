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
alias DevQuotes.Quote

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
  Repo.insert! %Quote{
    text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
    source: "github.com",
    user_id: 1
  }
  Repo.insert! %Quote{
    text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy ",
    source: "stackoverflow.com",
    user_id: 1
  }
  Repo.insert! %Quote{
    text: "Lorem Ipsum is simply dummy text of the printing",
    source: "twitter.com",
    user_id: 2
  }
