defmodule WeatherTest do
  use ExUnit.Case
  doctest Weather

  test "Returns string" do
    assert Weather.max_temp()  
  end

end
