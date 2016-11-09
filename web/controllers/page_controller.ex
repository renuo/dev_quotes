defmodule DevQuotes.PageController do
  use DevQuotes.Web, :controller

  def about(conn, _params) do
    render conn, "about.html"
  end
end
