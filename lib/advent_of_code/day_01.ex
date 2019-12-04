defmodule AdventOfCode.Day01 do
  def run() do
    {:ok, cwd} = File.cwd()
    {:ok, contents} = File.read(Path.join([cwd, "lib", "advent_of_code", "day_01.txt"]))
    sum = 
      contents
      |> String.split("\n", trim: true)
      |> Enum.map(&Float.parse/1)
      |> Enum.map(&elem(&1, 0))
      |> Enum.reduce(0, fn x, acc -> acc + Float.floor(x / 3) - 2 end) 
    
    IO.puts(sum)
  end
end
