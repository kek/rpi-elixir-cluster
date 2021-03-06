defmodule Hello.Router do
  use Hello.Web, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/", Hello do
    # Use the default browser stack
    pipe_through(:browser)

    get("/", PageController, :index)
  end

  scope "/wobserver" do
    forward("/", Wobserver.Web.Router)
  end

  # Other scopes may use custom stacks.
  # scope "/api", Hello do
  #   pipe_through :api
  # end
end
