use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :dev_quotes, DevQuotes.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :dev_quotes, DevQuotes.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "dev_quotes_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
