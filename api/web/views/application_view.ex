defmodule Smack.ApplicationView do
  use Smack.Web, :view

  def render("not_found.json", _) do
    %{error: "Not found"}
  end
end
