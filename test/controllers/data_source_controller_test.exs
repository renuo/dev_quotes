defmodule DevQuotes.DataSourceControllerTest do
  use DevQuotes.ConnCase, async: false
  use ExVCR.Mock, adapter: ExVCR.Adapter.IBrowse

#  setup_all do
#    # HTTPoison.start
#    HTTPotion.start
#  end

  alias DevQuotes.DataSource

  @valid_attrs %{data: "837638", key: "hello", type: "stackoverflow"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, data_source_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing data sources"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, data_source_path(conn, :new)
    assert html_response(conn, 200) =~ "New data source"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, data_source_path(conn, :create), data_source: @valid_attrs
    assert redirected_to(conn) == data_source_path(conn, :index)
    assert Repo.get_by(DataSource, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, data_source_path(conn, :create), data_source: @invalid_attrs
    assert html_response(conn, 200) =~ "New data source"
  end

  test "test use_casette with HTTPotion and gzip compression" do
    use_cassette "api_stackexchange_com" do
      HTTPotion.start
      response = :zlib.gunzip(HTTPotion.get("https://api.stackexchange.com/2.2").body)
      assert response =~ "bad_parameter"
    end
  end

#  test "shows chosen resource", %{conn: conn} do
#    use_cassette "stackoverflow_resource" do #, match_requests_on: [:query] do # , match_requests_on: [:query]
#      data_source = Repo.insert! %DataSource{data: "837638", key: "hello", type: "stackoverflow"}
#      conn = get conn, data_source_path(conn, :show, data_source)
#      assert html_response(conn, 200) =~ "Show data source"
#    end
#  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, data_source_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    data_source = Repo.insert! %DataSource{}
    conn = get conn, data_source_path(conn, :edit, data_source)
    assert html_response(conn, 200) =~ "Edit data source"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    data_source = Repo.insert! %DataSource{}
    conn = put conn, data_source_path(conn, :update, data_source), data_source: @valid_attrs
    assert redirected_to(conn) == data_source_path(conn, :show, data_source)
    assert Repo.get_by(DataSource, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    data_source = Repo.insert! %DataSource{}
    conn = put conn, data_source_path(conn, :update, data_source), data_source: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit data source"
  end

  test "deletes chosen resource", %{conn: conn} do
    data_source = Repo.insert! %DataSource{}
    conn = delete conn, data_source_path(conn, :delete, data_source)
    assert redirected_to(conn) == data_source_path(conn, :index)
    refute Repo.get(DataSource, data_source.id)
  end
end
