defmodule Smack.Router do
  use Smack.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
    plug Guardian.Plug.VerifyHeader, realm: "Bearer"
    plug Guardian.Plug.LoadResource, allow_blank: true
  end

  scope "/", Smack do

    get "/", PageController, :index
  end

  scope "/api", Smack do
    pipe_through :api

    post "/sessions", SessionController, :create
    delete "/sessions", SessionController, :delete
    post "/sessions/refresh", SessionController, :refresh
    resources "/users", UserController, only: [:create]
  end
end
