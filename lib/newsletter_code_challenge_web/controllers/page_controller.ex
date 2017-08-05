defmodule NewsletterCodeChallengeWeb.PageController do
  use NewsletterCodeChallengeWeb, :controller

  def index(conn, _params) do
    if conn.assigns.current_user do
      render conn, "index.html"
    else
      conn
      |> redirect(to: registration_path(conn, :new))
    end
  end
end
