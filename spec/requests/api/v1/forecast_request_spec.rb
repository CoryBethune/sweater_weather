require "rails_helper"

RSpec.describe "Forecast Serializer" do
  it "returns a properly formatted json response" do
    headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
    get '/api/v1/forecasts', headers: headers, params: { location: "denver,co" }
    data = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response).to have_http_status(200)

    expect(data).to be_an(Hash)
    expect(data).to have_key(:data)
    expect(data[:data]).to be_an(Hash)
    expect(data[:data]).to have_key(:id)
    expect(data[:data]).to have_key(:type)
    expect(data[:data]).to have_key(:attributes)

    expect(data[:data][:id]).to eq("null")
    expect(data[:data][:type]).to eq("forecast")
    expect(data[:data][:attributes]).to be_an(Hash)
    expect(data[:data][:attributes]).to have_key(:current_weather)
    expect(data[:data][:attributes]).to have_key(:daily_weather)
    expect(data[:data][:attributes]).to have_key(:hourly_weather)

    expect(data[:data][:attributes][:current_weather]).to be_an(Hash)
    expect(data[:data][:attributes][:current_weather]).to have_key(:datetime)
    expect(data[:data][:attributes][:current_weather][:datetime]).to be_an(String)
    expect(data[:data][:attributes][:current_weather]).to have_key(:sunrise)
    expect(data[:data][:attributes][:current_weather][:sunrise]).to be_an(String)
    expect(data[:data][:attributes][:current_weather]).to have_key(:sunset)
    expect(data[:data][:attributes][:current_weather][:sunset]).to be_an(String)
    expect(data[:data][:attributes][:current_weather]).to have_key(:temp)
    expect(data[:data][:attributes][:current_weather][:temp]).to be_an(Float)
    expect(data[:data][:attributes][:current_weather]).to have_key(:feels_like)
    expect(data[:data][:attributes][:current_weather][:feels_like]).to be_an(Float)
    expect(data[:data][:attributes][:current_weather]).to have_key(:humidity)
    expect(data[:data][:attributes][:current_weather][:humidity]).to be_an(Integer)
    expect(data[:data][:attributes][:current_weather]).to have_key(:uvi)
    expect(data[:data][:attributes][:current_weather][:uvi]).to be_an(Integer)
    expect(data[:data][:attributes][:current_weather]).to have_key(:visibility)
    expect(data[:data][:attributes][:current_weather][:visibility]).to be_an(Integer)
    expect(data[:data][:attributes][:current_weather]).to have_key(:conditions)
    expect(data[:data][:attributes][:current_weather][:conditions]).to be_an(String)
    expect(data[:data][:attributes][:current_weather]).to have_key(:icon)
    expect(data[:data][:attributes][:current_weather][:icon]).to be_an(String)

    expect(data[:data][:attributes][:current_weather]).to_not have_key(:pressure)
    expect(data[:data][:attributes][:current_weather]).to_not have_key(:dew_point)
    expect(data[:data][:attributes][:current_weather]).to_not have_key(:clouds)
    expect(data[:data][:attributes][:current_weather]).to_not have_key(:wind_speed)
    expect(data[:data][:attributes][:current_weather]).to_not have_key(:wind_deg)
    expect(data[:data][:attributes][:current_weather]).to_not have_key(:wind_gust)
    expect(data[:data][:attributes][:current_weather]).to_not have_key(:weather)
    expect(data[:data][:attributes][:current_weather]).to_not have_key(:id)
    expect(data[:data][:attributes][:current_weather]).to_not have_key(:main)

    expect(data[:data][:attributes][:daily_weather]).to be_an(Array)
    expect(data[:data][:attributes][:daily_weather].count).to eq(5)
    expect(data[:data][:attributes][:daily_weather].first).to be_an(Hash)
    expect(data[:data][:attributes][:daily_weather].first).to have_key(:date)
    expect(data[:data][:attributes][:daily_weather].first[:date]).to be_an(String)
    expect(data[:data][:attributes][:daily_weather].first).to have_key(:sunrise)
    expect(data[:data][:attributes][:daily_weather].first[:sunrise]).to be_an(String)
    expect(data[:data][:attributes][:daily_weather].first).to have_key(:sunset)
    expect(data[:data][:attributes][:daily_weather].first[:sunset]).to be_an(String)
    expect(data[:data][:attributes][:daily_weather].first).to have_key(:max_temp)
    expect(data[:data][:attributes][:daily_weather].first[:max_temp]).to be_an(Float)
    expect(data[:data][:attributes][:daily_weather].first).to have_key(:min_temp)
    expect(data[:data][:attributes][:daily_weather].first[:min_temp]).to be_an(Float)
    expect(data[:data][:attributes][:daily_weather].first).to have_key(:conditions)
    expect(data[:data][:attributes][:daily_weather].first[:conditions]).to be_an(String)
    expect(data[:data][:attributes][:daily_weather].first).to have_key(:icon)
    expect(data[:data][:attributes][:daily_weather].first[:icon]).to be_an(String)

    expect(data[:data][:attributes][:daily_weather].first).to_not have_key(:moonrise)
    expect(data[:data][:attributes][:daily_weather].first).to_not have_key(:moonset)
    expect(data[:data][:attributes][:daily_weather].first).to_not have_key(:moonphase)
    expect(data[:data][:attributes][:daily_weather].first).to_not have_key(:temp)
    expect(data[:data][:attributes][:daily_weather].first).to_not have_key(:day)
    expect(data[:data][:attributes][:daily_weather].first).to_not have_key(:night)
    expect(data[:data][:attributes][:daily_weather].first).to_not have_key(:eve)
    expect(data[:data][:attributes][:daily_weather].first).to_not have_key(:morn)
    expect(data[:data][:attributes][:daily_weather].first).to_not have_key(:feels_like)
    expect(data[:data][:attributes][:daily_weather].first).to_not have_key(:pressure)
    expect(data[:data][:attributes][:daily_weather].first).to_not have_key(:humidity)
    expect(data[:data][:attributes][:daily_weather].first).to_not have_key(:dew_point)
    expect(data[:data][:attributes][:daily_weather].first).to_not have_key(:wind_speed)
    expect(data[:data][:attributes][:daily_weather].first).to_not have_key(:wind_deg)
    expect(data[:data][:attributes][:daily_weather].first).to_not have_key(:wind_gust)
    expect(data[:data][:attributes][:daily_weather].first).to_not have_key(:weather)
    expect(data[:data][:attributes][:daily_weather].first).to_not have_key(:id)
    expect(data[:data][:attributes][:daily_weather].first).to_not have_key(:main)
    expect(data[:data][:attributes][:daily_weather].first).to_not have_key(:clouds)
    expect(data[:data][:attributes][:daily_weather].first).to_not have_key(:pop)
    expect(data[:data][:attributes][:daily_weather].first).to_not have_key(:rain)
    expect(data[:data][:attributes][:daily_weather].first).to_not have_key(:uvi)

    expect(data[:data][:attributes][:hourly_weather]).to be_an(Array)
    expect(data[:data][:attributes][:hourly_weather].count).to eq(8)
    expect(data[:data][:attributes][:hourly_weather].first).to be_an(Hash)
    expect(data[:data][:attributes][:hourly_weather].first).to have_key(:time)
    expect(data[:data][:attributes][:hourly_weather].first[:time]).to be_an(String)
    expect(data[:data][:attributes][:hourly_weather].first).to have_key(:temp)
    expect(data[:data][:attributes][:hourly_weather].first[:temp]).to be_an(Float)
    expect(data[:data][:attributes][:hourly_weather].first).to have_key(:conditions)
    expect(data[:data][:attributes][:hourly_weather].first[:conditions]).to be_an(String)
    expect(data[:data][:attributes][:hourly_weather].first).to have_key(:icon)
    expect(data[:data][:attributes][:hourly_weather].first[:icon]).to be_an(String)

    expect(data[:data][:attributes][:hourly_weather].first).to_not have_key(:feels_like)
    expect(data[:data][:attributes][:hourly_weather].first).to_not have_key(:pressure)
    expect(data[:data][:attributes][:hourly_weather].first).to_not have_key(:humidity)
    expect(data[:data][:attributes][:hourly_weather].first).to_not have_key(:dew_point)
    expect(data[:data][:attributes][:hourly_weather].first).to_not have_key(:uvi)
    expect(data[:data][:attributes][:hourly_weather].first).to_not have_key(:clouds)
    expect(data[:data][:attributes][:hourly_weather].first).to_not have_key(:visibility)
    expect(data[:data][:attributes][:hourly_weather].first).to_not have_key(:wind_speed)
    expect(data[:data][:attributes][:hourly_weather].first).to_not have_key(:wind_deg)
    expect(data[:data][:attributes][:hourly_weather].first).to_not have_key(:wind_gust)
    expect(data[:data][:attributes][:hourly_weather].first).to_not have_key(:weather)
    expect(data[:data][:attributes][:hourly_weather].first).to_not have_key(:id)
    expect(data[:data][:attributes][:hourly_weather].first).to_not have_key(:main)
    expect(data[:data][:attributes][:hourly_weather].first).to_not have_key(:pop)
  end
end
