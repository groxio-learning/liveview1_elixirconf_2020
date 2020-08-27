defmodule RemembrallWeb.FrontDoorLive do
  use RemembrallWeb, :live_view

  def mount(_params, _session, socket) do
    {
      :ok,
      assign(
        socket,
        passage_key: :it
      )
      |> load_key()
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
    """
  end

  defp previous(socket) do
    socket
    |> previous_key()
    |> load_key()
  end

  defp passage(:star_wars) do
    %{
      title: "StarWars",
      text: "I am your father",
      steps: 2
    }
  end

  defp passage(:lotr) do
    %{
      title: "LOTR",
      text: "One does not simply walk into Mordor",
      steps: 4
    }
  end

  defp passage(:it) do
    %{
      title: "IT Crowd",
      text: "Have you tried turning it off and on again?",
      steps: 3
    }
  end

  defp next(socket) do
    socket
    |> next_key()
    |> load_key()
  end

  defp next_key(socket) do
    new_key = find_next_key(socket.assigns.passage_key)
    assign(
      socket,
      passage_key: new_key
    )
  end

  defp previous_key(socket) do
    new_key = find_previous_key(socket.assigns.passage_key)
    assign(
      socket,
      passage_key: new_key
    )
  end

  defp find_next_key(:star_wars), do: :lotr
  defp find_next_key(:lotr), do: :it
  defp find_next_key(:it), do: :star_wars

  defp find_previous_key(:lotr), do: :star_wars
  defp find_previous_key(:it), do: :lotr
  defp find_previous_key(:star_wars), do: :it

  defp load_key(socket) do
    assign(socket, passage: passage(socket.assigns.passage_key))
  end

  def handle_event("previous", _meta, socket) do
    {:noreply, previous(socket)}
  end

  def handle_event("next", _meta, socket) do
    {:noreply, next(socket)}
  end
end
