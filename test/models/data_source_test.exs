defmodule DevQuotes.DataSourceTest do
  use DevQuotes.ModelCase

  alias DevQuotes.DataSource

  @valid_attrs %{data: "some content", key: "some content", type: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = DataSource.changeset(%DataSource{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = DataSource.changeset(%DataSource{}, @invalid_attrs)
    refute changeset.valid?
  end
end
