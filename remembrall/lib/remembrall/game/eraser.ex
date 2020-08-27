defmodule Remembrall.Game.Eraser do
  defstruct [:plan, :text]
  def new(text, steps) do
    %__MODULE__{text: text, plan: make_plan(text,steps)}
  end

  defp make_plan(text, steps) do
    1.. String.length(text)
    |> Enum.shuffle
    |> Enum.chunk_every(chunk_size(text, steps))
  end

  defp chunk_size(text, steps) do
    text
    |> String.length()
    |> Kernel./(steps)
    |> ceil
  end
end
