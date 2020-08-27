defmodule RemembrallWeb.PassageLive.FormComponent do
  use RemembrallWeb, :live_component

  alias Remembrall.Library

  @impl true
  def update(%{passage: passage} = assigns, socket) do
    changeset = Library.change_passage(passage)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"passage" => passage_params}, socket) do
    changeset =
      socket.assigns.passage
      |> Library.change_passage(passage_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"passage" => passage_params}, socket) do
    save_passage(socket, socket.assigns.action, passage_params)
  end

  defp save_passage(socket, :edit, passage_params) do
    case Library.update_passage(socket.assigns.passage, passage_params) do
      {:ok, _passage} ->
        {:noreply,
         socket
         |> put_flash(:info, "Passage updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_passage(socket, :new, passage_params) do
    case Library.create_passage(passage_params) do
      {:ok, _passage} ->
        {:noreply,
         socket
         |> put_flash(:info, "Passage created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
