defmodule RemembrallWeb.FrontDoorLive do
  use RemembrallWeb, :live_view

  def mount(_params, _session, socket) do
    {
      :ok,
      assign(
        socket,
        passage: %{
          title: "ITCrowd",
          text: "Have you tried turning it off and on again?",
          steps: 3
        }
      )
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
    assign(
        socket,
        passage_key: :star_wars,
        passage: passage(:star_wars)
      )
  end

  defp passage(:star_wars) do
    %{
      title: "StarWars",
      text: "I am your father",
      steps: 2
    }
  end

  defp next(socket) do
    assign(
        socket,
        passage: %{
          title: "LOTR",
          text: "One does not simply walk into Mordor",
          steps: 4
        }
      )
  end

  def handle_event("previous", _meta, socket) do
    {:noreply, previous(socket)}
  end

  def handle_event("next", _meta, socket) do
    {:noreply, next(socket)}
  end
end
