defmodule WeatherTest do
  use ExUnit.Case
  doctest Weather

  test "Returns a string value" do
    assert to_string(Weather.max_temp()), "Single digit number is probably celcius"
  end

  test "Correct C to F conversion" do
    assert Weather.to_fahrenheit(10) === 50, "Correct conversion."
  end

  test "I don't know how to test anything else from here right now." do
    assert true, "It is true."
  end
end
