defmodule RemembrallWeb.FrontDoorLive do
  use RemembrallWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, assign(socket, message: "Howdy World")}
  end

  def render(assigns) do
    ~L"""
    <h1><%= @message %></h1>
    """
  end
end
