defmodule NewsletterCodeChallengeWeb.PageControllerTest do
  use NewsletterCodeChallengeWeb.ConnCase
  import NewsletterCodeChallenge.Factory
  use ExUnit.Case, async: true

  describe "GET /" do
    test "redirects visitor to the newsletter sign up page", %{conn: conn} do
      conn = get conn, "/"
      assert html_response(conn, 302)
      assert redirected_to(conn) == registration_path(conn, :new)
    end

    test "shows the button for creating a newsletter to a signed in admin", %{conn: conn} do
      admin = insert(:admin)

      conn = conn
      |> assign(:current_user, admin)
      |> get("/")

      assert html_response(conn, 200) =~ "Create a newsletter"
    end

    test "tells a signed in user (which shouldn't happen) to bugger off", %{conn: conn} do
      user = insert(:user)

      conn = conn
      |> assign(:current_user, user)
      |> get("/")

      assert html_response(conn, 200) =~ "Bugger off!"
    end
  end
end
