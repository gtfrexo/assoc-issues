use Mix.Config

# General application configuration
config :db,
  ecto_repos: [Db.Repo]

# Configures the endpoint
config :db, DbWeb.Endpoint,
  url: [scheme: "https", host: "plus-one-endpoint.herokuapp.com", port: 443],
  force_ssl: [rewrite_on: [:x_forwarded_proto]],
  secret_key_base: "FaRzDjx8olcbZStavjTvKMoF4Y8OT+qzy3ksths8U+GKdW62bdKTL/RvqA9xKsoC",
  render_errors: [view: DbWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Db.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

config :cors_plug,
  origin: ["*"],
  max_age: 86400,
  methods: ["GET", "POST"]

config :db, Db.Persons.Guardian,
  issuer: "db",
  secret_key: "fLOb8NWfr+5Ch0/7TCzPhT775rAuh4OtmYP4ke+Z5Uw5wpzV9eIKxKCcy2OLDqUR"

config :pigeon, :apns,
  apns_default: %{
    cert: "cert.pem",
    key: "key_unencrypted.pem",
    mode: :dev
    #Dev Device ID: e6012c5a5b1b5aad8d09e19cc1a3f9e2d98b47054f100c6a4cc738e7781cb578
  }

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
