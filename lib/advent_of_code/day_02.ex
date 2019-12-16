defmodule AdventOfCode.Day02 do
  def run() do
    {:ok, cwd} = File.cwd()
    {:ok, contents} = File.read(Path.join([cwd, "lib", "advent_of_code", "day_02.txt"]))
    codes = 
      contents
      |> String.split(",")
      |> Enum.map(&Integer.parse/1)
      |> Enum.map(&elem(&1, 0))
    res = compute(codes, 0, Enum.at(codes, 0))
    IO.inspect(Enum.at(res, 0))
  end

  def compute(codes, _idx, 99), do: codes
  def compute(codes, idx, op_code) do
    register_1_location = Enum.at(codes, idx + 1)
    register_1_value = Enum.at(codes, register_1_location)
    register_2_location = Enum.at(codes, idx + 2)
    register_2_value = Enum.at(codes, register_2_location)
    register_result_location = Enum.at(codes, idx + 3)

    new_list = List.update_at(
      codes, 
      register_result_location, 
      fn _x -> handle_op(op_code, register_1_value, register_2_value) end
    )

    compute(new_list, idx + 4, Enum.at(new_list, idx+4))
  end

  def handle_op(1, reg_one, reg_two), do: reg_one + reg_two
  def handle_op(2, reg_one, reg_two), do: reg_one * reg_two
end
