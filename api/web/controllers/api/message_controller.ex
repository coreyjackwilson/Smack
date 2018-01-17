defmodule Smack.MessageController do
  use Smack.Web, :controller

  plug Guardian.Plug.EnsureAuthenticated, handler: Smack.SessionController

  def index(conn, params) do
    last_seen_id = params["last_seen_id"] || 0
    room = Repo.get!(Smack.Room, params["room_id"])

    page =
      Smack.Message
      |> where([m], m.room_id == ^room.id)
      |> where([m], m.id < ^last_seen_id)
      |> order_by([desc: :inserted_at, desc: :id])
      |> preload(:user)
      |> Smack.Repo.paginate()

    render(conn, "index.json", %{messages: page.entries, pagination: Smack.PaginationHelpers.pagination(page)})
  end
end
