# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :twitter_oauth_example,
  ecto_repos: [TwitterOauthExample.Repo]

# Configures the endpoint
config :twitter_oauth_example, TwitterOauthExample.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "sKhbCjdKjyPuMdynLirpteciJV56GIMyUHrbp6MgTrT6gT4H6uzvgZrllbIK8h/H",
  render_errors: [view: TwitterOauthExample.ErrorView, accepts: ~w(html json)],
  pubsub: [name: TwitterOauthExample.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
