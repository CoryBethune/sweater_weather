require "rails_helper"

RSpec.describe "Brewery Serializer" do
  it "returns a properly formatted json response" do
    headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
    get '/api/v1/breweries', headers: headers, params: { location: "denver", quantity: 5 }
    data = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response).to have_http_status(200)

    expect(data).to be_an(Hash)
    expect(data).to have_key(:data)

    expect(data[:data]).to have_key(:id)
    expect(data[:data][:id]).to eq("null")
    expect(data[:data]).to have_key(:type)
    expect(data[:data][:type]).to eq("breweries")
    expect(data[:data]).to have_key(:attributes)
    expect(data[:data][:attributes]).to be_an(Hash)

    expect(data[:data][:attributes]).to have_key(:destination)
    expect(data[:data][:attributes][:destination]).to be_an(String)
    expect(data[:data][:attributes]).to have_key(:forecast)
    expect(data[:data][:attributes][:forecast]).to be_an(Hash)
    expect(data[:data][:attributes][:forecast]).to have_key(:summary)
    expect(data[:data][:attributes][:forecast][:summary]).to be_an(String)
    expect(data[:data][:attributes][:forecast]).to have_key(:temperature)
    expect(data[:data][:attributes][:forecast][:temperature]).to be_an(String)
    expect(data[:data][:attributes]).to have_key(:breweries)
    expect(data[:data][:attributes]).to be_an(Hash)

    expect(data[:data][:attributes][:breweries].count).to eq(5)
    expect(data[:data][:attributes][:breweries].first).to have_key(:id)
    expect(data[:data][:attributes][:breweries].first[:id]).to be_an(String)
    expect(data[:data][:attributes][:breweries].first).to have_key(:name)
    expect(data[:data][:attributes][:breweries].first[:name]).to be_an(String)
    expect(data[:data][:attributes][:breweries].first).to have_key(:brewery_type)
    expect(data[:data][:attributes][:breweries].first[:brewery_type]).to be_an(String)

    expect(data[:data][:attributes][:breweries].first).to_not have_key(:street)
    expect(data[:data][:attributes][:breweries].first).to_not have_key(:address_2)
    expect(data[:data][:attributes][:breweries].first).to_not have_key(:address_3)
    expect(data[:data][:attributes][:breweries].first).to_not have_key(:city)
    expect(data[:data][:attributes][:breweries].first).to_not have_key(:state)
    expect(data[:data][:attributes][:breweries].first).to_not have_key(:county_province)
    expect(data[:data][:attributes][:breweries].first).to_not have_key(:postal_code)
    expect(data[:data][:attributes][:breweries].first).to_not have_key(:country)
    expect(data[:data][:attributes][:breweries].first).to_not have_key(:longitude)
    expect(data[:data][:attributes][:breweries].first).to_not have_key(:latitude)
    expect(data[:data][:attributes][:breweries].first).to_not have_key(:phone)
    expect(data[:data][:attributes][:breweries].first).to_not have_key(:website_url)
    expect(data[:data][:attributes][:breweries].first).to_not have_key(:updated_at)
    expect(data[:data][:attributes][:breweries].first).to_not have_key(:created_at)

  end
end
