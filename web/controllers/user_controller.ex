defmodule DevQuotes.UserController do
  use DevQuotes.Web, :controller

  alias DevQuotes.User

  def index(conn, _params) do
    users = Repo.all(User)
    render(conn, "index.html", users: users)
  end

  def show(conn, %{"id" => id}) do
    user = User |> Repo.get!(id) |> Repo.preload([:quotes])
    render(conn, "show.html", user: user)
  end
end
