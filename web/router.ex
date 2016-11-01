defmodule DevQuotes.Router do
  use DevQuotes.Web, :router
  use Addict.RoutesHelper

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", DevQuotes do
    pipe_through :browser # Use the default browser stack

    get "/", UserController, :index
    get "/about", PageController, :about
    resources "/users", UserController, except: [:delete, :new, :create]
    resources "/data_sources", DataSourceController
  end

  scope "/" do
    addict :routes
  end

  # Other scopes may use custom stacks.
  # scope "/api", DevQuotes do
  #   pipe_through :api
  # end
end
