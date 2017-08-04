use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :newsletter_code_challenge, NewsletterCodeChallengeWeb.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :newsletter_code_challenge, NewsletterCodeChallenge.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "brianemory",
  password: "",
  database: "newsletter_code_challenge_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
