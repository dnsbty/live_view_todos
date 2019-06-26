defmodule LiveViewTodosWeb.TodoLive do
  use Phoenix.LiveView

  alias LiveViewTodos.Todos
  alias LiveViewTodosWeb.TodoView

  @topic inspect(__MODULE__)

  def mount(_session, socket) do
    Phoenix.PubSub.subscribe(LiveViewTodos.PubSub, @topic)

    {:ok,
      assign(socket,
      todos: fetch_todos())
    }
  end

  def render(assigns) do
    TodoView.render("todos.html", assigns)
  end

  def handle_event("add", %{"todo" => todo}, socket) do
    Todos.create_todo(todo)
    todos = fetch_todos()

    dispatch_changes(socket, "created", todos)
    {:noreply, assign(socket, todos: todos)}
  end

  def handle_event("toggle_done", id, socket) do
    todo = Todos.get_todo!(id)
    Todos.update_todo(todo, %{done: !todo.done})
    todos = fetch_todos()

    dispatch_changes(socket, "updated", todos)
    {:noreply, assign(socket, todos: todos)}
  end

  def handle_event("todo_delete", id, socket) do
    todo = Todos.get_todo!(id)
    Todos.delete_todo(todo)
    todos = fetch_todos()

    dispatch_changes(socket, "deleted", todos)
    {:noreply, assign(socket, todos: todos)}
  end

  # Send changes over Channels
  defp dispatch_changes(socket, event, todos) do
    #PubSub Socket Changes
    Phoenix.PubSub.broadcast(LiveViewTodos.PubSub, @topic, {__MODULE__, event, %{todos: todos}})
  end

  # Handle Channel Sockets
  def handle_info({LiveViewTodosWeb.TodoLive, action, payload}, socket) do
    {:noreply, assign(socket, payload)}
  end

  defp fetch_todos() do
    Todos.list_todos()
  end
end
