defmodule ExTargetSum do
  @moduledoc """
  Documentation for `ExTargetSum`.
  """

  @doc ~S"""
  Find at least two numbers that sum up to the target or return an empty list.

  ## Examples

      iex> ExTargetSum.run([1,2,3], 5)
      [2, 3]

      iex> ExTargetSum.run([1,7,10,20], 27)
      [7, 20]

      iex> ExTargetSum.run([1,7,10,20], 100)
      []

  """
  @spec run(values :: list(integer()), integer()) :: list(integer())
  def run(values, target) do
    values
    |> Enum.reduce(%{result: [], memory: []}, fn val, acc ->
      num = abs(target - val)

      if num in acc.memory do
        %{acc | result: [num, val | acc.result]}
      else
        %{acc | memory: [val | acc.memory]}
      end
    end)
    |> Map.get(:result)
  end
end
