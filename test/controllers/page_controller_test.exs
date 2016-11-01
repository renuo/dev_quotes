defmodule DevQuotes.PageControllerTest do
  use DevQuotes.ConnCase

  test "GET /about", %{conn: conn} do
    conn = get conn, "/about"
    assert html_response(conn, 200) =~ "About DevQuotes"
  end
end
