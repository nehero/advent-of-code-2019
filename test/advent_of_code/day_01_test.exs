defmodule AdventOfCode.Day01Test do
  use ExUnit.Case
  doctest AdventOfCode.Day01

  test "run calculates day 01 text file" do
    assert AdventOfCode.Day01.run() == 4825810
  end
  
  test "calculates the fuel for something close to 0" do
    assert AdventOfCode.Day01.calc_fuel(5, 0) == 0
  end

  test "calculates the fuel accounting for new mass of fuel" do
    assert AdventOfCode.Day01.calc_fuel(1969, 0) == 966
  end
end
