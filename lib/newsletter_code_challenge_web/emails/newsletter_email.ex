defmodule NewsletterCodeChallenge.NewsletterEmail do
  import Swoosh.Email

  def newsletter(user, params) do
    new()
    |> to({user.name, user.email})
    |> from({"Code Challenge", "newsletter.code.challenge@gmail.com"})
    |> subject(params["newsletter"]["subject"])
    |> text_body(params["newsletter"]["body"])
  end
end
