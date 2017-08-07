defmodule NewsletterCodeChallengeWeb.VisitorTest do
  use ExUnit.Case, async: true
  use Hound.Helpers

  import NewsletterCodeChallenge.Factory

  alias NewsletterCodeChallenge.Repo

  hound_session()

  setup do
    # Explicitly get a connection before each test
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Repo)
    # Setting the shared mode must be done only after checkout
    Ecto.Adapters.SQL.Sandbox.mode(Repo, {:shared, self()})
  end

  test "redirects a visitor to the sign up form" do
    navigate_to("/")

    assert page_source() =~ "Sign up for my newsletter"
  end

  test "allows the visitor to sign up for the newsetter" do
    navigate_to("/")

    find_element(:id, "registration_email")
    |> fill_field("tony@avengers.com")

    find_element(:id, "submit_newsletter")
    |> click()

    assert page_source() =~ "Confirmation email sent."
  end

  test "resends confirmation email" do
    insert(:user, email: "tony@avengers.com")
    navigate_to("/")

    find_element(:id, "confirmation_resend_link")
    |> click()

    find_element(:id, "confirmation_email")
    |> fill_field("tony@avengers.com")

    find_element(:id, "resend_confirmation_button")
    |> click()

    assert page_source() =~ "Confirmation email sent."
  end
end
