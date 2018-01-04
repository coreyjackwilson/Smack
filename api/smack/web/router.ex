defmodule Smack.Router do
  use Smack.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", Smack do
    pipe_through :api
  end
end
