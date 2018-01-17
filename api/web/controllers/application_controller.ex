defmodule Smack.ApplicationController do
  use Smack.Web, :controller

  def not_found(conn, _params) do
    conn
    |> put_status(:not_found)
    |> render(Smack.ApplicationView, "not_found.json")
  end
end
