use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :authentication, Authentication.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :authentication, Authentication.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "authentication_test",
  username: "auth",
  password: "exs#exs789",
  hostname: "authentication-postgres-s",
  port: "5432",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10
