defmodule Smack.RoomChannel do
  use Smack.Web, :channel

  def join("rooms:" <> room_id, _params, socket) do
    room = Repo.get!(Smack.Room, room_id)

    response = %{
      room: Phoenix.View.render_one(room, Smack.RoomView, "room.json"),
    }

    {:ok, response, assign(socket, :room, room)}
  end

  def terminate(_reason, socket) do
    {:ok, socket}
  end
end
