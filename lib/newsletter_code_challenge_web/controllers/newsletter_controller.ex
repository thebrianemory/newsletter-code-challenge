defmodule NewsletterCodeChallengeWeb.NewsletterController do
  use NewsletterCodeChallengeWeb, :controller
  use Task

  alias NewsletterCodeChallenge.NewsletterEmail
  alias NewsletterCodeChallengeWeb.SendgridMailer
  alias NewsletterCodeChallenge.Coherence.User
  alias NewsletterCodeChallenge.Repo

  def new(conn, _params) do
    render(conn, "new.html")
  end

  def create(conn, params) do
    list_confirmed_subscribers()
    |> Enum.map(&Task.async(fn ->
      NewsletterEmail.newsletter(&1, params)
      |> SendgridMailer.deliver
    end))

    conn
    |> put_flash(:success, "Your newsletter was successfully sent!")
    |> redirect(to: newsletter_path(conn, :new))
  end

  defp list_confirmed_subscribers do
    User |> Repo.all 
    |> Enum.filter(fn(user) -> user.confirmed_at != nil end)
  end
end
