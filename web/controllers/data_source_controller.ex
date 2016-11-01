defmodule DevQuotes.DataSourceController do
  use DevQuotes.Web, :controller

  alias DevQuotes.DataSource

  def index(conn, _params) do
    data_sources = Repo.all(DataSource)
    render(conn, "index.html", data_sources: data_sources)
  end

  def new(conn, _params) do
    changeset = DataSource.changeset(%DataSource{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"data_source" => data_source_params}) do
    changeset = DataSource.changeset(%DataSource{}, data_source_params)

    case Repo.insert(changeset) do
      {:ok, _data_source} ->
        conn
        |> put_flash(:info, "Data source created successfully.")
        |> redirect(to: data_source_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    data_source = Repo.get!(DataSource, id)
    render(conn, "show.html", data_source: data_source, fetched_data: DataSourceResolver.resolve(data_source))
  end

  def edit(conn, %{"id" => id}) do
    data_source = Repo.get!(DataSource, id)
    changeset = DataSource.changeset(data_source)
    render(conn, "edit.html", data_source: data_source, changeset: changeset)
  end

  def update(conn, %{"id" => id, "data_source" => data_source_params}) do
    data_source = Repo.get!(DataSource, id)
    changeset = DataSource.changeset(data_source, data_source_params)

    case Repo.update(changeset) do
      {:ok, data_source} ->
        conn
        |> put_flash(:info, "Data source updated successfully.")
        |> redirect(to: data_source_path(conn, :show, data_source))
      {:error, changeset} ->
        render(conn, "edit.html", data_source: data_source, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    data_source = Repo.get!(DataSource, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(data_source)

    conn
    |> put_flash(:info, "Data source deleted successfully.")
    |> redirect(to: data_source_path(conn, :index))
  end
end
