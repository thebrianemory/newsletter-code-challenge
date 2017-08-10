# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     NewsletterCodeChallenge.Repo.insert!(%NewsletterCodeChallenge.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias NewsletterCodeChallenge.Repo
alias NewsletterCodeChallenge.Coherence.User

%User{email: "batman@example.com", confirmed_at: Ecto.DateTime.utc, role: "admin", name: "Bruce Wayne"} |> NewsletterCodeChallenge.Coherence.User.admin_password_update(System.get_env("DEFAULT_PASSWORD")) |> Repo.insert!
