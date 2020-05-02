defmodule RomanNumerals do
  @doc """
  Convert the number to a roman number.
  """
  @spec numeral(pos_integer) :: String.t()
  def numeral(number) do
    number
    |> convert_to_list()
    |> convert_to_roman_numeral()
  end

  defp convert_to_list(number) do
    number
    |> Integer.to_string()
    |> String.split("", trim: true)
    |> Enum.map(&String.to_integer/1)
  end

  defp convert_to_roman_numeral(number_list) do
    number_list
    |> Enum.reverse()
    |> Enum.zip([1, 10, 100, 1000])
    |> Enum.map(&prepare_decimal/1)
    |> Enum.reverse()
    |> Enum.map(&to_roman/1)
    |> Enum.join()
  end

  defp prepare_decimal({number, multiplier}), do: number * multiplier

  defp to_roman(0), do: ""
  defp to_roman(1), do: "I"
  defp to_roman(2), do: "II"
  defp to_roman(3), do: "III"
  defp to_roman(4), do: "IV"
  defp to_roman(5), do: "V"
  defp to_roman(6), do: "VI"
  defp to_roman(7), do: "VII"
  defp to_roman(8), do: "VIII"
  defp to_roman(9), do: "IX"
  defp to_roman(10), do: "X"
  defp to_roman(20), do: "XX"
  defp to_roman(30), do: "XXX"
  defp to_roman(40), do: "XL"
  defp to_roman(50), do: "L"
  defp to_roman(60), do: "LX"
  defp to_roman(70), do: "LXX"
  defp to_roman(80), do: "LXXX"
  defp to_roman(90), do: "XC"
  defp to_roman(100), do: "C"
  defp to_roman(200), do: "CC"
  defp to_roman(300), do: "CCC"
  defp to_roman(400), do: "CD"
  defp to_roman(500), do: "D"
  defp to_roman(600), do: "DC"
  defp to_roman(700), do: "DCC"
  defp to_roman(800), do: "DCCC"
  defp to_roman(900), do: "CM"
  defp to_roman(1000), do: "M"
  defp to_roman(2000), do: "MM"
  defp to_roman(3000), do: "MMM"
end
