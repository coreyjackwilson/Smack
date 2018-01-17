defmodule Smack.UserRoom do
  use Smack.Web, :model

  schema "user_rooms" do
    belongs_to :user, Smack.User
    belongs_to :room, Smack.Room

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:user_id, :room_id])
    |> validate_required([:user_id, :room_id])
    |> unique_constraint(:user_id_room_id)
  end
end
