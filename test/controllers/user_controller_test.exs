defmodule DevQuotes.UserControllerTest do
  use DevQuotes.ConnCase

  test "GET /users", %{conn: conn} do
    conn = get conn, "/users"
    assert html_response(conn, 200) =~ "Hello DevQuotes!"
  end

  test "GET /users/1", %{conn: conn} do
    conn = get conn, "/about"
    assert html_response(conn, 200) =~ "About DevQuotes"
  end
end
