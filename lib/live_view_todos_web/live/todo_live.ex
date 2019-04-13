defmodule LiveViewTodosWeb.TodoLive do
  use Phoenix.LiveView

  def mount(_session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~L"Rendering LiveView"
  end
end
