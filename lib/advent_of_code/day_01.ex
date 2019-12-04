defmodule AdventOfCode.Day01 do
  def run() do
    {:ok, cwd} = File.cwd()
    {:ok, contents} = File.read(Path.join([cwd, "lib", "advent_of_code", "day_01.txt"]))
    sum = 
      contents
      |> String.split("\n", trim: true)
      |> Enum.map(&Float.parse/1)
      |> Enum.map(&elem(&1, 0))
      |> Enum.reduce(0, &calc_fuel/2) 

    sum
  end

  def calc_fuel(mass, total) when mass / 3 - 2 <= 0 do
    total
  end

  def calc_fuel(mass, total) do
    fuel = Float.floor(mass / 3) - 2
    calc_fuel(fuel, total + fuel)
  end
end
