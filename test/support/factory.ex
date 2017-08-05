defmodule NewsletterCodeChallenge.Factory do
  use ExMachina.Ecto, repo: NewsletterCodeChallenge.Repo
  alias NewsletterCodeChallenge.Coherence.User

  def admin_factory do
    %User{
      email: "admin@example.com",
      password: "adminpass",
      password_confirmation: "adminpass",
      role: "admin"
    }
  end
end
