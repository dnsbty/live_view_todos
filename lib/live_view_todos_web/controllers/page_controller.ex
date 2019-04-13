defmodule LiveViewTodosWeb.PageController do
  use LiveViewTodosWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
