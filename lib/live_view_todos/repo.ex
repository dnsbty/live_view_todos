defmodule LiveViewTodos.Repo do
  use Ecto.Repo,
    otp_app: :live_view_todos,
    adapter: Ecto.Adapters.Postgres
end
