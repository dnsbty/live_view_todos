defmodule LiveViewTodosWeb.TodoLive do
  use Phoenix.LiveView

  alias LiveViewTodos.Todos
  alias LiveViewTodosWeb.TodoView

  def mount(_session, socket) do
    {:ok, assign(socket, todos: Todos.list_todos())}
  end

  def render(assigns) do
    TodoView.render("todos.html", assigns)
  end
end
