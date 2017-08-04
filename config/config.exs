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

# %% Coherence Configuration %%   Don't remove this line
config :coherence,
  user_schema: NewsletterCodeChallenge.Coherence.User,
  repo: NewsletterCodeChallenge.Repo,
  module: NewsletterCodeChallenge,
  web_module: NewsletterCodeChallengeWeb,
  router: NewsletterCodeChallengeWeb.Router,
  messages_backend: NewsletterCodeChallengeWeb.Coherence.Messages,
  logged_out_url: "/",
  email_from_name: "Your Name",
  email_from_email: "yourname@example.com",
  opts: [:authenticatable, :unlockable_with_token, :confirmable, :registerable]

config :coherence, NewsletterCodeChallengeWeb.Coherence.Mailer,
  adapter: Swoosh.Adapters.Sendgrid,
  api_key: "your api key here"
# %% End Coherence Configuration %%
