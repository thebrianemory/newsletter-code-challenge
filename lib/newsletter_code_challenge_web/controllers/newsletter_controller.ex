defmodule NewsletterCodeChallengeWeb.NewsletterController do
  use NewsletterCodeChallengeWeb, :controller

  alias NewsletterCodeChallenge.NewsletterEmail
  alias NewsletterCodeChallengeWeb.SendgridMailer
  alias NewsletterCodeChallenge.Coherence.User
  alias NewsletterCodeChallenge.Repo

  def new(conn, _params) do
    if conn.assigns.current_user do
      render(conn, "new.html")
    else
      conn
      |> redirect(to: registration_path(conn, :new))
    end
  end

  def create(conn, params) do
    list_confirmed_subscribers()
    |> Enum.map(&Task.async(fn ->
      NewsletterEmail.newsletter(&1, params)
      |> SendgridMailer.deliver
    end))
    |> Enum.map(&Task.await/1)

    conn
    |> put_flash(:success, "Your newsletter was successfully sent!")
    |> redirect(to: newsletter_path(conn, :new))
  end

  defp list_confirmed_subscribers do
    User |> Repo.all 
    |> Enum.filter(fn(user) -> user.confirmed_at != nil end)
  end
end
