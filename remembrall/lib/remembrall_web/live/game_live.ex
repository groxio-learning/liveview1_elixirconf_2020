defmodule RemembrallWeb.GameLive do
  use RemembrallWeb, :live_view

  alias Remembrall.{Library, Game}


  def mount(%{"id" => id}, _session, socket) do
    passage = Library.get_passage!(id)
    {:ok, assign(socket, eraser: Game.Eraser.new(passage.text, passage.steps))}
  end

  def render(assigns) do
    ~L"""
    <h1>Remember This</h1>
    <pre>
      <%= @eraser.text %>
    </pre>
    <button phx-click="erase">Erase</button>
    """
  end

  defp erase(socket) do
    assign(socket, eraser: Game.Eraser.erase(socket.assigns.eraser))
  end

  def handle_event("erase", _meta, socket) do
    {:noreply, erase(socket)}
  end
end
