defmodule NewsletterCodeChallenge.NewsletterEmail do
  import Swoosh.Email

  def newsletter(users, params) do
    new()
    |> to({"Brian", "the@brianemory.com"})
    |> from({"Code Challenge", "newsletter.code.challenge@gmail.com"})
    |> subject(params["newsletter"]["subject"])
    |> text_body(params["newsletter"]["body"])
  end
end
