defmodule Smack.Room do
  use Smack.Web, :model

  schema "rooms" do
    field :name, :string
    field :topic, :string
    many_to_many :users, Smack.User, join_through: "user_rooms"
    has_many :messages, Smack.Message

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :topic])
    |> validate_required([:name])
    |> unique_constraint(:name)
  end
end
