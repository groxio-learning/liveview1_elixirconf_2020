defmodule RemembrallWeb.FrontDoorLive do
  use RemembrallWeb, :live_view

  alias Remembrall.Library

  def mount(_params, _session, socket) do
    {
      :ok,
      assign(
        socket,
        passage_id: Library.next_passage(0)
      )
      |> load_id()
    }
  end

  def render(assigns) do
    ~L"""
    <h1>
      <button phx-click="previous">Previous</button>
        <%= @passage.title %>
      <button phx-click="next">Next</button>
    </h1>
    <pre>
      <%= @passage.text %>
    </pre>
    <h2>Memorize this in <%= @passage.steps %> steps</h2>
    <button phx-click="choose">Choose</button>
    """
  end

  defp previous(socket) do
    socket
    |> previous_id()
    |> load_id()
  end

  defp next(socket) do
    socket
    |> next_id()
    |> load_id()
  end

  defp next_id(socket) do
    new_id = Library.next_passage(socket.assigns.passage_id)
    assign(
      socket,
      passage_id: new_id
    )
  end

  defp previous_id(socket) do
    new_id = Library.previous_passage(socket.assigns.passage_id)
    assign(
      socket,
      passage_id: new_id
    )
  end

  defp load_id(socket) do
    assign(socket, passage: Library.get_passage!(socket.assigns.passage_id))
  end

  def handle_event("previous", _meta, socket) do
    {:noreply, previous(socket)}
  end

  def handle_event("next", _meta, socket) do
    {:noreply, next(socket)}
  end

  def handle_event("choose", _meta, socket) do
    {:noreply, push_redirect(socket, to: "/game/#{socket.assigns.passage_id}")}
  end
end
