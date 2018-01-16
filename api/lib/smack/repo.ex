defmodule Smack.Repo do
  use Ecto.Repo, otp_app: :smack
  use Scrivener, page_size: 25
end
