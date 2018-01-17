defmodule Smack.RoomView do
  use Smack.Web, :view

  def render("index.json", %{page: page}) do
    %{
      data: render_many(page.entries, Smack.RoomView, "room.json"),
      pagination: Smack.PaginationHelpers.pagination(page)
    }
  end

  def render("show.json", %{room: room}) do
    %{data: render_one(room, Smack.RoomView, "room.json")}
  end

  def render("room.json", %{room: room}) do
    %{
      id: room.id,
      name: room.name,
      topic: room.topic
    }
  end
end
