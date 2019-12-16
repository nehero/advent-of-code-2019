defmodule AdventOfCode.Day02 do
  # 1 add
  # 2 multiply
  # 99 stop
  # n something went wrong
  # done processing -> move 4
  def run() do
    {:ok, cwd} = File.cwd()
    {:ok, contents} = File.read(Path.join([cwd, "lib", "advent_of_code", "day_02.txt"]))
    codes_arr = 
      contents
      |> String.split(",")
      |> Enum.map(&Integer.parse/1)
      |> Enum.map(&elem(&1, 0))

    res = handle_op(codes_arr, 0, Enum.at(codes_arr, 0))
    IO.inspect(Enum.at(res, 0))
  end

  def handle_op(codes, idx, 1) do
    register_1_location = Enum.at(codes, idx + 1)
    register_2_location = Enum.at(codes, idx + 2)
    register_result_location = Enum.at(codes, idx + 3)

    new_list = List.update_at(codes, register_result_location, fn _x -> Enum.at(codes, register_1_location) + Enum.at(codes, register_2_location) end)

    handle_op(new_list, idx + 4, Enum.at(new_list, idx+4))
  end
  
  def handle_op(codes, idx, 2) do
    register_1_location = Enum.at(codes, idx + 1)
    register_2_location = Enum.at(codes, idx + 2)
    register_result_location = Enum.at(codes, idx + 3)

    new_list = List.update_at(codes, register_result_location, fn _x -> Enum.at(codes, register_1_location) * Enum.at(codes, register_2_location) end)

    handle_op(new_list, idx + 4, Enum.at(new_list, idx+4))
  end
  
  def handle_op(codes, _idx, _op_code) do
    codes
  end
end
