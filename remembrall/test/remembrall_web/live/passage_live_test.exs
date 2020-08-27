defmodule RemembrallWeb.PassageLiveTest do
  use RemembrallWeb.ConnCase

  import Phoenix.LiveViewTest

  alias Remembrall.Library

  @create_attrs %{steps: 42, text: "some text", title: "some title"}
  @update_attrs %{steps: 43, text: "some updated text", title: "some updated title"}
  @invalid_attrs %{steps: nil, text: nil, title: nil}

  defp fixture(:passage) do
    {:ok, passage} = Library.create_passage(@create_attrs)
    passage
  end

  defp create_passage(_) do
    passage = fixture(:passage)
    %{passage: passage}
  end

  describe "Index" do
    setup [:create_passage]

    test "lists all passages", %{conn: conn, passage: passage} do
      {:ok, _index_live, html} = live(conn, Routes.passage_index_path(conn, :index))

      assert html =~ "Listing Passages"
      assert html =~ passage.text
    end

    test "saves new passage", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.passage_index_path(conn, :index))

      assert index_live |> element("a", "New Passage") |> render_click() =~
               "New Passage"

      assert_patch(index_live, Routes.passage_index_path(conn, :new))

      assert index_live
             |> form("#passage-form", passage: @invalid_attrs)
             |> render_change() =~ "can&apos;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#passage-form", passage: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.passage_index_path(conn, :index))

      assert html =~ "Passage created successfully"
      assert html =~ "some text"
    end

    test "updates passage in listing", %{conn: conn, passage: passage} do
      {:ok, index_live, _html} = live(conn, Routes.passage_index_path(conn, :index))

      assert index_live |> element("#passage-#{passage.id} a", "Edit") |> render_click() =~
               "Edit Passage"

      assert_patch(index_live, Routes.passage_index_path(conn, :edit, passage))

      assert index_live
             |> form("#passage-form", passage: @invalid_attrs)
             |> render_change() =~ "can&apos;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#passage-form", passage: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.passage_index_path(conn, :index))

      assert html =~ "Passage updated successfully"
      assert html =~ "some updated text"
    end

    test "deletes passage in listing", %{conn: conn, passage: passage} do
      {:ok, index_live, _html} = live(conn, Routes.passage_index_path(conn, :index))

      assert index_live |> element("#passage-#{passage.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#passage-#{passage.id}")
    end
  end

  describe "Show" do
    setup [:create_passage]

    test "displays passage", %{conn: conn, passage: passage} do
      {:ok, _show_live, html} = live(conn, Routes.passage_show_path(conn, :show, passage))

      assert html =~ "Show Passage"
      assert html =~ passage.text
    end

    test "updates passage within modal", %{conn: conn, passage: passage} do
      {:ok, show_live, _html} = live(conn, Routes.passage_show_path(conn, :show, passage))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Passage"

      assert_patch(show_live, Routes.passage_show_path(conn, :edit, passage))

      assert show_live
             |> form("#passage-form", passage: @invalid_attrs)
             |> render_change() =~ "can&apos;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#passage-form", passage: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.passage_show_path(conn, :show, passage))

      assert html =~ "Passage updated successfully"
      assert html =~ "some updated text"
    end
  end
end
