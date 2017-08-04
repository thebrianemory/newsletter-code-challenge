# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :newsletter_code_challenge,
  ecto_repos: [NewsletterCodeChallenge.Repo]

# Configures the endpoint
config :newsletter_code_challenge, NewsletterCodeChallengeWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "pIZbrkGNJE92VkldEnPOxKetvAb/x/7XCvSVa0VxEAF8vl47VvbpZgcPfyaQw6z9",
  render_errors: [view: NewsletterCodeChallengeWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: NewsletterCodeChallenge.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
