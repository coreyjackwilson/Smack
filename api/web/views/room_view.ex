defmodule Smack.RoomView do
  use Smack.Web, :view

  def render("index.json", %{rooms: rooms}) do
    %{data: render_many(rooms, Smack.RoomView, "room.json")}
  end

  def render("show.json", %{room: room}) do
    %{data: render_one(room, Smack.RoomView, "room.json")}
  end

  def render("room.json", %{room: room}) do
    %{id: room.id,
      name: room.name,
      topic: room.topic}
  end
end
