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

    expect(data[:data][:attributes][:breweries].first).to have_key(:id)
    expect(data[:data][:attributes][:breweries].first[:id]).to be_an(String)
    expect(data[:data][:attributes][:breweries].first).to have_key(:name)
    expect(data[:data][:attributes][:breweries].first[:name]).to be_an(String)
    expect(data[:data][:attributes][:breweries].first).to have_key(:brewery_type)
    expect(data[:data][:attributes][:breweries].first[:brewery_type]).to be_an(String)
  end
end
