defmodule NewsletterCodeChallengeWeb.NewsletterControllerTest do
  use NewsletterCodeChallengeWeb.ConnCase
  use ExUnit.Case, async: true

  import NewsletterCodeChallenge.Factory

  describe "GET /newsletter/new" do
    test "redirects visitor to the newsletter sign up page", %{conn: conn} do
      conn = conn
      |> get(newsletter_path(conn, :new))

      assert html_response(conn, 302)
      assert redirected_to(conn) == registration_path(conn, :new)
    end

    test "renders newsletter form for a signed in admin", %{conn: conn} do
      admin = insert(:admin)

      conn = conn
      |> assign(:current_user, admin)
      |> get(newsletter_path(conn, :new))

      assert html_response(conn, 200) =~ "Send newsletter"
    end

    test "tells a signed in user (which shouldn't happen) to bugger off", %{conn: conn} do
      user = insert(:user)

      conn = conn
      |> assign(:current_user, user)
      |> get(newsletter_path(conn, :new))

      assert html_response(conn, 200) =~ "Bugger off!"
    end
  end

  describe "POST /newsletter" do
    test "creates a newsletter and emails it to subscribers", %{conn: conn} do
      user = insert(:user, email: "user2@example.com")
      newsletter = %{"newsletter" => %{"subject" => "Hello", "body" => "This is a test"}}

      conn = conn
      |> post(newsletter_path(conn, :create), params: newsletter)

      email =  NewsletterCodeChallenge.NewsletterEmail.newsletter(user, newsletter)

      assert email.subject == newsletter["newsletter"]["subject"]
      assert html_response(conn, 302)
      assert get_flash(conn, :success) == "Your newsletter was successfully sent!"
    end
  end
end
