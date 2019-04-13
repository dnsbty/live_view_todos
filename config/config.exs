# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :live_view_todos,
  ecto_repos: [LiveViewTodos.Repo]

# Configures the endpoint
config :live_view_todos, LiveViewTodosWeb.Endpoint,
  url: [host: "localhost"],
  live_view: [signing_salt: "gr6j1ZhSIGlOy+KqJOfRH3C2v4x8aZTs"],
  secret_key_base: "hELSnfRZGJKCJhM0s7SGZXOIFyAHhsJZTgqbVVXgJyY48Jc6oiy9TQIWCvHXCZen",
  render_errors: [view: LiveViewTodosWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: LiveViewTodos.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
