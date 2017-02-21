defmodule Authentication.Router do
  use Authentication.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", Authentication do
    pipe_through :api
  end
end
