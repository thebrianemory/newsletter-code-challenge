defmodule NewsletterCodeChallengeWeb.SendgridMailer do
  require IEx; IEx.pry
  use Swoosh.Mailer, otp_app: :newsletter_code_challenge
end
