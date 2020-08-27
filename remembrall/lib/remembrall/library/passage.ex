defmodule Remembrall.Library.Passage do
  use Ecto.Schema
  import Ecto.Changeset

  schema "passages" do
    field :steps, :integer
    field :text, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(passage, attrs) do
    passage
    |> cast(attrs, [:title, :text, :steps])
    |> validate_required([:title, :text, :steps])
  end
end
