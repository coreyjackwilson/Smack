use Mix.Config

# In this file, we keep production configuration that
# you'll likely want to automate and keep away from
# your version control system.
#
# You should document the content of this
# file or create a script for recreating it, since it's
# kept out of version control and might be hard to recover
# or recreate for your teammates (or yourself later on).
config :smack, Smack.Endpoint,
  secret_key_base: "gPVrydTj2VaAwjuF9SLrpzr7PV7t9OPTwdlSts1MZD82xblZKOzbbO70GPgH8Prk"

# Configure your database
config :smack, Smack.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "smack_prod",
  pool_size: 15
