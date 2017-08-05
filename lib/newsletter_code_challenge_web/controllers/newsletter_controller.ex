defmodule NewsletterCodeChallengeWeb.NewsletterController do
  use NewsletterCodeChallengeWeb, :controller

  def new(conn, _params) do
    render(conn, "new.html")
  end
end
