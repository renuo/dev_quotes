defmodule DevQuotes.PageController do
  use DevQuotes.Web, :controller

  alias DevQuotes.User

  def index(conn, _params) do
    users = Repo.all(User)
    render(conn, "index.html", users: users)
  end

  def about(conn, _params) do
    render conn, "about.html"
  end
end
