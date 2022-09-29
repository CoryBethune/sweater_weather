require "rails_helper"

RSpec.describe "Road Trip Serializer" do
  it "gets road trip data between two locations" do
    user = User.create(email: "test", password: "test")
    params = ({
      "origin": "Denver,CO",
      "destination": "Pueblo,CO",
      "api_key": user.auth_token
    })
    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/road_trip", headers: headers, params: JSON.generate(params)
    binding.pry
    data = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to eq(201)

    binding.pry



  end
end
