use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :db, DbWeb.Endpoint,
  http: [port: 4001],
  server: true

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :db, Db.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "db_test-pod",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
