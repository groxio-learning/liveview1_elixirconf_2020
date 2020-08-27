defmodule Remembrall.Library.PassageQuery do
  alias Remembrall.Library.Passage

  import Ecto.Query

  def next_query(id) do
    from p in Passage,
    where: p.id > ^id,
    order_by: p.id,
    limit: 1,
    select: p.id
  end

  def previous_query(id) do
    from p in Passage,
    where: p.id < ^id,
    order_by: [desc: p.id],
    limit: 1,
    select: p.id
  end
end
