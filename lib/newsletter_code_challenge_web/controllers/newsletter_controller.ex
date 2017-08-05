defmodule NewsletterCodeChallengeWeb.NewsletterController do
  use NewsletterCodeChallengeWeb, :controller
  alias NewsletterCodeChallenge.NewsletterEmail
  alias NewsletterCodeChallengeWeb.SendgridMailer
  alias NewsletterCodeChallenge.Repo
  alias NewsletterCodeChallenge.Coherence.User

  def new(conn, _params) do
    render(conn, "new.html")
  end

  def create(conn, params) do
    users = User |> Repo.all
    |> NewsletterEmail.newsletter(params)
    |> SendgridMailer.deliver
  end
end
