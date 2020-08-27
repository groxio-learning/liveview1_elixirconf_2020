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

  def erase(%{text: text, plan: [step | plan]}) do
    new_text = erase_text(text, step)
    %__MODULE__{text: new_text, plan: plan}
  end

  defp replace_character(_character, true), do: "_"
  defp replace_character(character, false), do: character

  defp erase_text(text, step) do
    text
    |> String.graphemes()
    |> Enum.with_index(1)
    |> Enum.map(fn {character, index} -> replace_character(character, index in step) end)
    |> Enum.join()
  end
end
