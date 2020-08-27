defmodule RemembrallWeb.PassageLive.Index do
  use RemembrallWeb, :live_view

  alias Remembrall.Library
  alias Remembrall.Library.Passage

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :passages, list_passages())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Passage")
    |> assign(:passage, Library.get_passage!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Passage")
    |> assign(:passage, %Passage{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Passages")
    |> assign(:passage, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    passage = Library.get_passage!(id)
    {:ok, _} = Library.delete_passage(passage)

    {:noreply, assign(socket, :passages, list_passages())}
  end

  defp list_passages do
    Library.list_passages()
  end
end
