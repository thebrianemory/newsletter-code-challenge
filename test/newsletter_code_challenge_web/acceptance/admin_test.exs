defmodule NewsletterCodeChallengeWeb.AdminTest do
  use ExUnit.Case, async: true
  use Hound.Helpers

  alias NewsletterCodeChallenge.Repo
  import NewsletterCodeChallenge.Factory

  hound_session()

  setup do
    # Explicitly get a connection before each test
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Repo)
    # Setting the shared mode must be done only after checkout
    Ecto.Adapters.SQL.Sandbox.mode(Repo, {:shared, self()})
  end

  test "allows an admin to login" do
    build(:admin) |> set_password("dummypassword") |> Repo.insert!
    navigate_to("/sessions/new")

    find_element(:id, "session_email")
    |> fill_field("admin@example.com")

    find_element(:id, "session_password")
    |> fill_field("dummypassword")

    find_element(:id, "signin_button")
    |> click()

    assert page_source() =~ "Create a newsletter"
  end

  test "allows a logged in admin to create a newsletter" do
    
  end
end
