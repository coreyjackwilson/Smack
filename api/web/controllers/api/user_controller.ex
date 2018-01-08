defmodule Smack.UserController do
  use Smack.Web, :controller

  alias Smack.User

  plug Guardian.Plug.EnsureAuthenticated, [handler: Smack.SessionController] when action in [:rooms]

  def create(conn, params) do
    changeset = User.registration_changeset(%User{}, params)

    case Repo.insert(changeset) do
      {:ok, user} ->
        new_conn = Guardian.Plug.api_sign_in(conn, user, :access)
        jwt = Guardian.Plug.current_token(new_conn)

        new_conn
        |> put_status(:created)
        |> render(Smack.SessionView, "show.json", user: user, jwt: jwt)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Smack.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def rooms(conn, _params) do
    current_user = Guardian.Plug.current_resource(conn)
    rooms = Repo.all(assoc(current_user, :rooms))
    render(conn, Smack.RoomView, "index.json", %{rooms: rooms})
  end

end
