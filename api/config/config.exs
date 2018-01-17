# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :smack,
  ecto_repos: [Smack.Repo]

# Configures the endpoint
config :smack, Smack.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "3/ptKPtOVJInaP3ZdNcpPes+1/wohETcmNWRIAv7Ynj4MIzBBDhlPtYTkxwQBk6w",
  render_errors: [view: Smack.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Smack.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :guardian, Guardian,
  issuer: "Smack",
  ttl: {30, :days},
  verify_issuer: true,
  serializer: Smack.GuardianSerializer

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
