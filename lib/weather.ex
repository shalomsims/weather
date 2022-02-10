defmodule Weather do
  # function for converting to fahrenheit from celcius
  def to_fahrenheit(celcius) do
    celcius = celcius * 9/5 + 32
    celcius
  end

  def max_temp() do
    # returns city name from the user
    city = IO.gets("Input city name (Boise, Salt Lake City, or Los Angeles): ")
    # Trim removes new line character from IO input.
    city = String.trim(city)

    # Takes case insensitive city name and converts to city id. Easier for testing purposes.
    woeid =
      case String.upcase(city) do
        "BOISE" -> 2_366_355
        "LOS ANGELES" -> 2_442_047
        "SALT LAKE CITY" -> 2_487_610
        _ -> 000_000
      end

    # Insert city id into url
    url = "https://www.metaweather.com/api/location/#{woeid}/"

    # Start HTTP request
    HTTPoison.start()
    # Save response body into atom called "body"
    %{body: body} = HTTPoison.get!(url)
    # Return array of daily weather per city with pattern matching
    [data1, data2, data3, data4, data5, data6] = Poison.decode!(body)["consolidated_weather"]
    # Loop through array using recursion
    # Create an list of max_temps
    data = [
      data1["max_temp"],
      data2["max_temp"],
      data3["max_temp"],
      data4["max_temp"],
      data5["max_temp"],
      data6["max_temp"]
    ]

    # Sum of array of numbers reducing values into single float
    sum =
      Enum.reduce(data, 0, fn x, total ->
        (x + total) / 6 |> Float.ceil(2) # Round to 2 decimal places
      end)

    # Convert to F
    sum = to_fahrenheit(sum)
    "The average max temperature of #{city} is: #{sum} degrees."
  end
end
