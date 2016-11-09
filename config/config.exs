# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :dev_quotes,
  ecto_repos: [DevQuotes.Repo]

# Configures the endpoint
config :dev_quotes, DevQuotes.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "LLpU/2ChkTx93OkBqRb+d3G5GMu68YIivrK7ACYfjBKL+wqkaUax+Raa4IF3lft8",
  render_errors: [view: DevQuotes.ErrorView, accepts: ~w(html json)],
  pubsub: [name: DevQuotes.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :template_engines,
    slim: PhoenixSlime.Engine

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

config :addict,
  extra_validation: fn ({valid, errors}, user_params) -> {valid, errors} end, # define extra validation here
  user_schema: DevQuotes.User,
  repo: DevQuotes.Repo,
  from_email: "no-reply@example.com", # CHANGE THIS
  mail_service: nil
