class ForecastSerializer
  def self.new_forecast(forecast)
    {
      data: {
        id: "null",
        type: "forecast",
        attributes: {
          current_weather: {
            datetime: Time.at(forecast.current[:dt]).to_s,
            sunrise: Time.at(forecast.current[:sunrise]).to_s,
            sunset: Time.at(forecast.current[:sunset]).to_s,
            temp: forecast.current[:temp],
            feels_like: forecast.current[:feels_like],
            humidity: forecast.current[:humidity],
            uvi: forecast.current[:uvi],
            visibility: forecast.current[:visibility],
            conditions: forecast.current[:weather].first[:description],
            icon: forecast.current[:weather].first[:icon]
          },
          daily_weather: forecast.daily[0..4].map do |day|
            {
              date: Time.at(day[:dt]).to_s,
              sunrise: Time.at(day[:sunrise]).to_s,
              sunset: Time.at(day[:sunset]).to_s,
              max_temp: day[:temp][:max],
              min_temp: day[:temp][:min],
              conditions: day[:weather].first[:description],
              icon: day[:weather].first[:icon]
            }
          end,
          hourly_weather: forecast.hourly[0..7].map do |hour|
            {
              time: Time.at(hour[:dt]).strftime("%H:%M:%S"),
              temp: hour[:temp],
              conditions: hour[:weather].first[:description],
              icon: hour[:weather].first[:icon]
            }
          end
        }
      }
    }
  end

end
