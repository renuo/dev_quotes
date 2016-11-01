defmodule DevQuotes.PageControllerTest do
  use DevQuotes.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Hello DevQuotes!"
  end

  test "GET /about", %{conn: conn} do
    conn = get conn, "/about"
    assert html_response(conn, 200) =~ "About DevQuotes"
  end
end
