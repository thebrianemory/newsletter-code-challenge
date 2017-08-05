defmodule NewsletterCodeChallenge.UserTest do
  use NewsletterCodeChallengeWeb.ConnCase
  use ExUnit.Case, async: true
  alias NewsletterCodeChallenge.Repo

  import NewsletterCodeChallenge.Factory

  test "sends an email on user signup" do
    user = build(:user) |> Repo.insert!
    email = NewsletterCodeChallengeWeb.Coherence.UserEmail.confirmation(user, "www.example.com")

    assert email.subject == "NewsletterCodeChallenge - Confirm your new account"
  end
end
