defmodule NewsletterCodeChallenge.Factory do
  use ExMachina.Ecto, repo: NewsletterCodeChallenge.Repo
  alias NewsletterCodeChallenge.Coherence.User

  def admin_factory do
    %User{
      email: "admin@example.com",
      confirmed_at: Ecto.DateTime.utc,
      role: "admin"
    }
  end

  def user_factory do
    %User{
      email: "user@example.com",
      password: "userpass",
      password_confirmation: "userpass"
    }
  end

  def set_password(user, password) do
    hashed_password = Comeonin.Bcrypt.hashpwsalt(password)
    %{user | password_hash: hashed_password}
  end
end
