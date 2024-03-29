# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :ccibc,
  ecto_repos: [Ccibc.Repo]

# Configures the endpoint
config :ccibc, CcibcWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "57VPcy0EvXKx9qaE6NOztLyVHmbhpKagmUxc0YzM+GMb1GWQXWcGDvOcWVqxqXRz",
  render_errors: [view: CcibcWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Ccibc.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
