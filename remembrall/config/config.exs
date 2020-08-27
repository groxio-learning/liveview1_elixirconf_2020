# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :remembrall,
  ecto_repos: [Remembrall.Repo]

# Configures the endpoint
config :remembrall, RemembrallWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "E+KOYyu7uidMVeKmpILxKsyK+4Qv5mv0mMGR04ReQTif8H80AHfhEpFweHdTcZNr",
  render_errors: [view: RemembrallWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Remembrall.PubSub,
  live_view: [signing_salt: "EWYoagaI"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
